/*
Navicat MySQL Data Transfer

Source Server         : 192.168.12.123
Source Server Version : 80015
Source Host           : 192.168.12.123:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2022-08-02 13:32:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `e_device`
-- ----------------------------
DROP TABLE IF EXISTS `e_device`;
CREATE TABLE `e_device` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `updated` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `project_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构编号',
  `opc_items` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '设备采集数据项',
  `org_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of e_device
-- ----------------------------
INSERT INTO `e_device` VALUES ('e8e37989909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷却塔2#', 'd0965acd64e846238f60d4035ae95507', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', '09828765ed6a4a5e9d854822c2e6ab31');
INSERT INTO `e_device` VALUES ('e8ea7612909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷却塔3#', 'd0965acd64e846238f60d4035ae95507', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', '09828765ed6a4a5e9d854822c2e6ab31');
INSERT INTO `e_device` VALUES ('e8f036c0909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷却水泵1#', 'd0965acd64e846238f60d4035ae95507', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', '09828765ed6a4a5e9d854822c2e6ab31');
INSERT INTO `e_device` VALUES ('e8fa35d0909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷却水泵2#', 'ba5813de902c47db93520677f7df989d', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', 'dea8536b9d4041209ce8e0a77864a9e3');
INSERT INTO `e_device` VALUES ('e902256d909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷却水泵3#', 'ba5813de902c47db93520677f7df989d', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', 'dea8536b9d4041209ce8e0a77864a9e3');
INSERT INTO `e_device` VALUES ('e9084cd5909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷冻水泵1#', 'ba5813de902c47db93520677f7df989d', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', 'dea8536b9d4041209ce8e0a77864a9e3');
INSERT INTO `e_device` VALUES ('e90fccf5909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷冻水泵2#', 'ba5813de902c47db93520677f7df989d', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', 'dea8536b9d4041209ce8e0a77864a9e3');
INSERT INTO `e_device` VALUES ('e9168cbf909a11ec8b8852540084f6e1', '1970-01-01 00:00:00', null, '1970-01-01 00:00:00', null, '', null, '冷冻水泵3#', 'ba5813de902c47db93520677f7df989d', '[{\"name\":\"B00.001\",\"kepIds\":[\"00-203-14\"],\"mergeRuleEnum\":\"Avg\",\"opcItemTypeEnum\":\"Flow\"}]', 'dea8536b9d4041209ce8e0a77864a9e3');

-- ----------------------------
-- Table structure for `e_project`
-- ----------------------------
DROP TABLE IF EXISTS `e_project`;
CREATE TABLE `e_project` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `updated` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `capacity` bigint(20) DEFAULT '0' COMMENT '装机容量',
  `cls_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'KepServer组件编号',
  `completion_date` date DEFAULT NULL COMMENT '竣工时间',
  `config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备配置',
  `coverage` bigint(20) DEFAULT '0' COMMENT '覆盖面积',
  `designs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工艺图',
  `opc_server_config` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Opc连接配置',
  `org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构编号',
  `time_to_market` date DEFAULT NULL COMMENT '投产时间',
  `building_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '建筑类型',
  `energy_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '能源类型',
  `location` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目位置',
  `data_source_config` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据源配置',
  `data_source_type` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据源类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of e_project
-- ----------------------------
INSERT INTO `e_project` VALUES ('ba5813de902c47db93520677f7df989d', '2022-06-30 11:13:38', '', '2022-06-30 11:13:38', '', '', null, '世园会', '20', '1-2-3-4-5-6-7-8-9-0', '2022-01-26', '这是配置描述', '160', null, '{\"host\":\"127.0.0.1\",\"domain\":\"/\",\"user\":\"tt\",\"pwd\":\"123456\",\"clsid\":\"1-2-3-4-5-6-7-8-9-0\"}', 'dea8536b9d4041209ce8e0a77864a9e3', '2022-01-26', 'agriculture', 'boiler', '{\"position\":\"102.212,32.092\",\"address\":\"北京市石景山区xxxx\",\"city\":\"北京\"}', null, null);
INSERT INTO `e_project` VALUES ('d0965acd64e846238f60d4035ae95507', '2022-06-30 11:13:38', '', '2022-06-30 11:13:38', '', '', null, 'C项目', '1000', '111', '2022-04-22', '初始配hi', '100000', null, '{\"host\":\"10.101.101.0\",\"domain\":\"8080\",\"user\":\"11212\",\"pwd\":\"2121212\",\"clsid\":\"111\"}', '09828765ed6a4a5e9d854822c2e6ab31', '2022-04-14', 'school', 'boiler', '{\"position\":\"123123\",\"address\":\"北京\",\"city\":\"北京\"}', null, null);

-- ----------------------------
-- Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-06-29 10:20:44', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-06-29 10:20:44', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-06-29 10:20:44', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-06-29 10:20:44', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-06-29 10:20:44', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `org_id` varchar(32) DEFAULT NULL COMMENT '机构编号',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', null, '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:33', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', null, '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:33', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', null, '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:33', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', null, '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', null, '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', null, '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', null, '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', null, '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', null, '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', null, '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-06-29 10:20:34', '', null);
INSERT INTO `sys_dept` VALUES ('200', '0', null, '0', '测试部门', '0', null, null, null, '0', '0', 'admin', '2022-06-29 10:50:41', '', null);
INSERT INTO `sys_dept` VALUES ('201', '200', null, '0,200', '二级测试', '1', null, null, null, '0', '0', 'admin', '2022-06-29 17:15:10', '', null);
INSERT INTO `sys_dept` VALUES ('202', '0', null, '0', '1231313', '0', null, null, null, '0', '0', '', '2022-06-30 10:51:27', '', null);
INSERT INTO `sys_dept` VALUES ('203', '0', null, '0', '功能测试机构', '0', null, null, null, '0', '0', '', '2022-06-30 17:00:14', '', null);
INSERT INTO `sys_dept` VALUES ('204', '203', null, '0,203', '运营管理部', '1', 'xxx', '13911712111', null, '0', '0', 'admin', '2022-06-30 17:01:00', '', null);

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-06-29 10:20:43', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:43', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-06-29 10:20:44', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '离线', '1', 'e_device_status', null, 'warning', 'N', '0', 'admin', '2022-06-30 17:14:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '1', '运行中', '2', 'e_device_status', null, 'success', 'N', '0', 'admin', '2022-06-30 17:14:58', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '2', '异常', '3', 'e_device_status', null, 'danger', 'N', '0', 'admin', '2022-06-30 17:15:35', 'admin', '2022-06-30 17:15:59', null);

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-06-29 10:20:42', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-06-29 10:20:42', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-06-29 10:20:42', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-06-29 10:20:42', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-06-29 10:20:42', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-06-29 10:20:42', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-06-29 10:20:42', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-06-29 10:20:42', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-06-29 10:20:42', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-06-29 10:20:43', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '设备运行状态', 'e_device_status', '0', 'admin', '2022-06-30 17:13:10', '', null, '设备管理列表');

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-06-29 10:20:45', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-06-29 10:20:45', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-06-29 10:20:45', '', null, '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 10:49:02');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 10:49:44');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-29 10:52:24');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 10:52:29');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-29 10:54:21');
INSERT INTO `sys_logininfor` VALUES ('105', 'butel', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：butel 不存在', '2022-06-29 10:54:34');
INSERT INTO `sys_logininfor` VALUES ('106', 'buteltest', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 10:54:41');
INSERT INTO `sys_logininfor` VALUES ('107', 'buteltest', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-29 10:57:39');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 10:57:44');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 14:53:36');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 15:32:21');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 16:51:46');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-30 10:02:50');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 10:05:08');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 13:57:34');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-30 17:04:59');
INSERT INTO `sys_logininfor` VALUES ('116', 'hqadmin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-30 17:05:10');
INSERT INTO `sys_logininfor` VALUES ('117', 'hqadmin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：hqadmin 不存在', '2022-06-30 17:05:30');
INSERT INTO `sys_logininfor` VALUES ('118', 'hq管理员', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 17:06:20');
INSERT INTO `sys_logininfor` VALUES ('119', 'hq管理员', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-30 17:10:16');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 17:10:26');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 18:37:30');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '192.168.8.107', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-01 14:10:49');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '192.168.8.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 14:38:25');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-06-29 10:20:35', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '4', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-06-29 10:20:35', 'admin', '2022-07-28 14:48:59', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '开发工具', '0', '5', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-06-29 10:20:35', 'admin', '2022-07-28 14:49:06', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '2016', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-06-29 10:20:35', 'admin', '2022-07-28 14:47:13', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '2016', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-06-29 10:20:35', 'admin', '2022-07-28 14:47:21', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-06-29 10:20:35', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '2015', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-06-29 10:20:35', 'admin', '2022-07-28 14:47:28', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-06-29 10:20:35', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-06-29 10:20:35', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-06-29 10:20:35', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-06-29 10:20:35', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-06-29 10:20:35', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-06-29 10:20:35', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-06-29 10:20:35', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-06-29 10:20:35', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-06-29 10:20:36', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-06-29 10:20:36', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-06-29 10:20:36', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-06-29 10:20:36', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-06-29 10:20:36', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-06-29 10:20:36', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-06-29 10:20:36', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-06-29 10:20:36', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-06-29 10:20:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-06-29 10:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-06-29 10:20:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '能源中心', '0', '0', 'energy', null, null, '1', '0', 'M', '0', '0', '', 'nested', 'buteltest', '2022-06-29 10:55:42', 'admin', '2022-06-30 10:09:11', '');
INSERT INTO `sys_menu` VALUES ('2002', '设备管理', '2000', '2', 'device', 'energy/device/index', null, '1', '0', 'C', '0', '0', '', 'online', 'admin', '2022-06-29 10:58:25', 'admin', '2022-06-30 16:58:40', '');
INSERT INTO `sys_menu` VALUES ('2003', '统计报表', '2000', '3', 'statistics', 'energy/statistics/index', null, '1', '0', 'C', '0', '0', '', 'chart', 'admin', '2022-06-29 10:58:54', 'admin', '2022-06-30 16:58:57', '');
INSERT INTO `sys_menu` VALUES ('2004', '设备查询', '2002', '1', '', null, null, '1', '0', 'F', '0', '0', null, '#', 'admin', '2022-06-29 11:01:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '添加设备', '2002', '1', '', null, null, '1', '0', 'F', '0', '0', null, '#', 'admin', '2022-06-29 11:01:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '数据查询', '2003', '1', '', null, null, '1', '0', 'F', '0', '0', null, '#', 'admin', '2022-06-29 11:02:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '数据导出', '2003', '1', '', null, null, '1', '0', 'F', '0', '0', '', '#', 'admin', '2022-06-29 11:02:20', 'admin', '2022-06-29 11:03:23', '');
INSERT INTO `sys_menu` VALUES ('2009', '项目管理', '2000', '1', 'project', 'energy/project/index', null, '1', '0', 'C', '0', '0', '', 'druid', 'admin', '2022-06-29 11:02:38', 'admin', '2022-06-30 16:58:31', '');
INSERT INTO `sys_menu` VALUES ('2010', '机构管理', '2015', '0', 'org', 'system/org/index', null, '1', '0', 'C', '0', '0', '', 'cascader', 'admin', '2022-06-29 11:20:56', 'admin', '2022-07-28 14:46:58', '');
INSERT INTO `sys_menu` VALUES ('2011', '机构新增', '2010', '1', '', null, null, '1', '0', 'F', '0', '0', null, '#', 'admin', '2022-06-29 11:21:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '数据大屏', '2000', '0', 'dataview', '', null, '1', '1', 'M', '0', '0', '', 'dashboard', 'admin', '2022-06-30 10:08:25', 'admin', '2022-06-30 16:58:24', '');
INSERT INTO `sys_menu` VALUES ('2013', '进入大屏', '2012', '1', 'https://share.shanhaibi.com/625d0ef49038f/', null, null, '0', '0', 'C', '0', '0', '', 'guide', 'admin', '2022-06-30 16:51:13', 'admin', '2022-06-30 16:53:15', '');
INSERT INTO `sys_menu` VALUES ('2014', '实时监控', '2000', '4', 'monitor', 'energy/monitor/index', null, '1', '0', 'C', '0', '0', '', 'redis-list', 'admin', '2022-06-30 16:57:42', 'admin', '2022-07-28 17:08:11', '');
INSERT INTO `sys_menu` VALUES ('2015', '组织机构管理', '0', '2', 'org', null, null, '1', '0', 'M', '0', '0', '', 'tree', 'admin', '2022-07-28 14:46:27', 'admin', '2022-07-28 14:48:47', '');
INSERT INTO `sys_menu` VALUES ('2016', '用户管理', '0', '3', 'user', null, null, '1', '0', 'M', '0', '0', '', 'user', 'admin', '2022-07-28 14:46:41', 'admin', '2022-07-28 14:48:53', '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-06-29 10:20:45', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-06-29 10:20:45', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('10', '部署测试通知', '1', 0x3C703E537072696E67626F6F74E78988E69CACE983A8E7BDB2E5AE8CE688903C2F703E, '0', 'admin', '2022-06-29 10:51:53', '', null, null);
INSERT INTO `sys_notice` VALUES ('11', '发布公告', '2', 0x3C703E31323331333C2F703E, '0', 'admin', '2022-06-29 10:52:19', '', null, null);

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '192.168.8.107', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:50:41');
INSERT INTO `sys_oper_log` VALUES ('101', '通知公告', '1', 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', '1', 'admin', null, '/system/notice', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>Springboot版本部署完成</p>\",\"noticeTitle\":\"部署测试通知\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:51:53');
INSERT INTO `sys_oper_log` VALUES ('102', '通知公告', '1', 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', '1', 'admin', null, '/system/notice', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>12313</p>\",\"noticeTitle\":\"发布公告\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:52:19');
INSERT INTO `sys_oper_log` VALUES ('103', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '192.168.8.107', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"nickName\":\"butel\",\"params\":{},\"password\":\"$2a$10$Bst84kDrm612E8gvy5NHfuU1hUT2ROgZxu8sUi5CLaFuRTX0bvCha\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"buteltest\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:54:11');
INSERT INTO `sys_oper_log` VALUES ('104', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '192.168.8.107', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-06-29 10:54:11\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试部门\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"butel\",\"params\":{},\"password\":\"\",\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"buteltest\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:54:18');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'buteltest', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"buteltest\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"能源中心\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"energy\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:55:42');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'buteltest', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"buteltest\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:56:31');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"device\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:58:25');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计报表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"statistics\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 10:58:54');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 10:58:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"device\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:00:46');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 10:58:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"统计报表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"statistics\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:00:51');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:01:07');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加设备\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:01:20');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加设备\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:01:46');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:02:08');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:02:20');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"project\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:02:38');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 11:02:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:03:06');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '192.168.8.107', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:03:17');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 11:02:20\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"数据导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:03:23');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/device/index\",\"createTime\":\"2022-06-29 10:58:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"device\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:10:56');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/project/index\",\"createTime\":\"2022-06-29 11:02:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:13:36');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/statistics/index\",\"createTime\":\"2022-06-29 10:58:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"统计报表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"statistics\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:15:16');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"system/org/index\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"org\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:20:56');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"机构新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:21:40');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"system/org/index\",\"createTime\":\"2022-06-29 11:20:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"org\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 11:22:43');
INSERT INTO `sys_oper_log` VALUES ('126', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '192.168.8.107', '内网IP', '{\"ancestors\":\"0,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"二级测试\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-29 17:15:10');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/dataview/index\",\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据大屏\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"dataview\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 10:08:25');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 10:55:42\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"能源中心\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"energy\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 10:09:11');
INSERT INTO `sys_oper_log` VALUES ('129', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/device/index\",\"createTime\":\"2022-06-29 10:58:25\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"device\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 10:09:44');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/statistics/index\",\"createTime\":\"2022-06-29 10:58:54\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"统计报表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"statistics\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 10:09:50');
INSERT INTO `sys_oper_log` VALUES ('131', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/project/index\",\"createTime\":\"2022-06-29 11:02:38\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 10:10:00');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '192.168.8.107', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2022-06-30 14:52:52');
INSERT INTO `sys_oper_log` VALUES ('133', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '192.168.8.107', '内网IP', '{\"admin\":false,\"createTime\":\"2022-06-29 10:20:35\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2004,2006,2003,2007,2008,2009,2012],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 14:53:26');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '192.168.8.107', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 14:53:31');
INSERT INTO `sys_oper_log` VALUES ('135', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '192.168.8.107', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 14:53:37');
INSERT INTO `sys_oper_log` VALUES ('136', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 10:20:35\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"开发工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 14:53:48');
INSERT INTO `sys_oper_log` VALUES ('137', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"https://share.shanhaibi.com/625d0ef49038f/\",\"createTime\":\"2022-06-30 10:08:25\",\"icon\":\"dashboard\",\"isCache\":\"1\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"数据大屏\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"dataview\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'数据大屏\'失败，地址必须以http(s)://开头\",\"code\":500}', '0', null, '2022-06-30 16:48:38');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"https://share.shanhaibi.com/625d0ef49038f/\",\"createTime\":\"2022-06-30 10:08:25\",\"icon\":\"dashboard\",\"isCache\":\"1\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"数据大屏\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"dataview\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'数据大屏\'失败，地址必须以http(s)://开头\",\"code\":500}', '0', null, '2022-06-30 16:48:42');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-06-30 10:08:25\",\"icon\":\"dashboard\",\"isCache\":\"1\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"数据大屏\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"https://share.shanhaibi.com/625d0ef49038f/\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:48:52');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuName\":\"打开大屏页面\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"https://share.shanhaibi.com/625d0ef49038f/\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:51:13');
INSERT INTO `sys_oper_log` VALUES ('141', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-06-30 10:08:25\",\"icon\":\"dashboard\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"数据大屏\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"dataview\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:51:54');
INSERT INTO `sys_oper_log` VALUES ('142', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-30 16:51:13\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2013,\"menuName\":\"进入大屏\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"https://share.shanhaibi.com/625d0ef49038f/\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:53:15');
INSERT INTO `sys_oper_log` VALUES ('143', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/live/index\",\"createBy\":\"admin\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实时监控\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"live\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:57:42');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/project/index\",\"createTime\":\"2022-06-29 11:02:38\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:58:05');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-06-30 10:08:25\",\"icon\":\"dashboard\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"数据大屏\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"dataview\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:58:24');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/project/index\",\"createTime\":\"2022-06-29 11:02:38\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:58:31');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/device/index\",\"createTime\":\"2022-06-29 10:58:25\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"device\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:58:40');
INSERT INTO `sys_oper_log` VALUES ('148', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.107', '内网IP', '{\"children\":[],\"component\":\"energy/statistics/index\",\"createTime\":\"2022-06-29 10:58:54\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"统计报表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"statistics\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 16:58:57');
INSERT INTO `sys_oper_log` VALUES ('149', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '192.168.8.107', '内网IP', '{\"ancestors\":\"0,203\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"运营管理部\",\"leader\":\"xxx\",\"orderNum\":1,\"params\":{},\"parentId\":203,\"phone\":\"13911712111\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:01:00');
INSERT INTO `sys_oper_log` VALUES ('150', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '192.168.8.107', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2012,2013,2009,2002,2004,2006,2003,2007,2008,2014,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019],\"params\":{},\"roleId\":100,\"roleKey\":\"entUser\",\"roleName\":\"企业用户\",\"roleSort\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:02:22');
INSERT INTO `sys_oper_log` VALUES ('151', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/100', '192.168.8.107', '内网IP', '{userIds=100}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:02:58');
INSERT INTO `sys_oper_log` VALUES ('152', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '192.168.8.107', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":204,\"nickName\":\"hqadmin\",\"params\":{},\"password\":\"$2a$10$oZxCi3a6SWPA8MOB.9GsFeghKd4hhBz/eZr8OO4S2alc558XDa7BS\",\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"hq管理员\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:03:50');
INSERT INTO `sys_oper_log` VALUES ('153', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"设备运行状态\",\"dictType\":\"e_device_status\",\"params\":{},\"remark\":\"设备管理列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:13:10');
INSERT INTO `sys_oper_log` VALUES ('154', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"dictLabel\":\"离线\",\"dictSort\":0,\"dictType\":\"e_device_status\",\"dictValue\":\"1\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:14:40');
INSERT INTO `sys_oper_log` VALUES ('155', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"dictLabel\":\"运行中\",\"dictSort\":1,\"dictType\":\"e_device_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:14:58');
INSERT INTO `sys_oper_log` VALUES ('156', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"dictLabel\":\"异常\",\"dictSort\":0,\"dictType\":\"e_device_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:15:35');
INSERT INTO `sys_oper_log` VALUES ('157', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-06-30 17:15:35\",\"dictCode\":102,\"dictLabel\":\"异常\",\"dictSort\":0,\"dictType\":\"e_device_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:15:43');
INSERT INTO `sys_oper_log` VALUES ('158', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '192.168.8.107', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-06-30 17:15:35\",\"dictCode\":102,\"dictLabel\":\"异常\",\"dictSort\":2,\"dictType\":\"e_device_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-06-30 17:15:59');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"组织机构管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"org\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:46:27');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:46:41');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"component\":\"system/org/index\",\"createTime\":\"2022-06-29 11:20:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2015,\"path\":\"org\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:46:58');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2022-06-29 10:20:35\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:47:13');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2022-06-29 10:20:35\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:47:22');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2022-06-29 10:20:35\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2015,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:47:28');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createTime\":\"2022-07-28 14:46:27\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"组织机构管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"org\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:48:13');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createTime\":\"2022-07-28 14:46:41\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:48:22');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createTime\":\"2022-07-28 14:46:27\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"组织机构管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"org\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:48:47');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createTime\":\"2022-07-28 14:46:41\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:48:53');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 10:20:35\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:48:59');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"createTime\":\"2022-06-29 10:20:35\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"开发工具\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 14:49:06');
INSERT INTO `sys_oper_log` VALUES ('171', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.8.105', '内网IP', '{\"children\":[],\"component\":\"energy/monitor/index\",\"createTime\":\"2022-06-30 16:57:42\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"实时监控\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"monitor\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-28 17:08:11');

-- ----------------------------
-- Table structure for `sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `org_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '閮ㄩ棬id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '閮ㄩ棬鍚嶇О',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='机构表';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('09828765ed6a4a5e9d854822c2e6ab31', '12345', '0', '0', '0', '', '2022-06-29 18:30:47', '', null);
INSERT INTO `sys_org` VALUES ('09c87af6189b4d3da5b345d6028e584b', '功能测试机构', '0', '0', '0', '', '2022-06-30 17:00:14', '', null);
INSERT INTO `sys_org` VALUES ('0e59545454824ae7830addd882502c69', '1231313', '0', '0', '0', '', '2022-06-30 10:51:27', '', null);
INSERT INTO `sys_org` VALUES ('dea8536b9d4041209ce8e0a77864a9e3', '中国第一机构', '0', '0', '0', '', '2022-06-30 10:45:21', '', null);
INSERT INTO `sys_org` VALUES ('e6655a77a03f47fb9c470ec5c1678518', '中国第一机构', '0', '0', '0', '', '2022-06-30 10:45:17', '', null);

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-06-29 10:20:34', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-06-29 10:20:34', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-06-29 10:20:34', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-06-29 10:20:34', '', null, '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-06-29 10:20:35', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-06-29 10:20:35', 'admin', '2022-06-30 14:53:26', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '企业用户', 'entUser', '0', '1', '1', '1', '0', '0', 'admin', '2022-06-30 17:02:22', '', null, null);

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '2003');
INSERT INTO `sys_role_menu` VALUES ('2', '2004');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '103');
INSERT INTO `sys_role_menu` VALUES ('100', '1000');
INSERT INTO `sys_role_menu` VALUES ('100', '1001');
INSERT INTO `sys_role_menu` VALUES ('100', '1002');
INSERT INTO `sys_role_menu` VALUES ('100', '1003');
INSERT INTO `sys_role_menu` VALUES ('100', '1004');
INSERT INTO `sys_role_menu` VALUES ('100', '1005');
INSERT INTO `sys_role_menu` VALUES ('100', '1006');
INSERT INTO `sys_role_menu` VALUES ('100', '1016');
INSERT INTO `sys_role_menu` VALUES ('100', '1017');
INSERT INTO `sys_role_menu` VALUES ('100', '1018');
INSERT INTO `sys_role_menu` VALUES ('100', '1019');
INSERT INTO `sys_role_menu` VALUES ('100', '2000');
INSERT INTO `sys_role_menu` VALUES ('100', '2002');
INSERT INTO `sys_role_menu` VALUES ('100', '2003');
INSERT INTO `sys_role_menu` VALUES ('100', '2004');
INSERT INTO `sys_role_menu` VALUES ('100', '2006');
INSERT INTO `sys_role_menu` VALUES ('100', '2007');
INSERT INTO `sys_role_menu` VALUES ('100', '2008');
INSERT INTO `sys_role_menu` VALUES ('100', '2009');
INSERT INTO `sys_role_menu` VALUES ('100', '2012');
INSERT INTO `sys_role_menu` VALUES ('100', '2013');
INSERT INTO `sys_role_menu` VALUES ('100', '2014');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `org_id` varchar(32) DEFAULT '0',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 10企业管理员 11企业用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', '0', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.8.105', '2022-07-28 14:20:27', 'admin', '2022-06-29 10:20:34', '', '2022-07-28 14:38:25', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', '0', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-06-29 10:20:34', 'admin', '2022-06-29 10:20:34', '', null, '测试员');
INSERT INTO `sys_user` VALUES ('100', '200', '0', 'buteltest', 'butel', '00', '', '', '0', '', '$2a$10$Bst84kDrm612E8gvy5NHfuU1hUT2ROgZxu8sUi5CLaFuRTX0bvCha', '0', '2', '192.168.8.107', '2022-06-29 10:39:20', 'admin', '2022-06-29 10:54:11', 'admin', '2022-06-29 10:54:41', null);
INSERT INTO `sys_user` VALUES ('101', '204', '09c87af6189b4d3da5b345d6028e584b', 'hqadmin', 'hq管理员', '00', '', '', '0', '', '$2a$10$oZxCi3a6SWPA8MOB.9GsFeghKd4hhBz/eZr8OO4S2alc558XDa7BS', '0', '0', '192.168.8.107', '2022-06-30 16:50:52', 'admin', '2022-06-30 17:03:50', '', '2022-06-30 17:06:20', null);

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('101', '100');
