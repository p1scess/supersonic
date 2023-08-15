-- sample user
insert into s2_user (id, `name`, password, display_name, email)
values (1, 'admin', 'admin', 'admin', 'admin@xx.com');
insert into s2_user (id, `name`, password, display_name, email)
values (2, 'jack', '123456', 'jack', 'jack@xx.com');
insert into s2_user (id, `name`, password, display_name, email)
values (3, 'tom', '123456', 'tom', 'tom@xx.com');
insert into s2_user (id, `name`, password, display_name, email)
values (4, 'lucy', '123456', 'lucy', 'lucy@xx.com');
insert into s2_user (id, `name`, password, display_name, email)
values (5, 'alice', '123456', 'alice', 'alice@xx.com');

-- sample models
insert into s2_domain (id, `name`, biz_name, parent_id, status, created_at, created_by, updated_at,
                       updated_by, `admin`, admin_org, viewer, view_org)
VALUES (1, '超音数', 'supersonic', 0, 1, '2023-05-24 00:00:00', 'admin', '2023-05-24 00:00:00',
        'admin', 'admin', '', 'admin,tom,jack', 'admin');
insert into s2_model (id, `name`, biz_name, domain_id, created_at, created_by, updated_at,
                      updated_by, `admin`, admin_org, is_open, viewer, view_org, entity)
VALUES (1, '超音数', 'supersonic', 1, '2023-05-24 00:00:00', 'admin', '2023-05-24 00:00:00', 'admin',
        'admin', '', 0, 'admin,tom,jack', 'admin', '');
insert into s2_model (id, `name`, biz_name, domain_id, created_at, created_by, updated_at,
                      updated_by, `admin`, admin_org, is_open, viewer, view_org, entity)
VALUES (2, '艺人库', 'singer', 1, '2023-05-24 00:00:00', 'admin', '2023-05-24 00:00:00', 'admin',
        'admin', '', 0, 'admin,tom,jack', 'admin', '{"entityId": 7, "names": ["歌手", "艺人"]}');
insert into s2_database (id, domain_id, `name`, description, `type`, config, created_at, created_by,
                         updated_at, updated_by)
VALUES (1, 1, 'H2数据实例', '', 'h2',
        '{"password":"semantic","url":"jdbc:h2:mem:semantic;DATABASE_TO_UPPER=false","userName":"root"}',
        '2023-05-24 00:00:00', 'admin', '2023-05-24 00:00:00', 'admin');
insert into s2_datasource (id, model_id, `name`, biz_name, description, database_id,
                           datasource_detail, created_at, created_by, updated_at, updated_by)
VALUES (1, 1, '停留时长统计', 's2_stay_time_statis', '停留时长统计', 1,
        '{"dimensions":[{"bizName":"imp_date","dateFormat":"yyyy-MM-dd","expr":"imp_date","isCreateDimension":0,"type":"time","typeParams":{"isPrimary":"true","timeGranularity":"day"}},{"bizName":"page","dateFormat":"yyyy-MM-dd","expr":"page","isCreateDimension":0,"type":"categorical"}],"identifiers":[{"bizName":"user_name","name":"用户名","type":"primary"}],"measures":[{"agg":"sum","bizName":"s2_stay_time_statis_stay_hours","expr":"stay_hours","isCreateMetric":1,"name":"停留时长"}],"queryType":"sql_query","sqlQuery":"SELECT imp_date, page,user_name,stay_hours FROM s2_stay_time_statis"}',
        '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_datasource (id, model_id, `name`, biz_name, description, database_id,
                           datasource_detail, created_at, created_by, updated_at, updated_by)
VALUES (2, 1, 'PVUV统计', 's2_pv_uv_statis', 'PVUV统计', 1,
        '{"dimensions":[{"bizName":"imp_date","dateFormat":"yyyy-MM-dd","expr":"imp_date","isCreateDimension":0,"type":"time","typeParams":{"isPrimary":"true","timeGranularity":"day"}},{"bizName":"page","dateFormat":"yyyy-MM-dd","expr":"page","isCreateDimension":0,"type":"categorical"}],"identifiers":[{"bizName":"user_name","name":"用户名","type":"primary"}],"measures":[{"agg":"sum","bizName":"s2_pv_uv_statis_pv","expr":"pv","isCreateMetric":1,"name":"访问次数"},{"agg":"count_distinct","bizName":"s2_pv_uv_statis_uv","expr":"uv","isCreateMetric":1,"name":"访问人数"}],"queryType":"sql_query","sqlQuery":"SELECT imp_date, user_name,page,1 as pv, user_name as uv FROM s2_pv_uv_statis"}',
        '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_datasource (id, model_id, `name`, biz_name, description, database_id,
                           datasource_detail, created_at, created_by, updated_at, updated_by)
VALUES (3, 1, '用户部门', 'user_department', '用户部门', 1,
        '{"dimensions":[{"bizName":"department","dateFormat":"yyyy-MM-dd","expr":"department","isCreateDimension":1,"name":"部门","type":"categorical"}],"identifiers":[{"bizName":"user_name","name":"用户名","type":"primary"}],"measures":[],"queryType":"sql_query","sqlQuery":"SELECT user_name,department FROM s2_user_department"}',
        '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_datasource (id, model_id, `name`, biz_name, description, database_id,
                           datasource_detail, created_at, created_by, updated_at, updated_by)
VALUES (4, 2, '艺人库', 'singer', '艺人库', 1,
        '{"dimensions":[{"bizName":"imp_date","dateFormat":"yyyy-MM-dd","expr":"imp_date","isCreateDimension":0,"type":"time","typeParams":{"isPrimary":"true","timeGranularity":"day"}},{"bizName":"act_area","dateFormat":"yyyy-MM-dd","expr":"act_area","isCreateDimension":1,"name":"活跃区域","type":"categorical"},{"bizName":"song_name","dateFormat":"yyyy-MM-dd","expr":"song_name","isCreateDimension":1,"name":"代表作","type":"categorical"},{"bizName":"genre","dateFormat":"yyyy-MM-dd","expr":"genre","isCreateDimension":1,"name":"风格","type":"categorical"}],"identifiers":[{"bizName":"singer_name","name":"歌手名","type":"primary"}],"measures":[{"agg":"sum","bizName":"music_down_cnt","expr":"down_cnt","isCreateMetric":1,"name":"下载量"},{"agg":"sum","bizName":"music_js_play_cnt","expr":"js_play_cnt","isCreateMetric":1,"name":"播放量"},{"agg":"sum","bizName":"music_favor_cnt","expr":"favor_cnt","isCreateMetric":1,"name":"收藏量"}],"queryType":"sql_query","sqlQuery":"SELECT imp_date,singer_name,act_area,song_name,genre,js_play_cnt,down_cnt,favor_cnt FROM singer "}',
        '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_datasource_rela (id, model_id, `datasource_from`, datasource_to, join_key,
                                created_at, created_by, updated_at, updated_by)
VALUES (1, 1, 1, 2, 'user_name', '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_datasource_rela (id, model_id, `datasource_from`, datasource_to, join_key,
                                created_at, created_by, updated_at, updated_by)
VALUES (2, 1, 1, 3, 'user_name', '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_datasource_rela (id, model_id, `datasource_from`, datasource_to, join_key,
                                created_at, created_by, updated_at, updated_by)
VALUES (3, 1, 2, 3, 'user_name', '2023-05-25 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type, dim_value_maps)
VALUES (1, 1, 3, '部门', 'department', '部门', 1, 0, 'categorical', NULL, 'department',
        '2023-05-24 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY',
        '[{"alias":["人力资源","人力"],"bizName":"人力资源","techName":"HR"},{"alias":["营销","销售"],"bizName":"营销部门","techName":"sales"}]');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type)
VALUES (2, 1, 1, '用户名', 'user_name', '用户名', 1, 0, 'primary', NULL, 'user_name',
        '2023-05-24 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type)
VALUES (3, 1, 2, '页面', 'page', '页面', 1, 2, 'categorical', NULL, 'page', '2023-05-24 00:00:00',
        'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type)
VALUES (4, 2, 4, '活跃区域', 'act_area', '活跃区域', 1, 2, 'categorical', NULL, 'act_area',
        '2023-05-24 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type)
VALUES (5, 2, 4, '代表作', 'song_name', '代表作', 1, 2, 'categorical', NULL, 'song_name',
        '2023-05-24 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type)
VALUES (6, 2, 4, '风格', 'genre', '风格', 1, 2, 'categorical', NULL, 'genre', '2023-05-24 00:00:00',
        'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY');
insert into s2_dimension (id, model_id, datasource_id, `name`, biz_name, description, status,
                          sensitive_level, `type`, type_params, expr, created_at, created_by,
                          updated_at, updated_by, semantic_type)
VALUES (7, 2, 4, '歌手名', 'singer_name', '歌手名', 1, 2, 'categorical', NULL, 'singer_name',
        '2023-05-24 00:00:00', 'admin', '2023-05-25 00:00:00', 'admin', 'CATEGORY');
insert into s2_metric (id, model_id, `name`, biz_name, description, status, sensitive_level, `type`,
                       type_params, created_at, created_by, updated_at, updated_by,
                       data_format_type, data_format)
VALUES (1, 1, '停留时长', 'stay_hours', '停留时长', 1, 2, 'ATOMIC',
        '{"expr":"s2_stay_time_statis_stay_hours","measures":[{"agg":"sum","expr":"stay_hours","isCreateMetric":1,"datasourceId":1,"bizName":"s2_stay_time_statis_stay_hours","name":"s2_stay_time_statis_stay_hours"}]}',
        '2023-05-24 17:00:00', 'admin', '2023-05-25 00:00:00', 'admin', NULL, NULL);
insert into s2_metric (id, model_id, `name`, biz_name, description, status, sensitive_level, `type`,
                       type_params, created_at, created_by, updated_at, updated_by,
                       data_format_type, data_format)
VALUES (2, 1, '访问次数', 'pv', '访问次数', 1, 0, 'ATOMIC',
        '	{"expr":"s2_pv_uv_statis_pv","measures":[{"agg":"sum","bizName":"s2_pv_uv_statis_pv","datasourceId":2,"expr":"pv","isCreateMetric":1,"name":"s2_pv_uv_statis_pv"}]}',
        '2023-05-24 17:00:00', 'admin', '2023-05-25 00:00:00', 'admin', NULL, NULL);
insert into s2_metric (id, model_id, `name`, biz_name, description, status, sensitive_level, `type`,
                       type_params, created_at, created_by, updated_at, updated_by,
                       data_format_type, data_format)
VALUES (3, 1, '访问人数', 'uv', '访问人数', 1, 0, 'ATOMIC',
        '	{"expr":"s2_pv_uv_statis_uv","measures":[{"agg":"count_distinct","bizName":"s2_pv_uv_statis_uv","datasourceId":2,"expr":"uv","isCreateMetric":1,"name":"s2_pv_uv_statis_uv"}]}',
        '2023-05-24 17:00:00', 'admin', '2023-05-25 00:00:00', 'admin', NULL, NULL);
insert into s2_metric (id, model_id, `name`, biz_name, description, status, sensitive_level, `type`,
                       type_params, created_at, created_by, updated_at, updated_by,
                       data_format_type, data_format)
VALUES (4, 2, '播放量', 'js_play_cnt', '播放量', 1, 2, 'ATOMIC',
        '{"expr":"music_js_play_cnt","measures":[{"agg":"sum","expr":"js_play_cnt","isCreateMetric":1,"datasourceId":4,"bizName":"music_js_play_cnt","name":"music_js_play_cnt"}]}',
        '2023-05-24 17:00:00', 'admin', '2023-05-25 00:00:00', 'admin', NULL, NULL);
insert into s2_metric (id, model_id, `name`, biz_name, description, status, sensitive_level, `type`,
                       type_params, created_at, created_by, updated_at, updated_by,
                       data_format_type, data_format)
VALUES (5, 2, '下载量', 'down_cnt', '下载量', 1, 0, 'ATOMIC',
        '	{"expr":"music_down_cnt","measures":[{"agg":"sum","bizName":"music_down_cnt","datasourceId":4,"expr":"down_cnt","isCreateMetric":1,"name":"music_down_cnt"}]}',
        '2023-05-24 17:00:00', 'admin', '2023-05-25 00:00:00', 'admin', NULL, NULL);
insert into s2_metric (id, model_id, `name`, biz_name, description, status, sensitive_level, `type`,
                       type_params, created_at, created_by, updated_at, updated_by,
                       data_format_type, data_format)
VALUES (6, 2, '收藏量', 'favor_cnt', '收藏量', 1, 0, 'ATOMIC',
        '	{"expr":"music_favor_cnt","measures":[{"agg":"sum","bizName":"music_favor_cnt","datasourceId":4,"expr":"favor_cnt","isCreateMetric":1,"name":"music_favor_cnt"}]}',
        '2023-05-24 17:00:00', 'admin', '2023-05-25 00:00:00', 'admin', NULL, NULL);

insert into s2_available_date_info(`item_id`, `type`, `date_format`, `start_date`, `end_date`,
                                   `unavailable_date`, `created_at`, `created_by`, `updated_at`,
                                   `updated_by`)
values (1, 'dimension', 'yyyy-MM-dd', DATEADD('DAY', -28, CURRENT_DATE()),
        DATEADD('DAY', -1, CURRENT_DATE()), '[]', '2023-06-01', 'admin', '2023-06-01', 'admin');
insert into s2_available_date_info(`item_id`, `type`, `date_format`, `start_date`, `end_date`,
                                   `unavailable_date`, `created_at`, `created_by`, `updated_at`,
                                   `updated_by`)
values (2, 'dimension', 'yyyy-MM-dd', DATEADD('DAY', -28, CURRENT_DATE()),
        DATEADD('DAY', -1, CURRENT_DATE()), '[]', '2023-06-01', 'admin', '2023-06-01', 'admin');
insert into s2_available_date_info(`item_id`, `type`, `date_format`, `start_date`, `end_date`,
                                   `unavailable_date`, `created_at`, `created_by`, `updated_at`,
                                   `updated_by`)
values (3, 'dimension', 'yyyy-MM-dd', DATEADD('DAY', -28, CURRENT_DATE()),
        DATEADD('DAY', -1, CURRENT_DATE()), '[]', '2023-06-01', 'admin', '2023-06-01', 'admin');

insert into s2_auth_groups (group_id, config)
values (1,
        '{"modelId":"1","name":"admin-permission","groupId":1,"authRules":[{"metrics":["stay_hours"],"dimensions":["page"]}],"dimensionFilters":[""],"dimensionFilterDescription":"授权admin 页面和停留时长权限","authorizedUsers":["admin"],"authorizedDepartmentIds":[]}');
insert into s2_auth_groups (group_id, config)
values (2,
        '{"modelId":"1","name":"tom_sales_permission","groupId":2,"authRules":[{"metrics":["stay_hours"],"dimensions":["page"]}],"dimensionFilters":["department in (''sales'')"],"dimensionFilterDescription":"开通 tom sales部门权限", "authorizedUsers":["tom"],"authorizedDepartmentIds":[]}');

-- sample data
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), '周杰伦', '中国', '青花瓷', '流行', 1000000, 1000000, 1000000);

INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), '陈奕迅', '中国', '爱情转移', '激情', 1000000, 1000000, 1000000);

INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), '林俊杰', '中国', '美人鱼', '爱情', 1000000, 1000000, 1000000);

INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), '张碧晨', '中国', '光的方向', '流行', 1000000, 1000000, 1000000);

INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), '程响', '中国', '人间烟火', '国风', 1000000, 1000000, 1000000);

INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);
INSERT INTO singer (imp_date, singer_name, act_area, song_name, genre, js_play_cnt, down_cnt,
                    favor_cnt)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'Taylor Swift
', '欧美', 'Love Story', '爱情', 1000000, 1000000, 1000000);

---demo data for semantic and chat
insert into s2_user_department (user_name, department)
values ('jack', 'HR');

insert into s2_user_department (user_name, department)
values ('jack', 'HR');
insert into s2_user_department (user_name, department)
values ('tom', 'sales');
insert into s2_user_department (user_name, department)
values ('lucy', 'marketing');
insert into s2_user_department (user_name, department)
values ('john', 'strategy');
insert into s2_user_department (user_name, department)
values ('alice', 'sales');
insert into s2_user_department (user_name, department)
values ('dean', 'marketing');


INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -5, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'jack', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'jack', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'lucy', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'tom', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'alice', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'john', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'dean', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'lucy', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'tom', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'jack', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', 'p2');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'lucy', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', 'p1');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', 'p3');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'alice', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', 'p4');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', 'p5');
INSERT INTO s2_pv_uv_statis (imp_date, user_name, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'tom', 'p4');



INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.7636857512911863', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'dean', '0.17663327393462436', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', '0.38943688941552057', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', '0.2715819955225307', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', '0.9358210273119568', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', '0.9364586435510802', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.9707723036513162', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', '0.8497763866782723', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', '0.15504417761372413', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.9507563118298399', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', '0.9746364180572994', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', '0.12869214941133378', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'lucy', '0.3024970533288409', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'tom', '0.6639702099980812', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'lucy', '0.4929901454858626', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', '0.06853040276026445', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.8488086078299616', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'lucy', '0.8589111177125592', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', '0.5576357066482228', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', '0.8047888670006846', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'john', '0.766944548494366', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', '0.5280072184505449', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', '0.9693343356046343', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', '0.12805203958456424', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'dean', '0.16963603387027637', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', '0.5901202956521101', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', '0.12710364646712236', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', '0.6346530909156196', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', '0.12461289103639872', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'john', '0.9863947334662437', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', '0.48899961064192987', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'alice', '0.5382796792688207', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'dean', '0.3506568687014143', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', '0.8633072449771709', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', '0.13999135315363687', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', '0.07258740493845894', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'jack', '0.5244413940436958', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', '0.13258670732966138', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'john', '0.6015982054464575', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'lucy', '0.05513158944480323', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'alice', '0.6707121735296985', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'jack', '0.9330440339006469', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'dean', '0.5630674323371607', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'dean', '0.8720647566229917', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.8331899070546519', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'alice', '0.6712876436249856', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', '0.6694409980332703', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'john', '0.3703307480606334', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'dean', '0.775368688472696', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'lucy', '0.9151205443267096', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', '0.09543108823305857', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'dean', '0.7893992120771057', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', '0.5119923080070498', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'lucy', '0.49906724167974936', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', '0.046258282700961884', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'dean', '0.44843595680103954', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', '0.7743935471689718', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.5855299615656824', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'lucy', '0.9412963512379853', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', '0.8383247587082538', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'lucy', '0.14517876867236124', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', '0.9327229861441061', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.19042326582894153', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', '0.6029067818254513', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', '0.21715964747214422', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'lucy', '0.34259842721045974', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', '0.7064419016593382', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'lucy', '0.5725636566517865', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'john', '0.22332539583809208', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', '0.8049036189055911', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'alice', '0.6029674758974956', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', '0.11884976360561716', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'alice', '0.7124916829130662', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', '0.5893693718556829', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', '0.602073304496253', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'tom', '0.10491061160039927', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'dean', '0.9006548872378379', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', '0.8545144244288455', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'jack', '0.16915384987875726', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', '0.2271640700690446', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', '0.7807518577160636', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'john', '0.8919859648888653', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', '0.1564450687270359', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', '0.5840549187653847', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'tom', '0.2213255596777869', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', '0.07868261880306426', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', '0.07710010861455818', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', '0.5131249730162654', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.5035035055368601', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.8996978291173905', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', '0.057442290722216294', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', '0.6443079066865616', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'lucy', '0.7398098480748726', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'dean', '0.9835694815034591', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'john', '0.9879213445635557', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', '0.4020136688147111', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'lucy', '0.6698797170128024', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.17325132416789113', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'lucy', '0.5784229486763606', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'tom', '0.9185978183932058', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', '0.5474783153973963', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', '0.9730731954700215', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', '0.5390873359288765', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'alice', '0.20522241320887713', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'alice', '0.4088233242325021', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', '0.7608047695853417', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.2749731221085713', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'john', '0.06154055374702494', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.460668002022406', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', '0.4474746325306228', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', '0.5761666885467472', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'dean', '0.33233441360339655', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', '0.7426534909874778', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'tom', '0.5841437875889118', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', '0.2818296500094526', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'tom', '0.8670888843915217', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'alice', '0.5249294365740248', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', '0.5483356748008438', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'dean', '0.7278566847412673', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.6779976902157362', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', '0.09995341651736978', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'jack', '0.4528538159233879', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', '0.5870756885301056', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'tom', '0.9842091927290255', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'tom', '0.04580936015706816', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'alice', '0.8814678270145769', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'john', '0.06517379256096412', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', '0.8769832364187129', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'dean', '0.584562279025023', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', '0.8102404090621375', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', '0.11481653429176686', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', '0.43422888918962554', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'lucy', '0.0684414272594508', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'alice', '0.976546463969412', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.617906858141431', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'jack', '0.08663740247579998', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', '0.7124944606691416', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'alice', '0.1321700521239627', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'jack', '0.3078946609431664', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', '0.6149442855237194', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'alice', '0.5963801306980994', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'lucy', '0.6999542038973406', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'john', '0.4599112653446624', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', '0.20300901401048832', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'john', '0.39989705958717037', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', '0.2486378364940327', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', '0.16880398079144077', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', '0.73927288385526', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', '0.8645283506689198', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', '0.3266940826759587', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', '0.9195490073037541', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', '0.9452523036658287', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', '0.21269683438120535', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.7377502855387184', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', '0.38981597634408716', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.7001799391999863', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', '0.6616720024008785', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'dean', '0.497721735058096', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'jack', '0.22255613760959603', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', '0.05247640233319417', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'dean', '0.27237572107833363', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'alice', '0.9529452406380252', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'alice', '0.28243045060463157', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'lucy', '0.17880444250082506', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', '0.035050038002381156', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', '0.840803223728221', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.5318457377361356', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.9280332892460665', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'lucy', '0.752354382202208', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'dean', '0.1866528331789219', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'alice', '0.7016165545791373', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', '0.4191547989960899', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', '0.7025516699007639', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'john', '0.6160127317884274', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'alice', '0.91223094958137', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'tom', '0.4383056089013998', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'jack', '0.595750781166582', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'lucy', '0.9472349338730268', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'jack', '0.0519104588842193', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', '0.48043983034526205', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'lucy', '0.14754707786497478', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'alice', '0.36124288370035695', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'dean', '0.21777919493494613', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', '0.22637666702475057', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', '0.9378215576942598', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', '0.3309229261144562', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'alice', '0.7602880453727515', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'alice', '0.9470462487873785', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.6770215935547629', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', '0.1586074803669385', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'lucy', '0.2754855564794071', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', '0.8355347738454384', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'alice', '0.7251813505573811', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'jack', '0.006606625589642534', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', '0.304832277753024', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.026368662837989554', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'tom', '0.6855977520602776', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'tom', '0.8193746826441749', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.021179295102459972', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', '0.1533849522536005', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', '0.18893553542301778', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.39870999343833624', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'john', '0.9985665103520182', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', '0.6961441157700171', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.9861933923851885', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'tom', '0.993076500099477', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', '0.4320547269058953', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', '0.18441071030375877', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', '0.1501504986117118', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', '0.252021845734527', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'lucy', '0.24442701577183745', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.07563738855797564', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', '0.34247820646440985', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.9456979276862031', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', '0.19494357263973816', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', '0.9371493867882469', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', '0.6136241316589367', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'alice', '0.8922330760877784', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'dean', '0.9001986074661864', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'tom', '0.4889702884422866', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', '0.2689551234431401', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', '0.5223573993758465', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'tom', '0.05042295556527243', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', '0.2717147121880483', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', '0.7397093309370814', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'dean', '0.157064341631733', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'lucy', '0.7213399784998017', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'tom', '0.764081440588005', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.7514070600074144', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', '0.611647412825278', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'tom', '0.6600796877195596', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'john', '0.8942204153751679', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.07398121085929721', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'dean', '0.1652506990439564', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.5849759516111703', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', '0.1672502732600889', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'tom', '0.7836135556233219', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'dean', '0.26181269644936356', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'alice', '0.6577275876355586', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'tom', '0.3067293364197956', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', '0.8608288543866495', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', '0.814283434116926', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'jack', '0.33993584425872936', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'john', '0.010812798859160089', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.5156558224263926', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'jack', '0.46320035330198406', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', '0.2651020283994786', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.42467241545664147', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', '0.3695905136678498', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'tom', '0.15269122123348644', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', '0.6755688670583248', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'jack', '0.39064306179528907', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'john', '0.36479296691952023', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'lucy', '0.5069249157662691', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', '0.4785315495532231', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', '0.7582526218052175', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.42064109605717914', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'dean', '0.5587757581237022', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'lucy', '0.3561686564964428', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.7101688305173135', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'dean', '0.6518061375522985', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.7564485884156583', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', '0.36531347293134464', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'jack', '0.5201689359070235', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'john', '0.7138792929290383', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'tom', '0.9751003716333827', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', '0.5281906318027629', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', '0.6291356541485003', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'jack', '0.1938712974807698', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'john', '0.6267850210775459', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', '0.4469970592043767', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', '0.7690659124175409', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'jack', '0.13335067838090386', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'jack', '0.2966621725922035', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'john', '0.5740481445089863', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'alice', '0.838028890036331', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', '0.8094354537628714', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'alice', '0.5552924586108698', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', '0.49150373927678315', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', '0.7264346889377966', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'alice', '0.9292830287297702', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.3905616258240767', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.15912349648571666', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'alice', '0.6030082006630102', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'lucy', '0.8712354035243679', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.7685306377211826', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', '0.2869913942171415', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', '0.7142615166855639', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', '0.5625978475154423', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', '0.13611601734791123', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'alice', '0.6977333962685311', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'jack', '0.35140477709778295', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', '0.8805119222967716', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.7014124236538637', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'alice', '0.12759538003439375', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', '0.7515403792213445', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'lucy', '0.03700239289885987', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'tom', '0.31674618364630946', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'dean', '0.4491378834800146', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', '0.6742764131652571', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'lucy', '0.5286362221140248', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', '0.007890326473113496', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'alice', '0.8046560540950831', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.7198364371127147', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'tom', '0.7400546712169153', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', '0.16859870460868698', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', '0.8462852684569557', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', '0.010211452005474353', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'alice', '0.8617802368201087', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', '0.21667479046797633', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', '0.8667689615468714', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'jack', '0.16140709875863557', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.16713368182304666', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'lucy', '0.8957484629768053', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'tom', '0.457835758220534', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', '0.9435170960198477', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'jack', '0.9699253608913104', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', '0.2309897429566834', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'lucy', '0.7879705066452681', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', '0.20795869239817255', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', '0.4110352469382019', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'jack', '0.4979592772533561', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', '0.18810865430947044', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'tom', '0.5001240246982048', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'jack', '0.08341934160029707', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', '0.04812784841651041', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', '0.4655982693269717', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'dean', '0.8539357978460663', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'john', '0.9649541785823592', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', '0.8243635648047365', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', '0.929949719929735', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'john', '0.055983276861168996', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'tom', '0.07845430274829746', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'alice', '0.28257674222099116', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.1578419214960578', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', '0.7853118484860825', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'lucy', '0.20790127125904156', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', '0.8650538395535204', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.902116091225815', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'lucy', '0.48542770770171373', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', '0.16725337150113984', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'lucy', '0.3157444453259486', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', '0.565727220131555', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'jack', '0.2531688065358064', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', '0.9191434620980499', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', '0.9224628853942058', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'jack', '0.3256288410730337', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'jack', '0.9709152566761661', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.9794173893522709', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'alice', '0.16582064407977237', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'alice', '0.2652519246960059', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'alice', '0.04092489871261762', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', '0.3020444893927522', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'john', '0.4655412764350543', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'dean', '0.9226436424888846', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', '0.4707663393012884', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', '0.3277970119243966', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'tom', '0.4730675479071551', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'jack', '0.10261940477901954', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'alice', '0.4148892373198616', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.2877219827348403', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'tom', '0.16212409974675845', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.9567425121214822', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'lucy', '0.19795350030679149', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', '0.6954199597749198', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'alice', '0.32884293488801164', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'john', '0.4789917995407148', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'lucy', '0.0698927593996298', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', '0.3352267723792438', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'tom', '0.8085116661598726', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', '0.17515060210353794', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.6006963088370202', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', '0.8794167536704468', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.04091469320757368', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'tom', '0.6709116812690366', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', '0.4850646101328463', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'tom', '0.547488212623346', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'dean', '0.6301717145008927', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'lucy', '0.06123370093612068', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'alice', '0.2545600223228257', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'john', '0.28355287519210803', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.3231348374147818', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.4585172495754063', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', '0.7893945285152268', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'john', '0.6810596014794181', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'john', '0.7136031244915907', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'jack', '0.259734039051829', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', '0.7759518703827996', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'john', '0.06288891046833589', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'dean', '0.8242980461154241', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'tom', '0.36590300307021595', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'lucy', '0.20254092528445444', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', '0.5427356081880325', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.1467846603517391', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.8975527268892767', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'dean', '0.3483541520806722', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', '0.6922544855316723', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.3690185253006011', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'tom', '0.7564541265683148', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', '0.3634152133342695', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'tom', '0.33740378933701987', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'lucy', '0.7942640738315301', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', '0.7894896778233523', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'jack', '0.7153281477198108', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'tom', '0.5546359859065261', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'john', '0.7727157385809087', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'dean', '0.8707097754747494', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'john', '0.3873936520764878', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', '0.7590305068820566', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'john', '0.512826935863365', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'john', '0.19120284727846926', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'dean', '0.5382693105670825', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'john', '0.826241649014955', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'lucy', '0.6133080470571559', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'jack', '0.6452862617544055', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'lucy', '0.3025772179023586', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', '4.709864550322962E-4', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', '0.024816355013726588', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -6, CURRENT_DATE()), 'alice', '0.8407500495605565', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'alice', '0.8420879584266481', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'lucy', '0.2719224735814776', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'tom', '0.8939712577294938', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'dean', '0.8086189323362379', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'tom', '0.6063415085381448', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'tom', '0.39783242658234674', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'tom', '0.6085577206028068', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'tom', '0.5154289424127074', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'john', '0.878436600887031', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', '0.5577906295015223', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'lucy', '0.1143260282925247', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'jack', '0.312756557275364', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', '0.05548807854726956', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'tom', '0.12140791431139175', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.23897628700410234', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', '0.22223137342481392', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', '0.12379891645900953', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'john', '0.33729146112854247', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.8816768640060831', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -21, CURRENT_DATE()), 'jack', '0.6301700633426532', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -3, CURRENT_DATE()), 'alice', '0.4566295223861714', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'john', '0.1777378523933678', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', '0.8163769471165477', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'tom', '0.4380805149704541', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'alice', '0.2987018822475964', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'dean', '0.6726495645391617', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', '0.8394327461109705', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'dean', '0.820512945501936', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'tom', '0.1580105370757261', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -20, CURRENT_DATE()), 'jack', '0.9961450897279505', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -7, CURRENT_DATE()), 'john', '0.6574891890500061', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'john', '0.5201205570085158', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'alice', '0.2445069633928285', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -17, CURRENT_DATE()), 'john', '0.3155229654901067', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'jack', '0.3665971881269575', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'john', '0.5544977915912215', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'tom', '0.15978771803015113', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'lucy', '0.038128748344929186', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'tom', '0.49026304025118594', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.5166802080526571', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', '0.22568230066042194', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -28, CURRENT_DATE()), 'john', '0.9888634109849955', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'jack', '0.21022365182102054', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'john', '0.47052993358031114', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.25686122383263454', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.18929054223320718', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'jack', '0.7925339862375451', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -12, CURRENT_DATE()), 'john', '0.12613308249498645', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.7381524971311578', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -4, CURRENT_DATE()), 'alice', '0.08639585437319919', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -27, CURRENT_DATE()), 'tom', '0.9519897106846164', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', '0.33446548574801926', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'jack', '0.40667134603483324', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -10, CURRENT_DATE()), 'jack', '0.17100718420628735', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -26, CURRENT_DATE()), 'lucy', '0.4445585525686886', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'tom', '0.47372916928883013', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'john', '0.19826861093848824', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -13, CURRENT_DATE()), 'john', '0.13679268112019338', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -24, CURRENT_DATE()), 'tom', '0.9805515708224516', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'dean', '0.4738376165601095', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'dean', '0.5739441073158964', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'alice', '0.8428505498030564', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'lucy', '0.32655416551155336', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -14, CURRENT_DATE()), 'tom', '0.7055736367780644', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -2, CURRENT_DATE()), 'tom', '0.9621355090189875', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -9, CURRENT_DATE()), 'jack', '0.9665339161730553', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'dean', '0.44309781869697995', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -18, CURRENT_DATE()), 'tom', '0.8651220802537761', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', '0.6451892308277741', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -16, CURRENT_DATE()), 'dean', '0.056797307451316725', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'lucy', '0.6847604118085596', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -23, CURRENT_DATE()), 'jack', '0.13428051757364667', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -29, CURRENT_DATE()), 'lucy', '0.9814797176951834', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -11, CURRENT_DATE()), 'tom', '0.7386074051153445', 'p3');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -25, CURRENT_DATE()), 'alice', '0.4825297824657663', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', '0.06608870508231235', 'p5');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -22, CURRENT_DATE()), 'lucy', '0.6278253028988848', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -1, CURRENT_DATE()), 'alice', '0.6705580511822682', 'p1');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -19, CURRENT_DATE()), 'alice', '0.8131712486302015', 'p2');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -15, CURRENT_DATE()), 'lucy', '0.8124302447925607', 'p4');
INSERT INTO s2_stay_time_statis (imp_date, user_name, stay_hours, page)
VALUES (DATEADD('DAY', -8, CURRENT_DATE()), 'lucy', '0.039935860913407284', 'p2');
