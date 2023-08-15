package com.tencent.supersonic.chat.service.impl;

import com.google.common.collect.Lists;
import com.hankcs.hanlp.seg.common.Term;
import com.tencent.supersonic.chat.api.pojo.SchemaElement;
import com.tencent.supersonic.chat.api.pojo.SchemaElementType;
import com.tencent.supersonic.chat.api.pojo.SemanticSchema;
import com.tencent.supersonic.chat.api.pojo.request.QueryFilter;
import com.tencent.supersonic.chat.api.pojo.request.QueryFilters;
import com.tencent.supersonic.chat.api.pojo.request.QueryReq;
import com.tencent.supersonic.chat.api.pojo.response.SearchResult;
import com.tencent.supersonic.chat.mapper.MatchText;
import com.tencent.supersonic.chat.mapper.ModelInfoStat;
import com.tencent.supersonic.chat.mapper.ModelWithSemanticType;
import com.tencent.supersonic.chat.mapper.SearchMatchStrategy;
import com.tencent.supersonic.chat.service.ChatService;
import com.tencent.supersonic.chat.service.SearchService;
import com.tencent.supersonic.chat.utils.NatureHelper;
import com.tencent.supersonic.knowledge.dictionary.DictWord;
import com.tencent.supersonic.knowledge.dictionary.DictWordType;
import com.tencent.supersonic.knowledge.dictionary.MapResult;
import com.tencent.supersonic.knowledge.service.SchemaService;
import com.tencent.supersonic.knowledge.utils.HanlpHelper;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * search service impl
 */
@Service
@Slf4j
public class SearchServiceImpl implements SearchService {

    private static final int RESULT_SIZE = 10;
    @Autowired
    private SchemaService schemaService;
    @Autowired
    private ChatService chatService;
    @Autowired
    private SearchMatchStrategy searchMatchStrategy;

    @Override
    public List<SearchResult> search(QueryReq queryCtx) {
        String queryText = queryCtx.getQueryText();
        // 1.get meta info
        SemanticSchema semanticSchemaDb = schemaService.getSemanticSchema();
        List<SchemaElement> metricsDb = semanticSchemaDb.getMetrics();
        final Map<Long, String> modelToName = semanticSchemaDb.getModelIdToName();

        // 2.detect by segment
        List<Term> originals = HanlpHelper.getTerms(queryText);
        Map<MatchText, List<MapResult>> regTextMap = searchMatchStrategy.match(queryText, originals,
                queryCtx.getModelId());
        regTextMap.entrySet().stream().forEach(m -> HanlpHelper.transLetterOriginal(m.getValue()));

        // 3.get the most matching data
        Optional<Entry<MatchText, List<MapResult>>> mostSimilarSearchResult = regTextMap.entrySet()
                .stream()
                .filter(entry -> CollectionUtils.isNotEmpty(entry.getValue()))
                .reduce((entry1, entry2) ->
                        entry1.getKey().getDetectSegment().length() >= entry2.getKey().getDetectSegment().length()
                                ? entry1 : entry2);
        log.debug("mostSimilarSearchResult:{}", mostSimilarSearchResult);

        // 4.optimize the results after the query
        if (!mostSimilarSearchResult.isPresent()) {
            return Lists.newArrayList();
        }
        Map.Entry<MatchText, List<MapResult>> searchTextEntry = mostSimilarSearchResult.get();
        log.info("searchTextEntry:{},queryCtx:{}", searchTextEntry, queryCtx);

        Set<SearchResult> searchResults = new LinkedHashSet();
        ModelInfoStat modelStat = NatureHelper.getModelStat(originals);

        List<Long> possibleModels = getPossibleModels(queryCtx, originals, modelStat, queryCtx.getModelId());

        // 4.1 priority dimension metric
        boolean existMetricAndDimension = searchMetricAndDimension(new HashSet<>(possibleModels), modelToName,
                searchTextEntry, searchResults);

        // 4.2 process based on dimension values
        MatchText matchText = searchTextEntry.getKey();
        Map<String, String> natureToNameMap = getNatureToNameMap(searchTextEntry, new HashSet<>(possibleModels));
        log.debug("possibleModels:{},natureToNameMap:{}", possibleModels, natureToNameMap);

        for (Map.Entry<String, String> natureToNameEntry : natureToNameMap.entrySet()) {

            Set<SearchResult> searchResultSet = searchDimensionValue(metricsDb, modelToName,
                    modelStat.getMetricModelCount(), existMetricAndDimension,
                    matchText, natureToNameMap, natureToNameEntry, queryCtx.getQueryFilters());

            searchResults.addAll(searchResultSet);
        }
        return searchResults.stream().limit(RESULT_SIZE).collect(Collectors.toList());
    }

    private List<Long> getPossibleModels(QueryReq queryCtx, List<Term> originals,
            ModelInfoStat modelStat, Long webModelId) {

        if (Objects.nonNull(webModelId) && webModelId > 0) {
            List<Long> result = new ArrayList<>();
            result.add(webModelId);
            return result;
        }

        List<Long> possibleModels = NatureHelper.selectPossibleModels(originals);

        Long contextModel = chatService.getContextModel(queryCtx.getChatId());

        log.debug("possibleModels:{},modelStat:{},contextModel:{}", possibleModels, modelStat, contextModel);

        // If nothing is recognized or only metric are present, then add the contextModel.
        if (nothingOrOnlyMetric(modelStat) && effectiveModel(contextModel)) {
            List<Long> result = new ArrayList<>();
            result.add(contextModel);
            return result;
        }
        return possibleModels;
    }

    private boolean nothingOrOnlyMetric(ModelInfoStat modelStat) {
        return modelStat.getMetricModelCount() >= 0 && modelStat.getDimensionModelCount() <= 0
                && modelStat.getDimensionValueModelCount() <= 0 && modelStat.getModelCount() <= 0;
    }

    private boolean effectiveModel(Long contextModel) {
        return Objects.nonNull(contextModel) && contextModel > 0;
    }

    private Set<SearchResult> searchDimensionValue(List<SchemaElement> metricsDb,
            Map<Long, String> modelToName,
            long metricModelCount,
            boolean existMetricAndDimension,
            MatchText matchText,
            Map<String, String> natureToNameMap,
            Map.Entry<String, String> natureToNameEntry,
            QueryFilters queryFilters) {

        Set<SearchResult> searchResults = new LinkedHashSet();
        String nature = natureToNameEntry.getKey();
        String wordName = natureToNameEntry.getValue();

        Long modelId = NatureHelper.getModelId(nature);
        SchemaElementType schemaElementType = NatureHelper.convertToElementType(nature);

        if (SchemaElementType.ENTITY.equals(schemaElementType)) {
            return searchResults;
        }
        // If there are no metric/dimension, complete the  metric information
        SearchResult searchResult = SearchResult.builder()
                .modelId(modelId)
                .modelName(modelToName.get(modelId))
                .recommend(matchText.getRegText() + wordName)
                .schemaElementType(schemaElementType)
                .subRecommend(wordName)
                .build();
        if (metricModelCount <= 0 && !existMetricAndDimension) {
            if (filterByQueryFilter(wordName, queryFilters)) {
                return searchResults;
            }
            searchResults.add(searchResult);
            int metricSize = getMetricSize(natureToNameMap);
            List<String> metrics = filerMetricsByModel(metricsDb, modelId, metricSize);

            for (String metric : metrics) {
                SearchResult result = SearchResult.builder()
                        .modelId(modelId)
                        .modelName(modelToName.get(modelId))
                        .recommend(matchText.getRegText() + wordName + DictWordType.SPACE + metric)
                        .subRecommend(wordName + DictWordType.SPACE + metric)
                        .isComplete(false)
                        .build();
                searchResults.add(result);
            }
        } else {
            searchResults.add(searchResult);
        }
        return searchResults;
    }

    private int getMetricSize(Map<String, String> natureToNameMap) {
        int metricSize = RESULT_SIZE / (natureToNameMap.entrySet().size());
        if (metricSize <= 1) {
            metricSize = 1;
        }
        return metricSize;
    }

    private boolean filterByQueryFilter(String wordName, QueryFilters queryFilters) {
        if (queryFilters == null || CollectionUtils.isEmpty(queryFilters.getFilters())) {
            return false;
        }
        List<QueryFilter> filters = queryFilters.getFilters();
        for (QueryFilter filter : filters) {
            if (wordName.equalsIgnoreCase(String.valueOf(filter.getValue()))) {
                return false;
            }
        }
        return true;
    }

    protected List<String> filerMetricsByModel(List<SchemaElement> metricsDb, Long model, int metricSize) {
        if (CollectionUtils.isEmpty(metricsDb)) {
            return Lists.newArrayList();
        }
        return metricsDb.stream()
                .filter(mapDO -> Objects.nonNull(mapDO) && model.equals(mapDO.getModel()))
                .sorted(Comparator.comparing(SchemaElement::getUseCnt).reversed())
                .flatMap(entry -> {
                    List<String> result = new ArrayList<>();
                    result.add(entry.getName());
                    return result.stream();
                })
                .limit(metricSize).collect(Collectors.toList());
    }

    /***
     * convert nature to name
     * @param recommendTextListEntry
     * @return
     */
    private Map<String, String> getNatureToNameMap(Map.Entry<MatchText, List<MapResult>> recommendTextListEntry,
            Set<Long> possibleModels) {
        List<MapResult> recommendValues = recommendTextListEntry.getValue();
        return recommendValues.stream()
                .flatMap(entry -> entry.getNatures().stream()
                        .filter(nature -> {
                            if (CollectionUtils.isEmpty(possibleModels)) {
                                return true;
                            }
                            Long model = NatureHelper.getModelId(nature);
                            return possibleModels.contains(model);
                        })
                        .map(nature -> {
                                    DictWord posDO = new DictWord();
                                    posDO.setWord(entry.getName());
                                    posDO.setNature(nature);
                                    return posDO;
                                }
                        )).sorted(Comparator.comparingInt(a -> a.getWord().length()))
                .collect(Collectors.toMap(DictWord::getNature, DictWord::getWord, (value1, value2) -> value1,
                        LinkedHashMap::new));
    }

    private boolean searchMetricAndDimension(Set<Long> possibleModels, Map<Long, String> modelToName,
            Map.Entry<MatchText, List<MapResult>> searchTextEntry, Set<SearchResult> searchResults) {
        boolean existMetric = false;

        MatchText matchText = searchTextEntry.getKey();
        List<MapResult> mapResults = searchTextEntry.getValue();

        for (MapResult mapResult : mapResults) {

            List<ModelWithSemanticType> dimensionMetricClassIds = mapResult.getNatures().stream()
                    .map(nature -> new ModelWithSemanticType(NatureHelper.getModelId(nature),
                            NatureHelper.convertToElementType(nature)))
                    .filter(entry -> matchCondition(entry, possibleModels)).collect(Collectors.toList());

            if (CollectionUtils.isEmpty(dimensionMetricClassIds)) {
                continue;
            }
            for (ModelWithSemanticType modelWithSemanticType : dimensionMetricClassIds) {
                existMetric = true;
                Long modelId = modelWithSemanticType.getModel();
                SchemaElementType semanticType = modelWithSemanticType.getSemanticType();

                SearchResult searchResult = SearchResult.builder()
                        .modelId(modelId)
                        .modelName(modelToName.get(modelId))
                        .recommend(matchText.getRegText() + mapResult.getName())
                        .subRecommend(mapResult.getName())
                        .schemaElementType(semanticType)
                        .build();

                searchResults.add(searchResult);
            }
            log.info("parseResult:{},dimensionMetricClassIds:{},possibleModels:{}", mapResult, dimensionMetricClassIds,
                    possibleModels);
        }
        return existMetric;
    }

    private boolean matchCondition(ModelWithSemanticType entry, Set<Long> possibleModels) {
        if (!(SchemaElementType.METRIC.equals(entry.getSemanticType()) || SchemaElementType.DIMENSION.equals(
                entry.getSemanticType()))) {
            return false;
        }

        if (CollectionUtils.isEmpty(possibleModels)) {
            return true;
        }
        return possibleModels.contains(entry.getModel());
    }
}
