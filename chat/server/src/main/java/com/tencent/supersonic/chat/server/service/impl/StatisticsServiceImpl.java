package com.tencent.supersonic.chat.server.service.impl;

import com.tencent.supersonic.chat.server.persistence.dataobject.StatisticsDO;
import com.tencent.supersonic.chat.server.persistence.repository.StatisticsRepository;
import com.tencent.supersonic.chat.server.service.StatisticsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("statisticsService")
@Slf4j
public class StatisticsServiceImpl implements StatisticsService {

    private StatisticsRepository statisticsRepository;

    public StatisticsServiceImpl(StatisticsRepository statisticsRepository) {
        this.statisticsRepository = statisticsRepository;
    }

    @Async
    @Override
    public void batchSaveStatistics(List<StatisticsDO> list) {
        statisticsRepository.batchSaveStatistics(list);
    }
}