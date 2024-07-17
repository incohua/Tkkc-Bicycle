/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 90000 (9.0.0)
 Source Host           : localhost:3306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 90000 (9.0.0)
 File Encoding         : 65001

 Date: 17/07/2024 17:40:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员的唯一编号',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员密码',
  `assigned_region` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所分配充电桩的负责区域',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储管理员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `admin_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员的唯一编号',
  `admin_password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '管理员密码',
  `region` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '所分配充电桩的负责区域（南区，北区，中区）',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_info
-- ----------------------------

-- ----------------------------
-- Table structure for charger
-- ----------------------------
DROP TABLE IF EXISTS `charger`;
CREATE TABLE `charger`  (
  `charger_id` int NOT NULL AUTO_INCREMENT COMMENT '充电桩的唯一编号',
  `region` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '充电桩所属区域',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '充电桩运行状态',
  `socket_count` decimal(20, 2) NOT NULL COMMENT '充电桩上插座数量',
  PRIMARY KEY (`charger_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储充电桩相关信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of charger
-- ----------------------------
INSERT INTO `charger` VALUES (22, '1', '3', 5.00);
INSERT INTO `charger` VALUES (23, '2', '3', 5.00);
INSERT INTO `charger` VALUES (24, '3', '3', 5.00);
INSERT INTO `charger` VALUES (25, '1', '1', 3.00);
INSERT INTO `charger` VALUES (26, '1', '1', 3.00);
INSERT INTO `charger` VALUES (27, '1', '1', 3.00);
INSERT INTO `charger` VALUES (28, '2', '2', 2.00);
INSERT INTO `charger` VALUES (29, '2', '2', 3.00);
INSERT INTO `charger` VALUES (30, '2', '1', 5.00);

-- ----------------------------
-- Table structure for charging_record
-- ----------------------------
DROP TABLE IF EXISTS `charging_record`;
CREATE TABLE `charging_record`  (
  `transaction_id` int NOT NULL AUTO_INCREMENT COMMENT '充值记录序号',
  `charge_amount` decimal(20, 2) NOT NULL COMMENT '本次充电的金额',
  `charge_duration` time NOT NULL COMMENT '本次充电时长',
  `start_time` datetime NOT NULL COMMENT '充电开始时间',
  `end_time` datetime NOT NULL COMMENT '充电结束时间',
  `socket_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '将使用的插座ID',
  `charger_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '将使用的充电桩ID',
  `user_id` int NOT NULL COMMENT '用户的唯一编号',
  `charge_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '充电进度状态',
  PRIMARY KEY (`transaction_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `charging_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储用户的充电记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of charging_record
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (20, 'charger', '存储充电桩相关信息', '', NULL, 'Charger', 'crud', 'com.ruoyi.charger', 'charger', 'chargerinfo', '充电桩管理', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"设备管理\",\"treeCode\":\"\"}', 'admin', '2024-07-15 07:44:09', '', '2024-07-17 07:54:08', '');
INSERT INTO `gen_table` VALUES (21, 'charging_record', '存储用户的充电记录', 'charger', 'charger_id', 'ChargingRecord', 'sub', 'com.ruoyi.chargingRecord', 'chargingRecord', 'charingRecordinfo', '充电记录', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"2002\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"订单管理\",\"treeCode\":\"\"}', 'admin', '2024-07-15 07:44:09', '', '2024-07-17 07:56:32', '');
INSERT INTO `gen_table` VALUES (22, 'maintenance_record', '存储维修信息', '', NULL, 'MaintenanceRecord', 'crud', 'com.ruoyi.maintenance_record', 'maintenance_record', 'maintenancerecord', '维修工单', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"2008\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"维修管理\",\"treeCode\":\"\"}', 'admin', '2024-07-15 07:44:09', '', '2024-07-17 07:56:58', '');
INSERT INTO `gen_table` VALUES (23, 'recharge_record', '存储用户充值信息记录', 'user', 'user_id', 'RechargeRecord', 'sub', 'com.ruoyi.recharge_record', 'recharge_record', 'rechargerecord', '充值记录', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"2002\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"订单管理\",\"treeCode\":\"\"}', 'admin', '2024-07-15 07:44:09', '', '2024-07-17 08:01:49', '');
INSERT INTO `gen_table` VALUES (25, 'socket', '存储插座相关信息', '', NULL, 'Socket', 'crud', 'com.ruoyi.socket', 'socket', 'socketinfo', '插座管理', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"设备管理\",\"treeCode\":\"\"}', 'admin', '2024-07-15 07:44:09', '', '2024-07-17 08:01:13', '');
INSERT INTO `gen_table` VALUES (26, 'user_feedback', '存储用户的反馈信息内容', 'user', 'user_id', 'UserFeedback', 'crud', 'com.ruoyi.ruoyi-feedback', 'userfeedback', 'feedback', '反馈信息', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"反馈管理\",\"treeCode\":\"\"}', 'admin', '2024-07-15 07:44:09', '', '2024-07-17 08:42:05', '');
INSERT INTO `gen_table` VALUES (28, 'admin', '存储管理员信息', '', NULL, 'Admin', 'crud', 'com.ruoyi.system', 'system', 'admin', '管理员信息', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"3\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统工具\",\"treeCode\":\"\"}', 'admin', '2024-07-17 07:58:37', '', '2024-07-17 08:00:00', '');
INSERT INTO `gen_table` VALUES (29, 'user', '存储用户个人信息', '', NULL, 'User', 'crud', 'com.ruoyi.system', 'system', 'user', '用户个人信息', 'incohua', 1, '0', '/', '{\"parentMenuId\":\"3\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统工具\",\"treeCode\":\"\"}', 'admin', '2024-07-17 07:58:37', '', '2024-07-17 07:59:50', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (83, 20, 'charger_id', '充电桩的唯一编号', 'int', 'Long', 'chargerId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:54:08');
INSERT INTO `gen_table_column` VALUES (84, 20, 'region', '充电桩所属区域', 'varchar(20)', 'String', 'region', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'charger_region', 2, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:54:08');
INSERT INTO `gen_table_column` VALUES (85, 20, 'status', '充电桩运行状态', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'charger_status', 3, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:54:08');
INSERT INTO `gen_table_column` VALUES (86, 20, 'socket_count', '充电桩上插座数量', 'decimal(20,2)', 'BigDecimal', 'socketCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:54:08');
INSERT INTO `gen_table_column` VALUES (87, 21, 'transaction_id', '充电记录序号', 'int', 'Long', 'transactionId', '1', '1', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (88, 21, 'charge_amount', '本次充电的金额', 'decimal(20,2)', 'BigDecimal', 'chargeAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (89, 21, 'charge_duration', '本次充电时长', 'time', 'Date', 'chargeDuration', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'datetime', '', 3, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (90, 21, 'start_time', '充电开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 5, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (91, 21, 'end_time', '充电结束时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', NULL, 'BETWEEN', 'datetime', '', 6, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (92, 21, 'socket_id', '使用的插座ID', 'varchar(10)', 'String', 'socketId', '0', '0', NULL, NULL, '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (93, 21, 'charger_id', '使用的充电桩ID', 'varchar(10)', 'String', 'chargerId', '0', '0', NULL, NULL, '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (94, 21, 'user_id', '用户的唯一编号', 'int', 'Long', 'userId', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (95, 21, 'charge_status', '充电进度状态', 'varchar(10)', 'String', 'chargeStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'chargingrecord_user_status', 9, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:32');
INSERT INTO `gen_table_column` VALUES (96, 22, 'maintenance_id', '维修编号', 'int', 'Long', 'maintenanceId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:58');
INSERT INTO `gen_table_column` VALUES (97, 22, 'maintenance_time', '维修时间', 'datetime', 'Date', 'maintenanceTime', '0', '0', '1', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 2, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:58');
INSERT INTO `gen_table_column` VALUES (98, 22, 'issue', '维修问题', 'varchar(50)', 'String', 'issue', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:58');
INSERT INTO `gen_table_column` VALUES (99, 22, 'status', '维修状态', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'maintenance_status', 4, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 07:56:58');
INSERT INTO `gen_table_column` VALUES (100, 23, 'recharge_id', '充值序号', 'int', 'Long', 'rechargeId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:49');
INSERT INTO `gen_table_column` VALUES (101, 23, 'user_id', '用户编号', 'int', 'Long', 'userId', '0', '0', NULL, NULL, '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:49');
INSERT INTO `gen_table_column` VALUES (102, 23, 'amount', '充值金额', 'decimal(20,2)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:49');
INSERT INTO `gen_table_column` VALUES (103, 23, 'method', '充值方式', 'varchar(10)', 'String', 'method', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'recharge_record_method', 4, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:49');
INSERT INTO `gen_table_column` VALUES (104, 23, 'recharge_time', '充值时间', 'datetime', 'Date', 'rechargeTime', '0', '0', '1', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 5, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:49');
INSERT INTO `gen_table_column` VALUES (110, 25, 'socket_id', '插座唯一编号', 'int', 'Long', 'socketId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:13');
INSERT INTO `gen_table_column` VALUES (111, 25, 'charger_id', '插座归属充电桩编号', 'int', 'Long', 'chargerId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:13');
INSERT INTO `gen_table_column` VALUES (112, 25, 'status', '插座状态', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'charger_status', 3, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:01:13');
INSERT INTO `gen_table_column` VALUES (113, 26, 'user_id', '用户的唯一编号', 'int', 'Long', 'userId', '0', '0', '1', NULL, NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:42:05');
INSERT INTO `gen_table_column` VALUES (114, 26, 'issue', '需要维修的问题', 'varchar(50)', 'String', 'issue', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:42:05');
INSERT INTO `gen_table_column` VALUES (115, 26, 'suggestion', '用户提供平台优化建议', 'varchar(50)', 'String', 'suggestion', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-15 07:44:09', NULL, '2024-07-17 08:42:05');
INSERT INTO `gen_table_column` VALUES (137, 28, 'admin_id', '管理员的唯一编号', 'int', 'Long', 'adminId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 08:00:00');
INSERT INTO `gen_table_column` VALUES (138, 28, 'password', '管理员密码', 'varchar(20)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 08:00:00');
INSERT INTO `gen_table_column` VALUES (139, 28, 'assigned_region', '所分配充电桩的负责区域', 'varchar(10)', 'String', 'assignedRegion', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'checkbox', 'charger_region', 3, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 08:00:00');
INSERT INTO `gen_table_column` VALUES (140, 29, 'user_id', '用户的唯一编号', 'int', 'Long', 'userId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 07:59:50');
INSERT INTO `gen_table_column` VALUES (141, 29, 'username', '用户自定义昵称', 'varchar(20)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 07:59:50');
INSERT INTO `gen_table_column` VALUES (142, 29, 'password', '用户设置的密码', 'varchar(10)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 07:59:50');
INSERT INTO `gen_table_column` VALUES (143, 29, 'balance', '用户的账号剩余金额', 'decimal(20,2)', 'BigDecimal', 'balance', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-17 07:58:37', NULL, '2024-07-17 07:59:50');
INSERT INTO `gen_table_column` VALUES (144, 26, 'status', '反馈状态显示', 'varchar(50)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'maintenance_status', 4, '', '2024-07-17 08:03:32', NULL, '2024-07-17 08:42:05');

-- ----------------------------
-- Table structure for maintenance_record
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_record`;
CREATE TABLE `maintenance_record`  (
  `maintenance_id` int NOT NULL AUTO_INCREMENT COMMENT '维修报告编号',
  `maintenance_time` datetime NOT NULL COMMENT '进行维修的时间',
  `issue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '需要维修的问题',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修状态显示',
  PRIMARY KEY (`maintenance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储维修信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of maintenance_record
-- ----------------------------
INSERT INTO `maintenance_record` VALUES (1, '2024-07-18 00:00:00', 'yiyiyiy', '3');
INSERT INTO `maintenance_record` VALUES (2, '2024-07-02 00:00:00', '不通电', '1');

-- ----------------------------
-- Table structure for recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `recharge_record`;
CREATE TABLE `recharge_record`  (
  `recharge_id` int NOT NULL AUTO_INCREMENT COMMENT '充值记录序号',
  `user_id` int NOT NULL COMMENT '用户的唯一编号',
  `amount` decimal(20, 2) NOT NULL COMMENT '用户所选充值金额',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '充值金额的方式',
  `recharge_time` datetime NOT NULL COMMENT '充值交易的时间',
  PRIMARY KEY (`recharge_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `recharge_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储用户充值信息记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_record
-- ----------------------------

-- ----------------------------
-- Table structure for recharge_records
-- ----------------------------
DROP TABLE IF EXISTS `recharge_records`;
CREATE TABLE `recharge_records`  (
  `recharge_id` int NOT NULL AUTO_INCREMENT COMMENT '充值记录序号',
  `user_id` int NOT NULL COMMENT '用户的唯一编号',
  `recharge_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '用户所选充值金额',
  `recharge_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '充值金额的方式',
  `recharge_time` datetime NULL DEFAULT NULL COMMENT '充值交易的时间',
  PRIMARY KEY (`recharge_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `recharge_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户充值记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_records
-- ----------------------------

-- ----------------------------
-- Table structure for socket
-- ----------------------------
DROP TABLE IF EXISTS `socket`;
CREATE TABLE `socket`  (
  `socket_id` int NOT NULL AUTO_INCREMENT COMMENT '插座唯一编号',
  `charger_id` int NOT NULL COMMENT '插座归属充电桩编号',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '插座状态',
  PRIMARY KEY (`socket_id`) USING BTREE,
  INDEX `charger_id`(`charger_id` ASC) USING BTREE,
  CONSTRAINT `socket_ibfk_1` FOREIGN KEY (`charger_id`) REFERENCES `charger` (`charger_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储插座相关信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of socket
-- ----------------------------
INSERT INTO `socket` VALUES (1, 22, '2');
INSERT INTO `socket` VALUES (2, 23, '1');
INSERT INTO `socket` VALUES (3, 26, '2');
INSERT INTO `socket` VALUES (4, 24, '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-purple', 'Y', 'admin', '2024-07-14 14:13:24', 'admin', '2024-07-15 12:57:38', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-07-14 14:13:24', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:18', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:19', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:19', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-14 14:13:19', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-07-14 14:13:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '南区', '1', 'charger_region', '', 'primary', 'N', '0', 'admin', '2024-07-15 07:54:35', 'admin', '2024-07-17 07:48:25', '');
INSERT INTO `sys_dict_data` VALUES (101, 2, '中区', '2', 'charger_region', '', 'info', 'N', '0', 'admin', '2024-07-15 07:54:50', 'admin', '2024-07-17 07:48:33', '');
INSERT INTO `sys_dict_data` VALUES (102, 3, '北区', '3', 'charger_region', '', 'warning', 'N', '0', 'admin', '2024-07-15 07:55:01', 'admin', '2024-07-17 07:48:38', '');
INSERT INTO `sys_dict_data` VALUES (103, 1, '启用', '1', 'charger_status', '', 'primary', 'N', '0', 'admin', '2024-07-15 07:55:57', 'admin', '2024-07-17 07:51:34', '');
INSERT INTO `sys_dict_data` VALUES (104, 2, '维护', '2', 'charger_status', '', 'warning', 'N', '0', 'admin', '2024-07-15 07:56:06', 'admin', '2024-07-17 07:49:56', '');
INSERT INTO `sys_dict_data` VALUES (105, 3, '异常', '3', 'charger_status', '', 'danger', 'Y', '0', 'admin', '2024-07-15 07:56:29', 'admin', '2024-07-17 07:49:49', '');
INSERT INTO `sys_dict_data` VALUES (106, 1, '已完成', '1', 'chargingrecord_user_status', '', 'success', 'N', '0', 'admin', '2024-07-15 08:50:58', 'admin', '2024-07-17 07:50:55', '');
INSERT INTO `sys_dict_data` VALUES (107, 2, '充电中', '2', 'chargingrecord_user_status', '', 'warning', 'N', '0', 'admin', '2024-07-15 08:51:05', 'admin', '2024-07-17 07:51:07', '');
INSERT INTO `sys_dict_data` VALUES (108, 3, '异常', '3', 'chargingrecord_user_status', '', 'danger', 'N', '0', 'admin', '2024-07-15 08:51:15', 'admin', '2024-07-17 07:51:12', '');
INSERT INTO `sys_dict_data` VALUES (109, 1, '已完成', '1', 'maintenance_status', '', 'success', 'N', '0', 'admin', '2024-07-15 09:04:12', 'admin', '2024-07-17 07:52:54', '');
INSERT INTO `sys_dict_data` VALUES (110, 2, '待处理', '2', 'maintenance_status', '', 'warning', 'N', '0', 'admin', '2024-07-15 09:04:27', 'admin', '2024-07-17 07:53:06', '');
INSERT INTO `sys_dict_data` VALUES (111, 3, '归档', '3', 'maintenance_status', '', 'default', 'N', '0', 'admin', '2024-07-15 09:04:44', 'admin', '2024-07-17 07:53:02', '');
INSERT INTO `sys_dict_data` VALUES (112, 1, '支付宝', '1', 'recharge_record_method', '', 'success', 'N', '0', 'admin', '2024-07-15 09:17:27', 'admin', '2024-07-17 07:52:10', '');
INSERT INTO `sys_dict_data` VALUES (113, 2, '微信', '2', 'recharge_record_method', '', 'primary', 'N', '0', 'admin', '2024-07-15 09:17:35', 'admin', '2024-07-17 07:52:15', '');
INSERT INTO `sys_dict_data` VALUES (114, 3, '银行卡', '3', 'recharge_record_method', '', 'warning', 'N', '0', 'admin', '2024-07-15 09:17:46', 'admin', '2024-07-17 07:52:23', '');
INSERT INTO `sys_dict_data` VALUES (115, 3, '关闭', '3', 'charger_status', '', 'info', 'N', '0', 'admin', '2024-07-17 07:49:39', 'admin', '2024-07-17 07:51:41', '');
INSERT INTO `sys_dict_data` VALUES (116, 3, '处理中', '3', 'maintenance_status', NULL, 'primary', 'Y', '0', 'admin', '2024-07-17 07:52:45', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-07-14 14:13:23', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '充电桩区域', 'charger_region', '0', 'admin', '2024-07-15 07:53:19', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '充电桩状态', 'charger_status', '0', 'admin', '2024-07-15 07:55:45', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '用户充电状态', 'chargingrecord_user_status', '0', 'admin', '2024-07-15 08:50:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '维修工单状态', 'maintenance_status', '0', 'admin', '2024-07-15 09:04:00', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '用户充值方式', 'recharge_record_method', '0', 'admin', '2024-07-15 09:17:17', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-07-14 14:13:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-07-14 14:13:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-07-14 14:13:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-14 14:13:54');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-14 15:10:06');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-14 15:10:14');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-14 15:18:16');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-14 15:28:21');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-14 15:28:37');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-15 07:42:41');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 07:42:50');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-15 07:47:14');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 07:47:18');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 07:47:20');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-07-15 07:47:22');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误3次', '2024-07-15 07:47:23');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误4次', '2024-07-15 07:47:29');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 07:47:35');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 07:47:38');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 07:51:07');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-15 07:51:12');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 07:51:20');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 07:59:57');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:15:00');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:21:23');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 08:28:26');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-15 08:28:29');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:28:37');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-15 08:32:46');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:32:54');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:38:16');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:47:42');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 08:55:54');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-15 08:55:56');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 08:56:04');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 09:00:30');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 09:08:43');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 09:33:36');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 09:33:40');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 12:46:09');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:13:18');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:20:55');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:32:11');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:41:10');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:48:45');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-16 00:54:41');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:54:44');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 00:58:27');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 01:09:12');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 03:27:42');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-17 07:47:24');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-07-17 07:47:27');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-17 07:47:38');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-17 08:33:25');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-17 08:45:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2087 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 100, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2024-07-14 14:13:19', 'admin', '2024-07-14 14:20:05', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 101, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2024-07-14 14:13:19', 'admin', '2024-07-14 14:20:11', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 102, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2024-07-14 14:13:19', 'admin', '2024-07-14 14:20:15', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 103, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2024-07-14 14:13:19', 'admin', '2024-07-14 14:20:24', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2024-07-14 14:13:19', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2024-07-14 14:13:19', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2024-07-14 14:13:19', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'menuItem', 'C', '1', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2024-07-14 14:13:19', 'admin', '2024-07-14 14:15:09', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'menuItem', 'C', '1', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2024-07-14 14:13:19', 'admin', '2024-07-14 14:15:21', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2024-07-14 14:13:19', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2024-07-14 14:13:19', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2024-07-14 14:13:19', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2024-07-14 14:13:19', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2024-07-14 14:13:19', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2024-07-14 14:13:19', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2024-07-14 14:13:19', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2024-07-14 14:13:19', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2024-07-14 14:13:19', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2024-07-14 14:13:19', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2024-07-14 14:13:19', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2024-07-14 14:13:19', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2024-07-14 14:13:19', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2024-07-14 14:13:19', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2024-07-14 14:13:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2024-07-14 14:13:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '数据统计', 0, 0, '#', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2024-07-14 14:17:42', 'admin', '2024-07-14 14:19:23', '');
INSERT INTO `sys_menu` VALUES (2001, '设备管理', 0, 1, '#', 'menuItem', 'M', '0', '1', NULL, '#', 'admin', '2024-07-14 14:20:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '订单管理', 0, 2, '#', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2024-07-14 14:21:03', 'admin', '2024-07-14 14:36:58', '');
INSERT INTO `sys_menu` VALUES (2003, '反馈管理', 0, 7, '#', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2024-07-14 14:21:57', 'admin', '2024-07-14 14:36:44', '');
INSERT INTO `sys_menu` VALUES (2006, '充电管理', 0, 2, '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2024-07-14 14:24:37', 'admin', '2024-07-14 14:37:17', '');
INSERT INTO `sys_menu` VALUES (2007, '消费管理', 0, 3, '#', 'menuItem', 'M', '0', '1', NULL, '#', 'admin', '2024-07-14 14:35:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '维修管理', 0, 6, '#', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2024-07-14 14:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '充电桩管理', 2001, 1, '/charger/chargerinfo', '', 'C', '0', '1', 'charger:chargerinfo:view', '#', 'admin', '2024-07-15 08:14:35', '', NULL, '充电桩管理菜单');
INSERT INTO `sys_menu` VALUES (2022, '充电桩管理查询', 2021, 1, '#', '', 'F', '0', '1', 'charger:chargerinfo:list', '#', 'admin', '2024-07-15 08:14:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '充电桩管理新增', 2021, 2, '#', '', 'F', '0', '1', 'charger:chargerinfo:add', '#', 'admin', '2024-07-15 08:14:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '充电桩管理修改', 2021, 3, '#', '', 'F', '0', '1', 'charger:chargerinfo:edit', '#', 'admin', '2024-07-15 08:14:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '充电桩管理删除', 2021, 4, '#', '', 'F', '0', '1', 'charger:chargerinfo:remove', '#', 'admin', '2024-07-15 08:14:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '充电桩管理导出', 2021, 5, '#', '', 'F', '0', '1', 'charger:chargerinfo:export', '#', 'admin', '2024-07-15 08:14:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '充电记录', 2002, 1, '/chargingRecord/charingRecordinfo', '', 'C', '0', '1', 'chargingRecord:charingRecordinfo:view', '#', 'admin', '2024-07-15 08:59:13', '', NULL, '充电记录菜单');
INSERT INTO `sys_menu` VALUES (2046, '充电记录查询', 2045, 1, '#', '', 'F', '0', '1', 'chargingRecord:charingRecordinfo:list', '#', 'admin', '2024-07-15 08:59:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '充电记录新增', 2045, 2, '#', '', 'F', '0', '1', 'chargingRecord:charingRecordinfo:add', '#', 'admin', '2024-07-15 08:59:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '充电记录修改', 2045, 3, '#', '', 'F', '0', '1', 'chargingRecord:charingRecordinfo:edit', '#', 'admin', '2024-07-15 08:59:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '充电记录删除', 2045, 4, '#', '', 'F', '0', '1', 'chargingRecord:charingRecordinfo:remove', '#', 'admin', '2024-07-15 08:59:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '充电记录导出', 2045, 5, '#', '', 'F', '0', '1', 'chargingRecord:charingRecordinfo:export', '#', 'admin', '2024-07-15 08:59:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '维修工单', 2008, 1, '/maintenance_record/maintenancerecord', '', 'C', '0', '1', 'maintenance_record:maintenancerecord:view', '#', 'admin', '2024-07-15 12:48:05', '', NULL, '维修工单菜单');
INSERT INTO `sys_menu` VALUES (2052, '维修工单查询', 2051, 1, '#', '', 'F', '0', '1', 'maintenance_record:maintenancerecord:list', '#', 'admin', '2024-07-15 12:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '维修工单新增', 2051, 2, '#', '', 'F', '0', '1', 'maintenance_record:maintenancerecord:add', '#', 'admin', '2024-07-15 12:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '维修工单修改', 2051, 3, '#', '', 'F', '0', '1', 'maintenance_record:maintenancerecord:edit', '#', 'admin', '2024-07-15 12:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '维修工单删除', 2051, 4, '#', '', 'F', '0', '1', 'maintenance_record:maintenancerecord:remove', '#', 'admin', '2024-07-15 12:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '维修工单导出', 2051, 5, '#', '', 'F', '0', '1', 'maintenance_record:maintenancerecord:export', '#', 'admin', '2024-07-15 12:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '插座管理', 2001, 1, '/socket/socketinfo', '', 'C', '0', '1', 'socket:socketinfo:view', '#', 'admin', '2024-07-15 12:50:05', '', NULL, '插座管理菜单');
INSERT INTO `sys_menu` VALUES (2064, '插座管理查询', 2063, 1, '#', '', 'F', '0', '1', 'socket:socketinfo:list', '#', 'admin', '2024-07-15 12:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '插座管理新增', 2063, 2, '#', '', 'F', '0', '1', 'socket:socketinfo:add', '#', 'admin', '2024-07-15 12:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '插座管理修改', 2063, 3, '#', '', 'F', '0', '1', 'socket:socketinfo:edit', '#', 'admin', '2024-07-15 12:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '插座管理删除', 2063, 4, '#', '', 'F', '0', '1', 'socket:socketinfo:remove', '#', 'admin', '2024-07-15 12:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '插座管理导出', 2063, 5, '#', '', 'F', '0', '1', 'socket:socketinfo:export', '#', 'admin', '2024-07-15 12:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '充值记录', 2002, 1, '/recharge_record/rechargerecord', '', 'C', '0', '1', 'recharge_record:rechargerecord:view', '#', 'admin', '2024-07-16 00:51:15', '', NULL, '充值记录菜单');
INSERT INTO `sys_menu` VALUES (2076, '充值记录查询', 2075, 1, '#', '', 'F', '0', '1', 'recharge_record:rechargerecord:list', '#', 'admin', '2024-07-16 00:51:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '充值记录新增', 2075, 2, '#', '', 'F', '0', '1', 'recharge_record:rechargerecord:add', '#', 'admin', '2024-07-16 00:51:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '充值记录修改', 2075, 3, '#', '', 'F', '0', '1', 'recharge_record:rechargerecord:edit', '#', 'admin', '2024-07-16 00:51:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '充值记录删除', 2075, 4, '#', '', 'F', '0', '1', 'recharge_record:rechargerecord:remove', '#', 'admin', '2024-07-16 00:51:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '充值记录导出', 2075, 5, '#', '', 'F', '0', '1', 'recharge_record:rechargerecord:export', '#', 'admin', '2024-07-16 00:51:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '反馈信息', 2003, 1, '/userfeedback/feedback', '', 'C', '0', '1', 'userfeedback:feedback:view', '#', 'admin', '2024-07-17 08:39:15', '', NULL, '反馈信息菜单');
INSERT INTO `sys_menu` VALUES (2082, '反馈信息查询', 2081, 1, '#', '', 'F', '0', '1', 'userfeedback:feedback:list', '#', 'admin', '2024-07-17 08:39:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '反馈信息新增', 2081, 2, '#', '', 'F', '0', '1', 'userfeedback:feedback:add', '#', 'admin', '2024-07-17 08:39:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '反馈信息修改', 2081, 3, '#', '', 'F', '0', '1', 'userfeedback:feedback:edit', '#', 'admin', '2024-07-17 08:39:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '反馈信息删除', 2081, 4, '#', '', 'F', '0', '1', 'userfeedback:feedback:remove', '#', 'admin', '2024-07-17 08:39:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '反馈信息导出', 2081, 5, '#', '', 'F', '0', '1', 'userfeedback:feedback:export', '#', 'admin', '2024-07-17 08:39:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-07-14 14:13:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-07-14 14:13:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313730353033303538333937373430313635312F35656435646236615F313135313030342E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2024-07-14 14:13:24', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:15:09', 83);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:15:21', 10);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"数据统计\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:17:42', 24);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"数据统计\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:19:23', 10);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"设备管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:20:00', 26);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"100\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:20:05', 12);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"101\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:20:11', 24);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"102\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:20:15', 23);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"103\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:20:24', 25);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"订单管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:21:03', 25);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"反馈管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:21:57', 14);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"反馈管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:22:01', 22);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"站点管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:22:28', 15);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"充电桩管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:22:50', 11);
INSERT INTO `sys_oper_log` VALUES (114, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:24:16', 35);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"充电管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:24:37', 17);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"消费管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:35:47', 12);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"订单管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:35:57', 20);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"订单管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:36:02', 19);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"维修管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:36:23', 9);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"反馈管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:36:45', 11);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"订单管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:36:58', 22);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"充电管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 14:37:17', 21);
INSERT INTO `sys_oper_log` VALUES (123, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"drop table if exists user_info;\\ncreate table user_info (\\n user_id        int(10)         not null    auto_increment    comment \'用户的唯一编号\',\\n username       varchar(20)     default \'\'  comment \'用户自定义昵称\',\\n password       varchar(10)     default \'\'  comment \'用户设置的密码\',\\n balance        decimal(20,2)   default 0.00 comment \'用户的账号剩余金额\',\\n primary key (user_id)\\n) engine=innodb auto_increment=1 comment = \'用户信息表\';\"]}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:13:06', 9);
INSERT INTO `sys_oper_log` VALUES (124, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table user_info (\\n user_id        int(10)         not null    auto_increment    comment \'用户的唯一编号\',\\n username       varchar(20)     default \'\'  comment \'用户自定义昵称\',\\n password       varchar(10)     default \'\'  comment \'用户设置的密码\',\\n balance        decimal(20,2)   default 0.00 comment \'用户的账号剩余金额\',\\n primary key (user_id)\\n) engine=innodb auto_increment=1 comment = \'用户信息表\';\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:13:13', 162);
INSERT INTO `sys_oper_log` VALUES (125, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table admin_info (\\n admin_id       int(10)         not null    auto_increment    comment \'管理员的唯一编号\',\\n admin_password varchar(20)     default \'\'  comment \'管理员密码\',\\n region         varchar(10)     default \'\'  comment \'所分配充电桩的负责区域（南区，北区，中区）\',\\n primary key (admin_id)\\n) engine=innodb auto_increment=1 comment = \'管理员信息表\';\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:13:28', 60);
INSERT INTO `sys_oper_log` VALUES (126, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table recharge_records (\\n recharge_id   int(10)          not null    auto_increment    comment \'充值记录序号\',\\n user_id       int(10)          not null                        comment \'用户的唯一编号\',\\n recharge_amount decimal(20,2)  default 0.00                    comment \'用户所选充值金额\',\\n recharge_method varchar(10)    default \'\'                     comment \'充值金额的方式\',\\n recharge_time   datetime                                      comment \'充值交易的时间\',\\n primary key (recharge_id),\\n foreign key (user_id) references user_info(user_id)\\n) engine=innodb auto_increment=1 comment = \'用户充值记录表\';\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:13:37', 71);
INSERT INTO `sys_oper_log` VALUES (127, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table charging_records (\\n transaction_id  int(20)          not null    auto_increment    comment \'交易单号\',\\n user_id         int(10)          not null                        comment \'用户的唯一编号\',\\n consumed_amount decimal(20,2)    default 0.00                    comment \'本次充电的金额\',\\n charging_time   time                                         comment \'本次充电时长\',\\n start_time      datetime                                      comment \'充电开始时间\',\\n end_time        datetime                                      comment \'充电结束时间\',\\n socket_id       varchar(10)       not null                        comment \'将使用的插座ID\',\\n charging_pile_id varchar(10)      not null                        comment \'将使用的充电桩ID\',\\n charging_status varchar(10)       default \'\'                     comment \'充电进度状态（正在充电、已结束、异常）\',\\n primary key (transaction_id),\\n foreign key (user_id) references user_info(user_id),\\n foreign key (socket_id) references sockets(socket_id),             -- 假设存在一个名为sockets的表\\n foreign key (charging_pile_id) references charging_piles(pile_id) -- 假设存在一个名为charging_piles的表\\n) engine=innodb auto_increment=1 comment = \'用户充电交易记录表\';\"]}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:13:46', 95);
INSERT INTO `sys_oper_log` VALUES (128, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table charging_piles (\\n pile_id       int(10)           not null    auto_increment    comment \'充电桩的唯一编号\',\\n region        varchar(20)       not null                        comment \'充电桩所属区域（南区，北区，中区）\',\\n pile_status   varchar(10)       default \'正常\'                 comment \'充电桩运行状态（正常、故障）\',\\n socket_count  decimal(20,2)     default 0.00                    comment \'充电桩上插座数量\',\\n primary key (pile_id)\\n) engine=innodb auto_increment=1 comment = \'充电桩信息表\';\"]}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:14:03', 0);
INSERT INTO `sys_oper_log` VALUES (129, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table sockets (\\n socket_id    int(10)           not null    auto_increment    comment \'插座唯一编号\',\\n charging_pile_id varchar(20)   not null                        comment \'插座归属充电桩编号\',\\n socket_status varchar(10)      default \'正常\'                 comment \'插座状态（正常、故障）\',\\n primary key (socket_id),\\n foreign key (charging_pile_id) references charging_piles(pile_id) -- 确保这里的外键定义与充电桩表的主键类型相符\\n) engine=innodb auto_increment=1 comment = \'插座信息表\';\"]}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:14:17', 6);
INSERT INTO `sys_oper_log` VALUES (130, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table sockets (\\n socket_id    int(10)           not null    auto_increment    comment \'插座唯一编号\',\\n charging_pile_id varchar(20)   not null                        comment \'插座归属充电桩编号\',\\n socket_status varchar(10)      default \'正常\'                 comment \'插座状态（正常、故障）\',\\n primary key (socket_id),\\n foreign key (charging_pile_id) references charging_piles(pile_id)\\n) engine=innodb auto_increment=1 comment = \'插座信息表\';\"]}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:14:24', 9);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/recharge_records', '127.0.0.1', '内网IP', '\"recharge_records\"', NULL, 0, NULL, '2024-07-14 15:15:10', 59);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/recharge_records', '127.0.0.1', '内网IP', '\"recharge_records\"', NULL, 0, NULL, '2024-07-14 15:15:11', 48);
INSERT INTO `sys_oper_log` VALUES (133, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"-- ----------------------------\\n-- 充电桩信息表\\n-- ----------------------------\\ndrop table if exists charging_piles;\\ncreate table charging_piles (\\n pile_id         varchar(20)       not null                        comment \'充电桩唯一编号\',\\n location        varchar(100)      not null                        comment \'充电桩位置\',\\n status          varchar(10)       default \'正常\'                 comment \'充电桩状态（正常、故障）\',\\n primary key (pile_id)\\n) engine=innodb comment = \'充电桩信息表\';\\n\\n-- ----------------------------\\n-- 插座信息表\\n-- ----------------------------\\ndrop table if exists charging_sockets;\\ncreate table charging_sockets (\\n socket_id       int(10)           not null    auto_increment    comment \'插座唯一编号\',\\n pile_id         varchar(20)       not null                        comment \'归属充电桩编号\',\\n socket_status   varchar(10)       default \'正常\'                 comment \'插座状态（正常、故障）\',\\n primary key (socket_id),\\n foreign key (pile_id) references charging_piles(pile_id)\\n) engine=innodb auto_increment=1 comment = \'插座信息表\';\\n\\n-- ----------------------------\\n-- 维修工单信息表\\n-- ----------------------------\\ndrop table if exists maintenance_records;\\ncreate table maintenance_records (\\n repair_order_id int(10)           not null    auto_increment    comment \'维修报告编号\',\\n socket_id       int(10)           not null                        comment \'维修插座编号\',\\n repair_time     datetime                                      comment \'进行维修的时间\',\\n repair_issue    varchar(50)      not null                        comment \'需要维修的问题\',\\n repair_status   varchar(10)      default \'未维修\'               comment \'维修状态（未维修、已维修、正在维修）\',\\n primary key (repair_order_id),\\n foreign key (socket_id) references charging_sockets(socket_id)\\n) engine=innodb auto_increment=1 comment = \'维修工单信息表\';\\n\\n-- ----------------------------\\n-- 用户信息表\\n-- ----------------------------\\ndrop table if exists users;\\ncreate table users (\\n user_id       int(10)           not null    auto_increment    comment \'用户的唯一编号\',\\n username      var', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:17:07', 2);
INSERT INTO `sys_oper_log` VALUES (134, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"create table charging_piles (\\n pile_id         varchar(20)       not null                        comment \'充电桩唯一编号\',\\n location        varchar(100)      not null                        comment \'充电桩位置\',\\n status          varchar(10)       default \'正常\'                 comment \'充电桩状态（正常、故障）\',\\n primary key (pile_id)\\n) engine=innodb comment = \'充电桩信息表\';\\n\\ncreate table charging_sockets (\\n socket_id       int(10)           not null    auto_increment    comment \'插座唯一编号\',\\n pile_id         varchar(20)       not null                        comment \'归属充电桩编号\',\\n socket_status   varchar(10)       default \'正常\'                 comment \'插座状态（正常、故障）\',\\n primary key (socket_id),\\n foreign key (pile_id) references charging_piles(pile_id)\\n) engine=innodb auto_increment=1 comment = \'插座信息表\';\\n\\n\\ndrop table if exists maintenance_records;\\ncreate table maintenance_records (\\n repair_order_id int(10)           not null    auto_increment    comment \'维修报告编号\',\\n socket_id       int(10)           not null                        comment \'维修插座编号\',\\n repair_time     datetime                                      comment \'进行维修的时间\',\\n repair_issue    varchar(50)      not null                        comment \'需要维修的问题\',\\n repair_status   varchar(10)      default \'未维修\'               comment \'维修状态（未维修、已维修、正在维修）\',\\n primary key (repair_order_id),\\n foreign key (socket_id) references charging_sockets(socket_id)\\n) engine=innodb auto_increment=1 comment = \'维修工单信息表\';\\n\\n\\ncreate table users (\\n user_id       int(10)           not null    auto_increment    comment \'用户的唯一编号\',\\n username      varchar(50)       not null                        comment \'用户名\',\\n primary key (user_id)\\n) engine=innodb auto_increment=1 comment = \'用户信息表\';\\n\\n\\ncreate table user_feedback (\\n feedback_id            int(10)            not null    auto_increment    comment \'反馈编号\',\\n user_id                int(10)            not null                        comment \'用户编号\',\\n optimization_suggestion varchar(50)                  ', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-07-14 15:17:43', 2);
INSERT INTO `sys_oper_log` VALUES (135, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:38:05', 28);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:38:18', 29);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:38:20', 27);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:38:22', 15);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"插座,维修记录,用户反馈,用户,管理员,充值记录,充电记录,充电桩\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:38:37', 294);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"充值记录,充电桩,充电记录,插座,用户,用户反馈,管理员,维修记录\"]}', NULL, 0, NULL, '2024-07-14 15:38:44', 679);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"充值记录,充电桩,充电记录,插座,用户,用户反馈,管理员,维修记录\"]}', NULL, 0, NULL, '2024-07-14 15:38:44', 504);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"充值记录,充电桩,充电记录,插座,用户,用户反馈,管理员,维修记录\"]}', NULL, 0, NULL, '2024-07-14 15:38:45', 517);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5,6,7,8,9,10,11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:47:51', 17);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"user,admin,recharge_record,charging_record,charger,socket,maintenance_record,user_feedback\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-14 15:48:00', 173);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-14 15:50:01', 32);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-14 15:50:01', 35);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:43:15', 110);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:43:19', 23);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12,13,14,15,16,17,18,19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:43:32', 50);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"recharge_record,charger,charging_record,maintenance_record,user_feedback,socket,recharge_records\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:44:09', 209);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"20\"],\"tableName\":[\"charger\"],\"tableComment\":[\"存储充电桩相关信息\"],\"className\":[\"Charger\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"83\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充电桩的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"chargerId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"84\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"充电桩所属区域\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"region\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"checkbox\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"85\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充电桩运行状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"checkbox\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"86\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电桩上插座数量\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"socketCount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.charger\"],\"moduleName\":[\"charger\"],\"businessName\":[\"chargerinfo\"],\"functionName\":[\"充电桩管理\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2006\"],\"params[parentMenuName]\":[\"充电管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:45:00', 22);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-15 07:45:03', 154);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-15 07:45:04', 35);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"充电桩管理\"],\"url\":[\"/charger/chargerinfo\"],\"target\":[\"menuItem\"],\"perms\":[\"charger:chargerinfo:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:52:05', 20);
INSERT INTO `sys_oper_log` VALUES (155, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"充电桩区域\"],\"dictType\":[\"charger_region\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:53:19', 16);
INSERT INTO `sys_oper_log` VALUES (156, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/dict/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:54:14', 8);
INSERT INTO `sys_oper_log` VALUES (157, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"南区\"],\"dictValue\":[\"1\"],\"dictType\":[\"charger_region\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:54:35', 24);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"中区\"],\"dictValue\":[\"2\"],\"dictType\":[\"charger_region\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:54:50', 24);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"北区\"],\"dictValue\":[\"3\"],\"dictType\":[\"charger_region\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:55:01', 12);
INSERT INTO `sys_oper_log` VALUES (160, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"充电桩状态\"],\"dictType\":[\"charger_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:55:45', 12);
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"启用\"],\"dictValue\":[\"1\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:55:57', 25);
INSERT INTO `sys_oper_log` VALUES (162, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"维护\"],\"dictValue\":[\"2\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:56:06', 21);
INSERT INTO `sys_oper_log` VALUES (163, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"关闭\"],\"dictValue\":[\"3\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:56:29', 20);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"20\"],\"tableName\":[\"charger\"],\"tableComment\":[\"存储充电桩相关信息\"],\"className\":[\"Charger\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"83\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充电桩的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"chargerId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"84\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"充电桩所属区域\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"region\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"checkbox\"],\"columns[1].dictType\":[\"charger_region\"],\"columns[2].columnId\":[\"85\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充电桩运行状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"checkbox\"],\"columns[2].dictType\":[\"charger_status\"],\"columns[3].columnId\":[\"86\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电桩上插座数量\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"socketCount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.charger\"],\"moduleName\":[\"charger\"],\"businessName\":[\"chargerinfo\"],\"functionName\":[\"充电桩管理\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"设备管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 07:57:32', 25);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-15 07:57:35', 112);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-15 07:57:37', 53);
INSERT INTO `sys_oper_log` VALUES (167, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"3\"],\"socketCount\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:00:06', 64);
INSERT INTO `sys_oper_log` VALUES (168, '鍏呯數妗╃鐞�', 3, 'com.ruoyi.charger.controller.ChargerController.remove()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:00:10', 12);
INSERT INTO `sys_oper_log` VALUES (169, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"1\"],\"socketCount\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:04:42', 29);
INSERT INTO `sys_oper_log` VALUES (170, '鍏呯數妗╃鐞�', 3, 'com.ruoyi.charger.controller.ChargerController.remove()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:04:57', 22);
INSERT INTO `sys_oper_log` VALUES (171, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"1\"],\"socketCount\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:12:11', 8);
INSERT INTO `sys_oper_log` VALUES (172, '鍏呯數妗╃鐞�', 3, 'com.ruoyi.charger.controller.ChargerController.remove()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:12:20', 20);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"20\"],\"tableName\":[\"charger\"],\"tableComment\":[\"存储充电桩相关信息\"],\"className\":[\"Charger\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"83\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充电桩的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"chargerId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"84\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"充电桩所属区域\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"region\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"radio\"],\"columns[1].dictType\":[\"charger_region\"],\"columns[2].columnId\":[\"85\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充电桩运行状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"charger_status\"],\"columns[3].columnId\":[\"86\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电桩上插座数量\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"socketCount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.charger\"],\"moduleName\":[\"charger\"],\"businessName\":[\"chargerinfo\"],\"functionName\":[\"充电桩管理\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"设备管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:12:39', 47);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charger', '127.0.0.1', '内网IP', '\"charger\"', NULL, 0, NULL, '2024-07-15 08:12:41', 45);
INSERT INTO `sys_oper_log` VALUES (175, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"3\"],\"socketCount\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:13', 75);
INSERT INTO `sys_oper_log` VALUES (176, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"2\"],\"status\":[\"3\"],\"socketCount\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:22', 18);
INSERT INTO `sys_oper_log` VALUES (177, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"3\"],\"status\":[\"3\"],\"socketCount\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:26', 8);
INSERT INTO `sys_oper_log` VALUES (178, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"1\"],\"socketCount\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:31', 19);
INSERT INTO `sys_oper_log` VALUES (179, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"1\"],\"socketCount\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:35', 17);
INSERT INTO `sys_oper_log` VALUES (180, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"1\"],\"status\":[\"1\"],\"socketCount\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:38', 19);
INSERT INTO `sys_oper_log` VALUES (181, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"2\"],\"status\":[\"2\"],\"socketCount\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:46', 20);
INSERT INTO `sys_oper_log` VALUES (182, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"2\"],\"status\":[\"2\"],\"socketCount\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:51', 18);
INSERT INTO `sys_oper_log` VALUES (183, '鍏呯數妗╃鐞�', 1, 'com.ruoyi.charger.controller.ChargerController.addSave()', 'POST', 1, 'admin', '研发部门', '/charger/chargerinfo/add', '127.0.0.1', '内网IP', '{\"region\":[\"2\"],\"status\":[\"1\"],\"socketCount\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:18:55', 19);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"88\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"本次充电的金额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"chargeAmount\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"90\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电开始时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"startTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"91\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电结束时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"endTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"colu', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:24:40', 48);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charging_record', '127.0.0.1', '内网IP', '\"charging_record\"', NULL, 0, NULL, '2024-07-15 08:24:47', 220);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"88\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"本次充电的金额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"chargeAmount\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"90\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电开始时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"startTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"91\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电结束时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"endTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"colu', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:30:08', 59);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"88\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"本次充电的金额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"chargeAmount\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"90\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电开始时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"startTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"91\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电结束时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"endTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"colu', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:30:57', 68);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charging_record', '127.0.0.1', '内网IP', '\"charging_record\"', NULL, 0, NULL, '2024-07-15 08:31:06', 133);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[7].columnId\":[\"94\"],\"columns[7].sort\":[\"2\"],\"columns[7].columnComment\":[\"用户的唯一编号\"],\"columns[7].javaType\":[\"Long\"],\"columns[7].javaField\":[\"userId\"],\"columns[7].isInsert\":[\"1\"],\"columns[7].isEdit\":[\"1\"],\"columns[7].isList\":[\"1\"],\"columns[7].isQuery\":[\"1\"],\"columns[7].queryType\":[\"EQ\"],\"columns[7].isRequired\":[\"1\"],\"columns[7].htmlType\":[\"input\"],\"columns[7].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[1].columnId\":[\"88\"],\"columns[1].sort\":[\"4\"],\"columns[1].columnComment\":[\"本次充电的金额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"chargeAmount\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[3].columnId\":[\"90\"],\"columns[3].sort\":[\"5\"],\"columns[3].columnComment\":[\"充电开始时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"startTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"91\"],\"columns[4].sort\":[\"6\"],\"columns[4].columnComment\":[\"充电结束时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:45:16', 95);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charging_record', '127.0.0.1', '内网IP', '\"charging_record\"', NULL, 0, NULL, '2024-07-15 08:45:20', 309);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户的唯一编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"88\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"本次充电的金额\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"chargeAmount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"90\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电开始时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"startTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"91\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"充电结束时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"endTime\"],\"columns[5].isIn', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:49:26', 93);
INSERT INTO `sys_oper_log` VALUES (192, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"用户充电状态\"],\"dictType\":[\"chargingrecord_user_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:50:41', 23);
INSERT INTO `sys_oper_log` VALUES (193, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:50:58', 25);
INSERT INTO `sys_oper_log` VALUES (194, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未完成\"],\"dictValue\":[\"2\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:51:05', 26);
INSERT INTO `sys_oper_log` VALUES (195, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"异常\"],\"dictValue\":[\"3\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:51:15', 27);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户的唯一编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"88\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"本次充电的金额\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"chargeAmount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"90\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电开始时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"startTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"91\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"充电结束时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"endTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].i', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:54:33', 37);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charging_record', '127.0.0.1', '内网IP', '\"charging_record\"', NULL, 0, NULL, '2024-07-15 08:54:36', 150);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户的唯一编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"88\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"本次充电的金额\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"chargeAmount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"90\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电开始时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"startTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"91\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"充电结束时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"endTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isLis', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 08:56:57', 97);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charging_record', '127.0.0.1', '内网IP', '\"charging_record\"', NULL, 0, NULL, '2024-07-15 08:57:00', 280);
INSERT INTO `sys_oper_log` VALUES (200, '鍏呯數璁板綍', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"\"],\"chargeAmount\":[\"\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-16\"],\"socketId\":[\"5\"],\"chargerId\":[\"5\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_amount\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_amount\' doesn\'t have a default value\n; Field \'charge_amount\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_amount\' doesn\'t have a default value', '2024-07-15 09:01:10', 85);
INSERT INTO `sys_oper_log` VALUES (201, '鍏呯數璁板綍', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"chargeAmount\":[\"50\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-16\"],\"socketId\":[\"5\"],\"chargerId\":[\"5\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,             start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-15 09:01:17', 6);
INSERT INTO `sys_oper_log` VALUES (202, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"维修工单状态\"],\"dictType\":[\"maintenance_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:04:00', 23);
INSERT INTO `sys_oper_log` VALUES (203, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:04:12', 26);
INSERT INTO `sys_oper_log` VALUES (204, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待处理\"],\"dictValue\":[\"2\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:04:27', 25);
INSERT INTO `sys_oper_log` VALUES (205, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"归档\"],\"dictValue\":[\"3\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:04:44', 23);
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"22\"],\"tableName\":[\"maintenance_record\"],\"tableComment\":[\"存储维修信息\"],\"className\":[\"MaintenanceRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"96\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"维修编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"maintenanceId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"97\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"维修时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"maintenanceTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"98\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"维修问题\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"issue\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"99\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"维修状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"record\"],\"functionName\":[\"存储维修信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"\"],\"params[parentMenuName]\":[\"\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:09:57', 63);
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"22\"],\"tableName\":[\"maintenance_record\"],\"tableComment\":[\"存储维修信息\"],\"className\":[\"MaintenanceRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"96\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"维修编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"maintenanceId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"97\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"维修时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"maintenanceTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"98\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"维修问题\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"issue\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"99\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"维修状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.maintenance_record\"],\"moduleName\":[\"maintenance_record\"],\"businessName\":[\"maintenancerecord\"],\"functionName\":[\"维修工单\"],\"formColNum\":[\"1\"],\"genType\":[\"1\"],\"params[parentMenuId]\":[\"2008\"],\"params[parentMenuName]\":[\"维修管理\"],\"genPath\":[\"C:\\\\Users\\\\Nico\\\\OneDrive\\\\School\\\\Ruoyi\\\\Tkkc-Bicycle\\\\ruoyi-maintenance_record\\\\src\"],\"subTableName\":[\"\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:13:19', 46);
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/maintenance_record', '127.0.0.1', '内网IP', '\"maintenance_record\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:13:26', 170);
INSERT INTO `sys_oper_log` VALUES (209, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"用户充值方式\"],\"dictType\":[\"recharge_record_method\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:17:17', 11);
INSERT INTO `sys_oper_log` VALUES (210, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"1\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:17:27', 11);
INSERT INTO `sys_oper_log` VALUES (211, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"微信\"],\"dictValue\":[\"2\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:17:35', 25);
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"银行卡\"],\"dictValue\":[\"3\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:17:46', 25);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"t', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:17:58', 27);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"24\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:19:24', 26);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"t', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:23:30', 40);
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/recharge_record', '127.0.0.1', '内网IP', '\"recharge_record\"', NULL, 0, NULL, '2024-07-15 09:23:34', 36);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"t', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:24:54', 40);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/recharge_record', '127.0.0.1', '内网IP', '\"recharge_record\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:25:02', 61);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"25\"],\"tableName\":[\"socket\"],\"tableComment\":[\"存储插座相关信息\"],\"className\":[\"Socket\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"110\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"插座唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"socketId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"111\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"插座归属充电桩编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"chargerId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"112\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"插座状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"charger_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.socket\"],\"moduleName\":[\"socket\"],\"businessName\":[\"socketinfo\"],\"functionName\":[\"插座管理\"],\"formColNum\":[\"1\"],\"genType\":[\"1\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"设备管理\"],\"genPath\":[\"C:\\\\Users\\\\Nico\\\\OneDrive\\\\School\\\\Ruoyi\\\\Tkkc-Bicycle\\\\ruoyi-socket\\\\src\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:26:31', 31);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/socket', '127.0.0.1', '内网IP', '\"socket\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:26:35', 51);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"22\"],\"tableName\":[\"maintenance_record\"],\"tableComment\":[\"存储维修信息\"],\"className\":[\"MaintenanceRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"96\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"维修编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"maintenanceId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"97\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"维修时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"maintenanceTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"98\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"维修问题\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"issue\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"99\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"维修状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.maintenance_record\"],\"moduleName\":[\"maintenance_record\"],\"businessName\":[\"maintenancerecord\"],\"functionName\":[\"维修工单\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2008\"],\"params[parentMenuName]\":[\"维修管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 09:34:42', 55);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/maintenance_record', '127.0.0.1', '内网IP', '\"maintenance_record\"', NULL, 0, NULL, '2024-07-15 09:34:46', 140);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"t', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 12:46:50', 48);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"25\"],\"tableName\":[\"socket\"],\"tableComment\":[\"存储插座相关信息\"],\"className\":[\"Socket\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"110\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"插座唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"socketId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"111\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"插座归属充电桩编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"chargerId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"112\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"插座状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"charger_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.socket\"],\"moduleName\":[\"socket\"],\"businessName\":[\"socketinfo\"],\"functionName\":[\"插座管理\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"设备管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 12:46:55', 20);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/maintenance_record', '127.0.0.1', '内网IP', '\"maintenance_record\"', NULL, 0, NULL, '2024-07-15 12:47:04', 158);
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/recharge_record', '127.0.0.1', '内网IP', '\"recharge_record\"', NULL, 0, NULL, '2024-07-15 12:48:46', 35);
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/socket', '127.0.0.1', '内网IP', '\"socket\"', NULL, 0, NULL, '2024-07-15 12:49:33', 25);
INSERT INTO `sys_oper_log` VALUES (228, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-purple\"],\"configType\":[\"Y\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 12:57:38', 21);
INSERT INTO `sys_oper_log` VALUES (229, '插座管理', 1, 'com.ruoyi.socket.controller.SocketController.addSave()', 'POST', 1, 'admin', '研发部门', '/socket/socketinfo/add', '127.0.0.1', '内网IP', '{\"chargerId\":[\"22\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-16 00:14:05', 243);
INSERT INTO `sys_oper_log` VALUES (230, '插座管理', 1, 'com.ruoyi.socket.controller.SocketController.addSave()', 'POST', 1, 'admin', '研发部门', '/socket/socketinfo/add', '127.0.0.1', '内网IP', '{\"chargerId\":[\"23\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-16 00:14:10', 23);
INSERT INTO `sys_oper_log` VALUES (231, '插座管理', 1, 'com.ruoyi.socket.controller.SocketController.addSave()', 'POST', 1, 'admin', '研发部门', '/socket/socketinfo/add', '127.0.0.1', '内网IP', '{\"chargerId\":[\"26\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-16 00:14:16', 23);
INSERT INTO `sys_oper_log` VALUES (232, '插座管理', 1, 'com.ruoyi.socket.controller.SocketController.addSave()', 'POST', 1, 'admin', '研发部门', '/socket/socketinfo/add', '127.0.0.1', '内网IP', '{\"chargerId\":[\"24\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-16 00:14:21', 19);
INSERT INTO `sys_oper_log` VALUES (233, '充电记录', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"chargeAmount\":[\"5\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-17\"],\"socketId\":[\"2\"],\"chargerId\":[\"22\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,             start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-16 00:23:41', 334);
INSERT INTO `sys_oper_log` VALUES (234, '充电记录', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"chargeAmount\":[\"5\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-17\"],\"socketId\":[\"1\"],\"chargerId\":[\"22\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,             start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-16 00:23:49', 11);
INSERT INTO `sys_oper_log` VALUES (235, '充电记录', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"chargeAmount\":[\"5\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-17\"],\"socketId\":[\"2\"],\"chargerId\":[\"22\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,             start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-16 00:23:53', 13);
INSERT INTO `sys_oper_log` VALUES (236, '充电记录', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"chargeAmount\":[\"5\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-17\"],\"socketId\":[\"3\"],\"chargerId\":[\"22\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,             start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-16 00:23:56', 11);
INSERT INTO `sys_oper_log` VALUES (237, '充电记录', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"chargeAmount\":[\"5\"],\"startTime\":[\"2024-07-16\"],\"endTime\":[\"2024-07-17\"],\"socketId\":[\"4\"],\"chargerId\":[\"22\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,             start_time,             end_time,             socket_id,             charger_id,             charge_status )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-16 00:23:59', 13);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"t', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-16 00:35:11', 126);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/recharge_record', '127.0.0.1', '内网IP', '\"recharge_record\"', NULL, 0, NULL, '2024-07-16 00:36:21', 132);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/recharge_record', '127.0.0.1', '内网IP', '\"recharge_record\"', NULL, 0, NULL, '2024-07-16 00:41:51', 459);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2069', '127.0.0.1', '内网IP', '2069', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2024-07-16 00:43:30', 16);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2057', '127.0.0.1', '内网IP', '2057', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2024-07-16 00:49:10', 168);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2058', '127.0.0.1', '内网IP', '2058', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-16 00:49:17', 53);
INSERT INTO `sys_oper_log` VALUES (244, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"南区\"],\"dictValue\":[\"1\"],\"dictType\":[\"charger_region\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:48:25', 100);
INSERT INTO `sys_oper_log` VALUES (245, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"中区\"],\"dictValue\":[\"2\"],\"dictType\":[\"charger_region\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:48:34', 22);
INSERT INTO `sys_oper_log` VALUES (246, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"北区\"],\"dictValue\":[\"3\"],\"dictType\":[\"charger_region\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:48:38', 18);
INSERT INTO `sys_oper_log` VALUES (247, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"启用\"],\"dictValue\":[\"1\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:49:08', 26);
INSERT INTO `sys_oper_log` VALUES (248, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"维护\"],\"dictValue\":[\"2\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:49:16', 23);
INSERT INTO `sys_oper_log` VALUES (249, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"关闭\"],\"dictValue\":[\"3\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:49:39', 28);
INSERT INTO `sys_oper_log` VALUES (250, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"异常\"],\"dictValue\":[\"3\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:49:49', 24);
INSERT INTO `sys_oper_log` VALUES (251, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"维护\"],\"dictValue\":[\"2\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:49:56', 25);
INSERT INTO `sys_oper_log` VALUES (252, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"106\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:50:55', 27);
INSERT INTO `sys_oper_log` VALUES (253, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"107\"],\"dictLabel\":[\"充电中\"],\"dictValue\":[\"2\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:51:04', 24);
INSERT INTO `sys_oper_log` VALUES (254, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"107\"],\"dictLabel\":[\"充电中\"],\"dictValue\":[\"2\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:51:07', 22);
INSERT INTO `sys_oper_log` VALUES (255, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"108\"],\"dictLabel\":[\"异常\"],\"dictValue\":[\"3\"],\"dictType\":[\"chargingrecord_user_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:51:12', 24);
INSERT INTO `sys_oper_log` VALUES (256, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"启用\"],\"dictValue\":[\"1\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:51:34', 23);
INSERT INTO `sys_oper_log` VALUES (257, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"115\"],\"dictLabel\":[\"关闭\"],\"dictValue\":[\"3\"],\"dictType\":[\"charger_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:51:41', 23);
INSERT INTO `sys_oper_log` VALUES (258, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"112\"],\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"1\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:51:57', 23);
INSERT INTO `sys_oper_log` VALUES (259, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"112\"],\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"1\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:02', 23);
INSERT INTO `sys_oper_log` VALUES (260, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"113\"],\"dictLabel\":[\"微信\"],\"dictValue\":[\"2\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:06', 25);
INSERT INTO `sys_oper_log` VALUES (261, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"112\"],\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"1\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:10', 13);
INSERT INTO `sys_oper_log` VALUES (262, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"113\"],\"dictLabel\":[\"微信\"],\"dictValue\":[\"2\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:15', 26);
INSERT INTO `sys_oper_log` VALUES (263, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"114\"],\"dictLabel\":[\"银行卡\"],\"dictValue\":[\"3\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:19', 10);
INSERT INTO `sys_oper_log` VALUES (264, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"114\"],\"dictLabel\":[\"银行卡\"],\"dictValue\":[\"3\"],\"dictType\":[\"recharge_record_method\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:23', 23);
INSERT INTO `sys_oper_log` VALUES (265, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"处理中\"],\"dictValue\":[\"3\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:45', 23);
INSERT INTO `sys_oper_log` VALUES (266, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"109\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:52:54', 24);
INSERT INTO `sys_oper_log` VALUES (267, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"111\"],\"dictLabel\":[\"归档\"],\"dictValue\":[\"3\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:53:02', 13);
INSERT INTO `sys_oper_log` VALUES (268, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"110\"],\"dictLabel\":[\"待处理\"],\"dictValue\":[\"2\"],\"dictType\":[\"maintenance_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:53:06', 21);
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"20\"],\"tableName\":[\"charger\"],\"tableComment\":[\"存储充电桩相关信息\"],\"className\":[\"Charger\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"83\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充电桩的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"chargerId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"84\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"充电桩所属区域\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"region\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"radio\"],\"columns[1].dictType\":[\"charger_region\"],\"columns[2].columnId\":[\"85\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充电桩运行状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"charger_status\"],\"columns[3].columnId\":[\"86\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充电桩上插座数量\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"socketCount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.charger\"],\"moduleName\":[\"charger\"],\"businessName\":[\"chargerinfo\"],\"functionName\":[\"充电桩管理\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"设备管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:54:08', 41);
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"charging_record\"],\"tableComment\":[\"存储用户的充电记录\"],\"className\":[\"ChargingRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"87\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充电记录序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"transactionId\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户的唯一编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"89\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"本次充电时长\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"chargeDuration\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"88\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"本次充电的金额\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"chargeAmount\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"90\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充电开始时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"startTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"91\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"充电结束时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"endTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"BETWEEN\"],\"columns[5].', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:56:32', 35);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"22\"],\"tableName\":[\"maintenance_record\"],\"tableComment\":[\"存储维修信息\"],\"className\":[\"MaintenanceRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"96\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"维修编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"maintenanceId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"97\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"维修时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"maintenanceTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"98\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"维修问题\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"issue\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"99\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"维修状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.maintenance_record\"],\"moduleName\":[\"maintenance_record\"],\"businessName\":[\"maintenancerecord\"],\"functionName\":[\"维修工单\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2008\"],\"params[parentMenuName]\":[\"维修管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:56:58', 34);
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.recharge_record\"],\"moduleName\":[\"recharge_record\"],\"businessName\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:57:22', 24);
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:58:11', 129);
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:58:29', 22);
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"user,admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:58:37', 44);
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"28\"],\"tableName\":[\"admin\"],\"tableComment\":[\"存储管理员信息\"],\"className\":[\"Admin\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"137\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"管理员的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"adminId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"138\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"管理员密码\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"password\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"139\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"所分配充电桩的负责区域\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"assignedRegion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"checkbox\"],\"columns[2].dictType\":[\"charger_region\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"admin\"],\"functionName\":[\"存储管理员信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:59:21', 18);
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"29\"],\"tableName\":[\"user\"],\"tableComment\":[\"存储用户个人信息\"],\"className\":[\"User\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"140\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"141\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户自定义昵称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"username\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"142\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户设置的密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"143\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户的账号剩余金额\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"balance\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"user\"],\"functionName\":[\"用户个人信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 07:59:50', 19);
INSERT INTO `sys_oper_log` VALUES (278, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"28\"],\"tableName\":[\"admin\"],\"tableComment\":[\"存储管理员信息\"],\"className\":[\"Admin\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"137\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"管理员的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"adminId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"138\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"管理员密码\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"password\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"139\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"所分配充电桩的负责区域\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"assignedRegion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"checkbox\"],\"columns[2].dictType\":[\"charger_region\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"admin\"],\"functionName\":[\"管理员信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:00:00', 28);
INSERT INTO `sys_oper_log` VALUES (279, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"25\"],\"tableName\":[\"socket\"],\"tableComment\":[\"存储插座相关信息\"],\"className\":[\"Socket\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"110\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"插座唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"socketId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"111\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"插座归属充电桩编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"chargerId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"112\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"插座状态\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"charger_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.socket\"],\"moduleName\":[\"socket\"],\"businessName\":[\"socketinfo\"],\"functionName\":[\"插座管理\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"设备管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:01:13', 22);
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.recharge_record\"],\"moduleName\":[\"rechar', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:01:26', 28);
INSERT INTO `sys_oper_log` VALUES (281, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"recharge_record\"],\"tableComment\":[\"存储用户充值信息记录\"],\"className\":[\"RechargeRecord\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"100\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"充值序号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"rechargeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"101\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"102\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"充值金额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"amount\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"103\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"充值方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"method\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"recharge_record_method\"],\"columns[4].columnId\":[\"104\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"充值时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"rechargeTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.recharge_record\"],\"moduleName\":[\"recharg', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:01:49', 25);
INSERT INTO `sys_oper_log` VALUES (282, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/user_feedback', '127.0.0.1', '内网IP', '\"user_feedback\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:03:32', 35);
INSERT INTO `sys_oper_log` VALUES (283, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"26\"],\"tableName\":[\"user_feedback\"],\"tableComment\":[\"存储用户的反馈信息内容\"],\"className\":[\"UserFeedback\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"需要维修的问题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"issue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户提供平台优化建议\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"suggestion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"144\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"反馈状态显示\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"feedback\"],\"functionName\":[\"反馈信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2003\"],\"params[parentMenuName]\":[\"反馈管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"user\"],\"subTableF', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:04:24', 22);
INSERT INTO `sys_oper_log` VALUES (284, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/charging_record', '127.0.0.1', '内网IP', '\"charging_record\"', NULL, 0, NULL, '2024-07-17 08:05:49', 302);
INSERT INTO `sys_oper_log` VALUES (285, '充电记录', 1, 'com.ruoyi.chargingRecord.controller.ChargingRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/chargingRecord/charingRecordinfo/add', '127.0.0.1', '内网IP', '{\"userId\":[\"11\"],\"chargeAmount\":[\"11\"],\"startTime\":[\"\"],\"endTime\":[\"\"],\"socketId\":[\"11\"],\"chargerId\":[\"11\"],\"chargeStatus\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-chargingRecord\\target\\classes\\mapper\\chargingRecord\\ChargingRecordMapper.xml]\r\n### The error may involve com.ruoyi.chargingRecord.mapper.ChargingRecordMapper.insertChargingRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into charging_record          ( user_id,                          charge_amount,                                       socket_id,             charger_id,             charge_status )           values ( ?,                          ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value\n; Field \'charge_duration\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'charge_duration\' doesn\'t have a default value', '2024-07-17 08:33:40', 165);
INSERT INTO `sys_oper_log` VALUES (286, '维修工单', 1, 'com.ruoyi.maintenance_record.controller.MaintenanceRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/maintenance_record/maintenancerecord/add', '127.0.0.1', '内网IP', '{\"maintenanceTime\":[\"2024-07-18\"],\"issue\":[\"yiyiyiy\"],\"status\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:34:16', 26);
INSERT INTO `sys_oper_log` VALUES (287, '维修工单', 1, 'com.ruoyi.maintenance_record.controller.MaintenanceRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/maintenance_record/maintenancerecord/add', '127.0.0.1', '内网IP', '{\"maintenanceTime\":[\"2024-07-02\"],\"issue\":[\"不通电\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:34:36', 20);
INSERT INTO `sys_oper_log` VALUES (288, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/user_feedback', '127.0.0.1', '内网IP', '\"user_feedback\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:36:59', 72);
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"26\"],\"tableName\":[\"user_feedback\"],\"tableComment\":[\"存储用户的反馈信息内容\"],\"className\":[\"UserFeedback\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"需要维修的问题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"issue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户提供平台优化建议\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"suggestion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"144\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"反馈状态显示\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"feedback\"],\"functionName\":[\"反馈信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2003\"],\"params[parentMenuName]\":[\"反馈管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"user\"],\"subTableFkName\":[\"user_id\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:37:07', 45);
INSERT INTO `sys_oper_log` VALUES (290, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"26\"],\"tableName\":[\"user_feedback\"],\"tableComment\":[\"存储用户的反馈信息内容\"],\"className\":[\"UserFeedback\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"需要维修的问题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"issue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户提供平台优化建议\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"suggestion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"144\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"反馈状态显示\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"feedback\"],\"functionName\":[\"反馈信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2003\"],\"params[parentMenuName]\":[\"反馈管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"user\"],\"subTableFkName\":[\"user_id\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:37:11', 33);
INSERT INTO `sys_oper_log` VALUES (291, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/user_feedback', '127.0.0.1', '内网IP', '\"user_feedback\"', NULL, 0, NULL, '2024-07-17 08:37:14', 68);
INSERT INTO `sys_oper_log` VALUES (292, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"26\"],\"tableName\":[\"user_feedback\"],\"tableComment\":[\"存储用户的反馈信息内容\"],\"className\":[\"UserFeedback\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"需要维修的问题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"issue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户提供平台优化建议\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"suggestion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"144\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"反馈状态显示\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.ruoyi_feedback\"],\"moduleName\":[\"userfeedback\"],\"businessName\":[\"feedback\"],\"functionName\":[\"反馈信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2003\"],\"params[parentMenuName]\":[\"反馈管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"user\"],\"subTableFkName\":[\"user_id\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:37:57', 30);
INSERT INTO `sys_oper_log` VALUES (293, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/user_feedback', '127.0.0.1', '内网IP', '\"user_feedback\"', NULL, 0, NULL, '2024-07-17 08:38:00', 30);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"26\"],\"tableName\":[\"user_feedback\"],\"tableComment\":[\"存储用户的反馈信息内容\"],\"className\":[\"UserFeedback\"],\"functionAuthor\":[\"incohua\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户的唯一编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"需要维修的问题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"issue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户提供平台优化建议\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"suggestion\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"144\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"反馈状态显示\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"maintenance_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.ruoyi-feedback\"],\"moduleName\":[\"userfeedback\"],\"businessName\":[\"feedback\"],\"functionName\":[\"反馈信息\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2003\"],\"params[parentMenuName]\":[\"反馈管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"user\"],\"subTableFkName\":[\"user_id\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-17 08:42:05', 35);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/user_feedback', '127.0.0.1', '内网IP', '\"user_feedback\"', NULL, 0, NULL, '2024-07-17 08:42:09', 44);
INSERT INTO `sys_oper_log` VALUES (296, '反馈信息', 1, 'com.ruoyi.ruoyi_feedback.controller.UserFeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/userfeedback/feedback/add', '127.0.0.1', '内网IP', '{\"issue\":[\"11111\"],\"suggestion\":[\"211212\"],\"status\":[\"3\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Nico\\OneDrive\\School\\Ruoyi\\Tkkc-Bicycle\\ruoyi-feedback\\target\\classes\\mapper\\userfeedback\\UserFeedbackMapper.xml]\r\n### The error may involve com.ruoyi.ruoyi_feedback.mapper.UserFeedbackMapper.insertUserFeedback-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_feedback          ( issue,             suggestion,             status )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2024-07-17 08:45:15', 139);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-07-14 14:13:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-07-14 14:13:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-07-14 14:13:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-07-14 14:13:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2024-07-14 14:13:19', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2024-07-14 14:13:19', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '08a9ebb6ce5272ed6a0c3bbe063e7f63', 'e09b5d', '0', '0', '127.0.0.1', '2024-07-17 16:45:01', '2024-07-14 22:24:17', 'admin', '2024-07-14 14:13:19', '', '2024-07-17 08:45:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2024-07-14 14:13:19', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('d86d590e-9c8b-4b38-a84d-abacf1b58cd3', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-07-17 15:47:20', '2024-07-17 16:45:01', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户的唯一编号',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户自定义昵称',
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户设置的密码',
  `balance` decimal(20, 2) NOT NULL COMMENT '用户的账号剩余金额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储用户个人信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback`  (
  `user_id` int NOT NULL COMMENT '用户的唯一编号',
  `issue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '需要维修的问题',
  `suggestion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户提供平台优化建议',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈状态显示',
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储用户的反馈信息内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户的唯一编号',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户自定义昵称',
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户设置的密码',
  `balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '用户的账号剩余金额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
