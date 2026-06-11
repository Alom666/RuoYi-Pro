/*
 Navicat Premium Dump SQL

 Source Server         : YY
 Source Server Type    : MySQL
 Source Server Version : 80046 (8.0.46)
 Source Host           : localhost:3306
 Source Schema         : ry-pro

 Target Server Type    : MySQL
 Target Server Version : 80046 (8.0.46)
 File Encoding         : 65001

 Date: 11/06/2026 11:20:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for mes_completion_order
-- ----------------------------
DROP TABLE IF EXISTS `mes_completion_order`;
CREATE TABLE `mes_completion_order`  (
  `completion_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单号',
  `production_plan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产计划编号',
  `homework_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产作业名称',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `product_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `completion_date` datetime NULL DEFAULT NULL COMMENT '完工日期',
  `production_quantity` int NULL DEFAULT NULL COMMENT '生产数量',
  `batch_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产批号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态：0未入库,1入库中,2已入库,3检验合格,4检验未合格',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`completion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'MES-生产完工单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_completion_order
-- ----------------------------
INSERT INTO `mes_completion_order` VALUES (1, 'CO-2026-001', 'PP-2026-001', '发动机总装作业', '汽油发动机', 'EA888', '2.0T/162kW', '台', '2026-06-01 00:00:00', 50, 'BATCH-20260601-001', '2', 'admin', '2026-06-04 22:26:11', 'admin', '2026-06-04 22:28:30', '首批完工，质检通过');
INSERT INTO `mes_completion_order` VALUES (2, 'CO-2026-002', 'PP-2026-002', '变速箱装配作业', '双离合变速箱', 'DQ381', '7速/380Nm', '台', '2026-06-05 00:00:00', 30, 'BATCH-20260605-002', '0', 'admin', '2026-06-04 22:26:11', 'admin', '2026-06-04 22:34:49', '待入库');

-- ----------------------------
-- Table structure for mes_homework_assembly
-- ----------------------------
DROP TABLE IF EXISTS `mes_homework_assembly`;
CREATE TABLE `mes_homework_assembly`  (
  `assembly_id` bigint NOT NULL AUTO_INCREMENT COMMENT '作业装配ID（编号）',
  `homework_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业名称',
  `production_plan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产计划编号',
  `scheduling_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划排产编号',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `product_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `production_quantity` int NOT NULL COMMENT '生产数量',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `homework_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '作业状态：0未执行,1执行中,2已完成,3异常',
  `material_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '生产作业物料信息备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`assembly_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'MES-作业装配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_homework_assembly
-- ----------------------------
INSERT INTO `mes_homework_assembly` VALUES (1, '发动机总成装配', 'PP-2026-001', 'SC-2026-001', '汽油发动机', 'EA888', '2.0T/162kW', '台', 50, '2026-06-01 08:00:00', '2026-06-15 18:00:00', '2', '缸体、缸盖、曲轴、连杆、活塞组件已齐套', 'admin', '2026-06-04 20:36:46', '', '2026-06-04 20:36:46', '优先装配批次');
INSERT INTO `mes_homework_assembly` VALUES (2, '变速箱装配作业', 'PP-2026-002', 'SC-2026-002', '双离合变速箱', 'DQ381', '7速/380Nm', '台', 30, '2026-06-10 08:00:00', '2026-06-25 18:00:00', '1', '齿轮组、同步器、离合器模块已入库', 'admin', '2026-06-04 20:36:46', '', '2026-06-04 20:36:46', '注意温度控制');
INSERT INTO `mes_homework_assembly` VALUES (3, '底盘焊接装配', 'PP-2026-003', 'SC-2026-003', '前副车架', 'MQB-A', '钢制/焊接', '件', 100, '2026-07-01 08:00:00', '2026-07-20 18:00:00', '0', '钢板原材料已到位，焊丝已备料', 'admin', '2026-06-04 20:36:46', '', '2026-06-04 20:36:46', NULL);
INSERT INTO `mes_homework_assembly` VALUES (4, '电池包组装', 'PP-2026-004', 'SC-2026-004', '三元锂电池包', 'NE-75', '75kWh/350V', '组', 20, '2026-06-05 08:00:00', '2026-06-08 18:00:00', '3', '电芯到货缺10组，BMS模块待检', 'admin', '2026-06-04 20:36:46', 'admin', '2026-06-04 20:43:55', '物料短缺需协调');

-- ----------------------------
-- Table structure for mes_incoming_inspection
-- ----------------------------
DROP TABLE IF EXISTS `mes_incoming_inspection`;
CREATE TABLE `mes_incoming_inspection`  (
  `inspection_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `serial_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流水号',
  `material_apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领料单号',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料名称',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `required_quantity` int NULL DEFAULT NULL COMMENT '需求数量',
  `received_quantity` int NULL DEFAULT NULL COMMENT '已领数量',
  `sample_quantity` int NOT NULL COMMENT '抽检数量',
  `inspection_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检验项',
  `standard_upper` decimal(10, 2) NULL DEFAULT NULL COMMENT '标准值上限',
  `standard_lower` decimal(10, 2) NULL DEFAULT NULL COMMENT '标准值下限',
  `test_value` decimal(10, 2) NOT NULL COMMENT '检验值',
  `test_result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检验结果：0合格,1不合格',
  `inspector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检验人',
  `inspection_date` date NULL DEFAULT NULL COMMENT '检验时间（仅年月日）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`inspection_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '来料检验表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_incoming_inspection
-- ----------------------------
INSERT INTO `mes_incoming_inspection` VALUES (31, 'IQC-2026-0001', 'LL-2026-001', '铜线', '0.5mm', 'CW-050', '卷', 100, 80, 10, '线径测量', 0.55, 0.45, 0.50, '0', '张三', '2026-06-01', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '正常');
INSERT INTO `mes_incoming_inspection` VALUES (32, 'IQC-2026-0002', 'LL-2026-002', '电阻器', '10KΩ', 'R-10K', '个', 500, 450, 50, '阻值检测', 10.50, 9.50, 10.20, '0', '李四', '2026-06-02', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '正常');
INSERT INTO `mes_incoming_inspection` VALUES (33, 'IQC-2026-0003', 'LL-2026-003', '电容器', '100μF', 'C-100', '个', 300, 280, 30, '容量检测', 110.00, 90.00, 115.00, '1', '王五', '2026-06-03', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '容量超标，不合格');
INSERT INTO `mes_incoming_inspection` VALUES (34, 'IQC-2026-0004', 'LL-2026-004', 'PCB板', 'FR-4', 'PCB-A01', '块', 200, 180, 20, '外观检查', 2.00, 3.00, 4.00, '0', '张三', '2026-06-04', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '外观合格');
INSERT INTO `mes_incoming_inspection` VALUES (35, 'IQC-2026-0005', 'LL-2026-005', '焊锡丝', '0.8mm', 'SN-080', '卷', 50, 40, 5, '成分分析', 99.50, 98.00, 99.30, '0', '李四', '2026-06-05', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '成分合格');
INSERT INTO `mes_incoming_inspection` VALUES (36, 'IQC-2026-0006', 'LL-2026-001', '铜线', '0.5mm', 'CW-050', '卷', 100, 80, 10, '抗拉强度', 250.00, 200.00, 230.00, '0', '王五', '2026-06-05', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '强度合格');
INSERT INTO `mes_incoming_inspection` VALUES (37, 'IQC-2026-0007', 'LL-2026-006', '连接器', 'USB-C', 'CN-UC01', '个', 150, 120, 15, '插拔力测试', 20.00, 5.00, 12.00, '0', '张三', '2026-06-06', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '插拔力合格');
INSERT INTO `mes_incoming_inspection` VALUES (38, 'IQC-2026-0008', 'LL-2026-007', 'LED灯珠', '5050', 'LED-5050', '个', 1000, 900, 100, '亮度检测', 25.00, 15.00, 22.00, '0', '李四', '2026-06-07', 'admin', '2026-06-04 23:34:37', '', '2026-06-04 23:34:37', '亮度合格');
INSERT INTO `mes_incoming_inspection` VALUES (39, 'IQC-2026-0009', 'LL-2026-008', '散热片', '60x60mm', 'HS-6060', '个', 80, 60, 8, '尺寸检测', 60.50, 59.50, 60.80, '1', '王五', '2026-06-08', 'admin', '2026-06-04 23:34:37', 'admin', '2026-06-04 23:39:38', '尺寸偏大，不合格');
INSERT INTO `mes_incoming_inspection` VALUES (40, 'IQC-2026-0010', 'LL-2026-009', '导热硅脂', '5W/mK', 'TG-5W', '支', 30, 25, 3, '导热系数', 5.50, 4.50, 5.10, '1', '张三', '2026-06-09', 'admin', '2026-06-04 23:34:37', 'admin', '2026-06-06 13:56:42', '导热系数合格');

-- ----------------------------
-- Table structure for mes_material_apply
-- ----------------------------
DROP TABLE IF EXISTS `mes_material_apply`;
CREATE TABLE `mes_material_apply`  (
  `apply_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '领料单号',
  `production_plan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产计划编号',
  `scheduling_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划排产编号',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `product_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `pending_quantity` int NULL DEFAULT NULL COMMENT '待产数量',
  `production_date` datetime NULL DEFAULT NULL COMMENT '生产日期',
  `receive_date` datetime NOT NULL COMMENT '领取日期',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `audit_opinion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '审核意见',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'MES-领料申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_material_apply
-- ----------------------------
INSERT INTO `mes_material_apply` VALUES (1, 'ML-2026-0001', 'PP-2026-001', 'SC-2026-001', '汽油发动机', 'EA888', '2.0T/162kW', '台', 50, '2026-06-10 00:00:00', '2026-06-08 00:00:00', '张三', '2026-06-05 09:30:00', '2', '李主管', '2026-06-05 14:00:00', '0', '同意，请尽快领取', 'admin', '2026-06-05 09:30:00', '', '2026-06-04 21:23:33', '一期发动机产线领料');
INSERT INTO `mes_material_apply` VALUES (2, 'ML-2026-0002', 'PP-2026-002', 'SC-2026-002', '双离合变速箱', 'DQ381', '7速/380Nm', '台', 30, '2026-06-12 00:00:00', '2026-06-10 00:00:00', '李四', '2026-06-06 10:15:00', '2', 'admin', '2026-06-04 21:57:57', '0', NULL, 'admin', '2026-06-06 10:15:00', 'admin', '2026-06-04 21:57:57', '变速箱产线领料');
INSERT INTO `mes_material_apply` VALUES (3, 'ML-2026-0003', 'PP-2026-003', 'SC-2026-003', '前副车架', 'MQB-A', '钢制/焊接', '件', 100, '2026-06-15 00:00:00', '2026-06-13 00:00:00', '王五', '2026-06-07 11:00:00', '2', 'admin', '2026-06-04 21:57:52', '1', NULL, 'admin', '2026-06-07 11:00:00', 'admin', '2026-06-04 21:57:52', '副车架产线领料');
INSERT INTO `mes_material_apply` VALUES (4, 'ML-2026-0004', 'PP-2026-004', 'SC-2026-004', '三元锂电池包', 'NE-75', '75kWh/350V', '组', 20, '2026-06-18 00:00:00', '2026-06-16 00:00:00', '赵六', '2026-06-08 08:45:00', '2', '周经理', '2026-06-08 16:30:00', '1', '物料库存不足，请调整数量后重新申请', 'admin', '2026-06-08 08:45:00', '', '2026-06-04 21:23:33', '电池产线领料');

-- ----------------------------
-- Table structure for mes_material_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `mes_material_apply_detail`;
CREATE TABLE `mes_material_apply_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT COMMENT '明细编号',
  `apply_id` bigint NOT NULL COMMENT '领料申请ID',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `required_quantity` int NULL DEFAULT NULL COMMENT '需求数量',
  `received_quantity` int NULL DEFAULT NULL COMMENT '已领数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `idx_apply_id`(`apply_id` ASC) USING BTREE,
  CONSTRAINT `fk_detail_apply` FOREIGN KEY (`apply_id`) REFERENCES `mes_material_apply` (`apply_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '领料申请明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_material_apply_detail
-- ----------------------------
INSERT INTO `mes_material_apply_detail` VALUES (1, 1, '缸体铸件', 'CY-EA888-01', '铸铁/灰口', '件', 50, 50, '已全部领取');
INSERT INTO `mes_material_apply_detail` VALUES (2, 1, '曲轴总成', 'QS-EA888-01', '锻钢/40Cr', '根', 50, 30, '部分领取');
INSERT INTO `mes_material_apply_detail` VALUES (3, 2, '齿轮组', 'CL-DQ381-01', '20CrMnTi', '套', 30, 0, '');
INSERT INTO `mes_material_apply_detail` VALUES (4, 2, '离合器片', 'LP-DQ381-01', '摩擦/有机', '片', 60, 0, '双片配置');
INSERT INTO `mes_material_apply_detail` VALUES (7, 4, '电芯模组', 'NE-75-CELL', '50Ah/三元', '组', 80, 0, '');
INSERT INTO `mes_material_apply_detail` VALUES (8, 4, 'BMS控制板', 'NE-75-BMS', '350V/CAN', '块', 20, 0, '');
INSERT INTO `mes_material_apply_detail` VALUES (9, 3, '冲压钢板', 'MB-MQBA-01', 'Q235/3mm', '张', 200, 0, '');
INSERT INTO `mes_material_apply_detail` VALUES (10, 3, '焊接螺母', 'NM-MQBA-01', 'M10/镀锌', '个', 600, 0, '含防松型');

-- ----------------------------
-- Table structure for mes_production_sampling
-- ----------------------------
DROP TABLE IF EXISTS `mes_production_sampling`;
CREATE TABLE `mes_production_sampling`  (
  `sampling_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `serial_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流水号',
  `plan_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划编号',
  `homework_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业名称',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料名称',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `inspection_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检验项',
  `production_quantity` int NULL DEFAULT NULL COMMENT '生产数量',
  `sampling_quantity` int NOT NULL COMMENT '采样数量',
  `test_value` decimal(10, 2) NOT NULL COMMENT '检验值',
  `threshold_upper` decimal(10, 2) NULL DEFAULT NULL COMMENT '阈值上限',
  `threshold_lower` decimal(10, 2) NULL DEFAULT NULL COMMENT '阈值下限',
  `test_result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检验结果：0合格,1不合格',
  `inspector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检验人',
  `inspection_date` date NULL DEFAULT NULL COMMENT '检验时间（仅年月日）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sampling_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生产采样表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_production_sampling
-- ----------------------------
INSERT INTO `mes_production_sampling` VALUES (1, 'SPL-20260601-001', 'PL-2026-001', '铝合金板材切割作业', '铝合金板材', '2000×1000×3mm', 'AL-6061', '张', '抗拉强度', 500, 10, 280.50, 310.00, 240.00, '0', '张检验', '2026-06-01', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '抗拉强度合格');
INSERT INTO `mes_production_sampling` VALUES (2, 'SPL-20260601-002', 'PL-2026-001', '铝合金板材切割作业', '铝合金板材', '2000×1000×3mm', 'AL-6061', '张', '抗拉强度', 500, 10, 230.00, 310.00, 240.00, '1', '张检验', '2026-06-01', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '抗拉强度不合格，低于下限');
INSERT INTO `mes_production_sampling` VALUES (3, 'SPL-20260602-001', 'PL-2026-002', '不锈钢管材弯管作业', '不锈钢管材', 'Φ25×2mm', 'SUS-304', '根', '硬度', 300, 8, 175.00, 200.00, 150.00, '0', '李检测', '2026-06-02', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '硬度合格');
INSERT INTO `mes_production_sampling` VALUES (4, 'SPL-20260602-002', 'PL-2026-002', '不锈钢管材弯管作业', '不锈钢管材', 'Φ25×2mm', 'SUS-304', '根', '硬度', 300, 8, 145.00, 200.00, 150.00, '1', '李检测', '2026-06-02', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '硬度不合格');
INSERT INTO `mes_production_sampling` VALUES (5, 'SPL-20260603-001', 'PL-2026-003', '铜线材拉丝作业', '铜线材', 'Φ1.5mm', 'CU-T2', 'kg', '导电率', 1000, 20, 98.50, 100.00, 95.00, '0', '王质检', '2026-06-03', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '导电率合格');
INSERT INTO `mes_production_sampling` VALUES (6, 'SPL-20260603-002', 'PL-2026-003', '铜线材拉丝作业', '铜线材', 'Φ1.5mm', 'CU-T2', 'kg', '导电率', 1000, 20, 96.80, 100.00, 95.00, '0', '王质检', '2026-06-03', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '导电率合格');
INSERT INTO `mes_production_sampling` VALUES (7, 'SPL-20260604-001', 'PL-2026-004', '碳钢板材焊接作业', '碳钢板材', '1500×6000×10mm', 'Q235B', '张', '抗拉强度', 200, 5, 265.00, 310.00, 240.00, '0', '赵检验', '2026-06-04', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '焊接后抗拉强度合格');
INSERT INTO `mes_production_sampling` VALUES (8, 'SPL-20260604-002', 'PL-2026-004', '碳钢板材焊接作业', '碳钢板材', '1500×6000×10mm', 'Q235B', '张', '硬度', 200, 5, 185.00, 200.00, 150.00, '0', '赵检验', '2026-06-04', 'admin', '2026-06-04 23:24:48', '', '2026-06-04 23:24:48', '硬度合格');
INSERT INTO `mes_production_sampling` VALUES (9, 'SPL-20260605-001', 'PL-2026-005', '电机组件装配作业', '电机组件', '380V/5.5kW', 'MJ-380', '台', '导电率', 50, 3, 97.20, 100.00, 95.00, '0', '张检', '2026-06-05', 'admin', '2026-06-04 23:24:48', 'admin', '2026-06-06 13:56:27', '电机导电率合格');
INSERT INTO `mes_production_sampling` VALUES (10, 'SPL-20260605-002', 'PL-2026-005', '减速机总成装配作业', '减速机总成', '1:50', 'JS-100', '台', '硬度', 30, 2, 160.00, 200.00, 150.00, '1', '李检测', '2026-06-05', 'admin', '2026-06-04 23:24:48', 'admin', '2026-06-06 13:56:22', '减速机硬度合格');

-- ----------------------------
-- Table structure for mes_quality_standard
-- ----------------------------
DROP TABLE IF EXISTS `mes_quality_standard`;
CREATE TABLE `mes_quality_standard`  (
  `standard_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `inspection_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检验项目',
  `inspection_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检验类型',
  `standard_upper` decimal(10, 2) NOT NULL COMMENT '标准值上限',
  `standard_lower` decimal(10, 2) NOT NULL COMMENT '标准值下限',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`standard_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '质检标准表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_quality_standard
-- ----------------------------
INSERT INTO `mes_quality_standard` VALUES (1, 1, '铝合金板材', 'AL-6061', '2000×1000×3mm', '张', '抗拉强度', '来料检验', 310.00, 240.00, 'admin', '2026-06-04 23:09:05', '', '2026-06-04 23:09:05', '来料抗拉强度标准');
INSERT INTO `mes_quality_standard` VALUES (2, 2, '不锈钢管材', 'SUS-304', 'Φ25×2mm', '根', '硬度', '过程检验', 200.00, 150.00, 'admin', '2026-06-04 23:09:05', 'admin', '2026-06-04 23:37:21', '过程硬度检测标准');
INSERT INTO `mes_quality_standard` VALUES (3, 3, '铜线材', 'CU-T2', 'Φ1.5mm', 'kg', '导电率', '成品检验', 100.00, 95.00, 'admin', '2026-06-04 23:09:05', '', '2026-06-04 23:09:05', '成品导电率检测标准');

-- ----------------------------
-- Table structure for mytask_inbound_audit
-- ----------------------------
DROP TABLE IF EXISTS `mytask_inbound_audit`;
CREATE TABLE `mytask_inbound_audit`  (
  `audit_id` int NOT NULL AUTO_INCREMENT COMMENT '审核ID（编号）',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请单号',
  `related_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联单据号',
  `business_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型：0生产入库、1采购入库、2退货入库',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同号',
  `contract_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同类型：0采购合同、1销售合同',
  `apply_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请类型',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` datetime NULL DEFAULT NULL COMMENT '申请日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请状态：0未提交、1待审核、2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核日期',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态：0通过、1驳回',
  `audit_opinion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核意见',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '我的任务-入库申请审核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mytask_inbound_audit
-- ----------------------------
INSERT INTO `mytask_inbound_audit` VALUES (1, 'RK20260601001', 'PO20260601001', '1', '华为技术有限公司', 'HT20260101', '0', '采购入库', '曾学川', '2026-06-04 14:00:00', '1', 'admin', '2026-06-04 14:02:56', '1', '不通过', 'admin', '2026-06-04 13:48:12', 'admin', '2026-06-04 14:02:55', NULL);
INSERT INTO `mytask_inbound_audit` VALUES (2, 'RK20260602001', 'TH20260602001', '2', '中兴通讯股份有限公司', 'HT20260202', '1', '退货入库', 'ry', '2026-06-02 00:00:00', '2', 'admin', '2026-06-08 22:31:40', '1', '审核通过，同意入', 'ry', '2026-06-04 13:48:12', 'admin', '2026-06-08 22:31:39', NULL);

-- ----------------------------
-- Table structure for mytask_purchase_audit
-- ----------------------------
DROP TABLE IF EXISTS `mytask_purchase_audit`;
CREATE TABLE `mytask_purchase_audit`  (
  `audit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请单号',
  `apply_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请类型(0计划申请 1补货申请)',
  `plan_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划单号',
  `replenishment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补货单号',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` datetime NULL DEFAULT NULL COMMENT '申请日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请状态(0未提交 1待审核 2已审核)',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核日期',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态(0通过 1驳回)',
  `audit_opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核意见',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购申请审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mytask_purchase_audit
-- ----------------------------
INSERT INTO `mytask_purchase_audit` VALUES (5, 'CQ-20260601-001', '0', 'JH-2026-001', 'BH-2026-002', 'admin', '2026-06-01 00:00:00', '1', 'admin', '2026-06-04 19:58:52', '1', NULL, '计划采购申请', 'admin', '2026-06-04 19:56:26', 'admin', '2026-06-04 19:58:52');
INSERT INTO `mytask_purchase_audit` VALUES (6, 'CQ-20260602-002', '1', 'JH-2026-002', 'BH-2026-001', 'ry', '2026-06-02 00:00:00', '1', 'admin', '2026-06-04 19:58:40', '0', NULL, '补货采购申请', 'ry', '2026-06-04 19:56:26', 'admin', '2026-06-04 19:58:40');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
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
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
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
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
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
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
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
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for scm_purchase_apply
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_apply`;
CREATE TABLE `scm_purchase_apply`  (
  `apply_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请单号',
  `apply_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请类型：0计划申请,1补货申请',
  `plan_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划单号',
  `replenishment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补货单号',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核日期',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `audit_opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核意见',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_apply
-- ----------------------------
INSERT INTO `scm_purchase_apply` VALUES (1, 'PA-20260610-1001', '0', 'PL-20260601-001', NULL, 'admin', '2026-06-10', '2', 'admin', '2026-06-12', '0', '同意采购', 'admin', '2026-06-05 14:18:52', '', '2026-06-05 14:18:52', 'Q3动力总成采购');
INSERT INTO `scm_purchase_apply` VALUES (2, 'PA-20260615-1002', '1', NULL, 'RP-20260615-001', 'admin', '2026-06-15', '0', NULL, NULL, NULL, NULL, 'admin', '2026-06-05 14:18:52', 'admin', '2026-06-05 14:19:31', '新能源产线补货');

-- ----------------------------
-- Table structure for scm_purchase_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_apply_detail`;
CREATE TABLE `scm_purchase_apply_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `apply_id` bigint NOT NULL,
  `seq_no` int NULL DEFAULT NULL,
  `material_id` bigint NULL DEFAULT NULL,
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `purchase_quantity` int NULL DEFAULT NULL COMMENT '采购数量',
  `required_quantity` int NULL DEFAULT NULL COMMENT '需求数量',
  `required_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `apply_id`(`apply_id` ASC) USING BTREE,
  CONSTRAINT `scm_purchase_apply_detail_ibfk_1` FOREIGN KEY (`apply_id`) REFERENCES `scm_purchase_apply` (`apply_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购申请明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_apply_detail
-- ----------------------------
INSERT INTO `scm_purchase_apply_detail` VALUES (1, 1, 1, 101, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 10, 10, '2026-07-01', NULL);
INSERT INTO `scm_purchase_apply_detail` VALUES (2, 1, 2, 102, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 10, 10, '2026-07-01', NULL);
INSERT INTO `scm_purchase_apply_detail` VALUES (7, 2, 1, 103, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 65000.00, 5, 3, '2026-07-15', NULL);
INSERT INTO `scm_purchase_apply_detail` VALUES (8, 2, 2, 106, '驱动电机', 'EM-150', '150kW/永磁', '台', 12000.00, 8, 8, '2026-07-15', NULL);

-- ----------------------------
-- Table structure for scm_purchase_arrival
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_arrival`;
CREATE TABLE `scm_purchase_arrival`  (
  `arrival_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `arrival_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '到货单号',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同编号',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `arrival_date` date NOT NULL COMMENT '到货日期',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态：0未入库,1入库中,2已入库',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`arrival_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购到货主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_arrival
-- ----------------------------
INSERT INTO `scm_purchase_arrival` VALUES (1, 'PA-20260610-1001', 'PC-20260601-1001', '博世汽车零部件', '张伟', '021-55551234', '2026-06-10', '0', 'admin', '2026-06-05 17:11:35', '', '2026-06-05 17:11:35', '首批发动机到货');
INSERT INTO `scm_purchase_arrival` VALUES (2, 'PA-20260615-1002', 'PC-20260602-1002', '大陆集团', '李娜', '021-55559876', '2026-06-15', '1', 'admin', '2026-06-05 17:11:35', '', '2026-06-05 17:11:35', '电池包到货入库中');
INSERT INTO `scm_purchase_arrival` VALUES (3, 'PA-20260620-1003', 'PC-20260603-1003', '采埃孚传动系统', '王强', '0512-55551111', '2026-06-20', '2', 'admin', '2026-06-05 17:11:35', '', '2026-06-05 17:11:35', '变速箱到货已入库');
INSERT INTO `scm_purchase_arrival` VALUES (4, 'PA-20260625-1004', 'PC-20260604-1004', '电装株式会社', '赵敏', '0512-55552222', '2026-06-25', '0', 'admin', '2026-06-05 17:11:35', '', '2026-06-05 17:11:35', '电机到货待入库');
INSERT INTO `scm_purchase_arrival` VALUES (5, 'PA-20260630-1005', 'PC-20260605-1005', '麦格纳国际', '刘洋', '010-55553333', '2026-06-30', '0', 'admin', '2026-06-05 17:11:35', '', '2026-06-05 17:11:35', '车架到货待入库');
INSERT INTO `scm_purchase_arrival` VALUES (6, 'PA-20260605-2043', 'PC-20260605-1005', '麦格纳国际', '刘洋', '010-55553333', '2026-06-08', '0', 'admin', '2026-06-05 17:14:23', '', '2026-06-05 17:14:23', NULL);

-- ----------------------------
-- Table structure for scm_purchase_arrival_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_arrival_detail`;
CREATE TABLE `scm_purchase_arrival_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `arrival_id` bigint NOT NULL,
  `seq_no` int NULL DEFAULT NULL,
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `order_quantity` int NULL DEFAULT NULL COMMENT '合同订货数量',
  `arrival_quantity` int NULL DEFAULT NULL COMMENT '到货数量',
  `batch_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产批号',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `arrival_id`(`arrival_id` ASC) USING BTREE,
  CONSTRAINT `scm_purchase_arrival_detail_ibfk_1` FOREIGN KEY (`arrival_id`) REFERENCES `scm_purchase_arrival` (`arrival_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购到货明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_arrival_detail
-- ----------------------------
INSERT INTO `scm_purchase_arrival_detail` VALUES (1, 1, 1, '汽油发动机', 'EA888', '2.0T/162kW', '台', 2, 2, 'BATCH-20260610-001', NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (2, 1, 2, '涡轮增压器', 'TC-28', '28mm/单涡管', '件', 1, 1, 'BATCH-20260610-002', NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (3, 2, 1, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 1, 1, 'BATCH-20260615-001', NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (4, 3, 1, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 2, 2, 'BATCH-20260620-001', NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (5, 4, 1, '驱动电机', 'EM-150', '150kW/永磁', '台', 1, 1, NULL, NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (6, 4, 2, 'MCU控制器', 'MCU-01', '400V/IGBT', '个', 1, 1, NULL, NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (7, 5, 1, '前副车架', 'MQB-A', '钢制/焊接', '件', 2, 2, NULL, NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (8, 5, 2, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 2, 2, NULL, NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (9, 6, 1, '前副车架', 'MQB-A', '钢制/焊接', '件', 2, 2, NULL, NULL);
INSERT INTO `scm_purchase_arrival_detail` VALUES (10, 6, 2, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for scm_purchase_contract
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_contract`;
CREATE TABLE `scm_purchase_contract`  (
  `contract_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同编号',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `total_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '合同金额',
  `delivery_date` date NULL DEFAULT NULL COMMENT '交货日期',
  `delivery_method` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '送货方式：0快递,1物流',
  `delivery_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `sign_date` date NULL DEFAULT NULL COMMENT '签订日期',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请时间',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核时间',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购合同主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_contract
-- ----------------------------
INSERT INTO `scm_purchase_contract` VALUES (1, 'PC-20260601-1001', 'PA-20260520-001', '博世汽车零部件', '张伟', '021-55551234', 98000.00, '2026-07-15', '0', '上海市浦东新区张江高科技园区', '2026-06-01', 'admin', '2026-06-01', '2', 'admin', '2026-06-02', '0', 'admin', '2026-06-05 16:49:57', '', '2026-06-05 16:49:57', '首批发动机采购合同');
INSERT INTO `scm_purchase_contract` VALUES (2, 'PC-20260602-1002', 'PA-20260521-002', '大陆集团', '李娜', '021-55559876', 65000.00, '2026-07-20', '1', '上海市嘉定区安亭镇', '2026-06-02', 'admin', '2026-06-02', '2', 'admin', '2026-06-03', '0', 'admin', '2026-06-05 16:49:57', '', '2026-06-05 16:49:57', '电池包采购');
INSERT INTO `scm_purchase_contract` VALUES (3, 'PC-20260603-1003', 'PA-20260522-003', '采埃孚传动系统', '王强', '0512-55551111', 56000.00, '2026-08-01', '1', '苏州市工业园区', '2026-06-03', 'admin', '2026-06-03', '1', NULL, NULL, NULL, 'admin', '2026-06-05 16:49:57', '', '2026-06-05 16:49:57', '变速箱采购待审核');
INSERT INTO `scm_purchase_contract` VALUES (4, 'PC-20260604-1004', 'PA-20260523-004', '电装株式会社', '赵敏', '0512-55552222', 17000.00, '2026-08-10', '0', '苏州市高新区', '2026-06-04', 'admin', '2026-06-04', '1', NULL, NULL, NULL, 'admin', '2026-06-05 16:49:57', 'admin', '2026-06-05 16:54:30', '电机采购未提交');
INSERT INTO `scm_purchase_contract` VALUES (5, 'PC-20260605-1005', 'PA-20260524-005', '麦格纳国际', '刘洋', '010-55553333', 13600.00, '2026-08-15', '0', '北京市顺义区', '2026-06-05', 'admin', '2026-06-05', '2', 'admin', '2026-06-05', '1', 'admin', '2026-06-05 16:49:57', '', '2026-06-05 16:49:57', '车架采购已驳回');

-- ----------------------------
-- Table structure for scm_purchase_contract_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_contract_detail`;
CREATE TABLE `scm_purchase_contract_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL,
  `seq_no` int NULL DEFAULT NULL,
  `material_id` bigint NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `order_quantity` int NULL DEFAULT NULL COMMENT '订货数量',
  `amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `contract_id`(`contract_id` ASC) USING BTREE,
  CONSTRAINT `scm_purchase_contract_detail_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `scm_purchase_contract` (`contract_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购合同明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_contract_detail
-- ----------------------------
INSERT INTO `scm_purchase_contract_detail` VALUES (1, 1, 1, 101, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 2, 70000.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (2, 1, 2, 108, '涡轮增压器', 'TC-28', '28mm/单涡管', '件', 28000.00, 1, 28000.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (3, 2, 1, 103, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 65000.00, 1, 65000.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (4, 3, 1, 102, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 2, 56000.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (7, 5, 1, 104, '前副车架', 'MQB-A', '钢制/焊接', '件', 4500.00, 2, 9000.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (8, 5, 2, 105, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 2300.00, 2, 4600.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (9, 4, 1, 106, '驱动电机', 'EM-150', '150kW/永磁', '台', 12000.00, 1, 12000.00, NULL);
INSERT INTO `scm_purchase_contract_detail` VALUES (10, 4, 2, 107, 'MCU控制器', 'MCU-01', '400V/IGBT', '个', 5000.00, 1, 5000.00, NULL);

-- ----------------------------
-- Table structure for scm_sales_contract
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_contract`;
CREATE TABLE `scm_sales_contract`  (
  `contract_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同编号',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户名称',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `total_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '金额合计',
  `delivery_date` date NULL DEFAULT NULL COMMENT '交货日期',
  `delivery_method` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '送货方式：0快递,1物流',
  `delivery_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `sign_date` date NULL DEFAULT NULL COMMENT '签订日期',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请时间',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核时间',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售合同主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_contract
-- ----------------------------
INSERT INTO `scm_sales_contract` VALUES (1, 'SC-20260601-0001', 'SO-20260601-0001', '华东汽车集团', '张伟', '13800001111', 98000.00, '2026-07-15', '0', '上海市浦东新区张江路88号', '2026-06-05', '若依', '2026-06-01', '2', 'admin', '2026-06-06', '0', 'admin', '2026-06-05 01:14:53', '', '2026-06-05 01:14:53', '首批合同');
INSERT INTO `scm_sales_contract` VALUES (2, 'SC-20260602-0002', 'SO-20260602-0002', '南方新能源科技', '李娜', '13900002222', 156000.00, '2026-07-20', '1', '深圳市南山区科技园路12号', '2026-06-08', '若依', '2026-06-02', '1', NULL, NULL, NULL, 'admin', '2026-06-05 01:14:53', '', '2026-06-05 01:14:53', '待审核合同');
INSERT INTO `scm_sales_contract` VALUES (3, 'SC-20260603-0003', 'SO-20260603-0003', '北方重工机械', '王强', '13700003333', 68000.00, '2026-08-01', '0', '北京市朝阳区建国路100号', NULL, 'admin', '2026-06-03', '0', NULL, NULL, NULL, 'admin', '2026-06-05 01:14:53', '', '2026-06-05 01:14:53', '未提交合同');

-- ----------------------------
-- Table structure for scm_sales_contract_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_contract_detail`;
CREATE TABLE `scm_sales_contract_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL COMMENT '合同ID',
  `seq_no` int NULL DEFAULT NULL COMMENT '序号',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `order_quantity` int NULL DEFAULT NULL COMMENT '订货数量',
  `amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `contract_id`(`contract_id` ASC) USING BTREE,
  CONSTRAINT `scm_sales_contract_detail_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `scm_sales_contract` (`contract_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售合同明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_contract_detail
-- ----------------------------
INSERT INTO `scm_sales_contract_detail` VALUES (1, 1, 1, 101, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 2, 70000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (2, 1, 2, 104, '前副车架', 'MQB-A', '钢制/焊接', '件', 4500.00, 2, 9000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (3, 1, 3, 105, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 6800.00, 2, 13600.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (4, 1, 4, 108, '涡轮增压器', 'TC-28', '28mm/单涡管', '件', 5200.00, 1, 5400.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (5, 2, 1, 103, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 65000.00, 2, 130000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (6, 2, 2, 106, '驱动电机', 'EM-150', '150kW/永磁', '台', 12000.00, 1, 12000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (7, 2, 3, 107, 'MCU控制器', 'MCU-01', '400V/IGBT', '个', 8500.00, 2, 17000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (8, 3, 1, 102, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 2, 56000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (9, 3, 2, 104, '前副车架', 'MQB-A', '钢制/焊接', '件', 4500.00, 2, 9000.00, NULL);
INSERT INTO `scm_sales_contract_detail` VALUES (10, 3, 3, 108, '涡轮增压器', 'TC-28', '28mm/单涡管', '件', 5200.00, 1, 3000.00, NULL);

-- ----------------------------
-- Table structure for scm_sales_order
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_order`;
CREATE TABLE `scm_sales_order`  (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `customer_id` bigint NULL DEFAULT NULL COMMENT '客户ID',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户名称',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `total_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '金额合计',
  `delivery_date` date NULL DEFAULT NULL COMMENT '交货日期',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请时间',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核时间',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售订单主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_order
-- ----------------------------
INSERT INTO `scm_sales_order` VALUES (1, 'SO-20260601-0001', 1, '华东汽车集团', '张伟', '13800001111', 98000.00, '2026-07-16', '若依', '2026-06-01', '0', 'admin', '2026-06-02', '0', 'admin', '2026-06-05 00:35:17', 'admin', '2026-06-05 00:37:47', '首批订单');
INSERT INTO `scm_sales_order` VALUES (2, 'SO-20260602-0002', 2, '南方新能源科技', '李娜', '13900002222', 235500.00, '2026-07-20', '若依', '2026-06-02', '1', NULL, NULL, NULL, 'admin', '2026-06-05 00:35:17', 'admin', '2026-06-05 00:37:59', '待审核订');
INSERT INTO `scm_sales_order` VALUES (3, 'SO-20260603-0003', 3, '北方重工机械', '王强', '13700003333', 68000.00, '2026-08-01', 'admin', '2026-06-03', '0', NULL, NULL, NULL, 'admin', '2026-06-05 00:35:17', '', '2026-06-05 00:35:17', '未提交订单');

-- ----------------------------
-- Table structure for scm_sales_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_order_detail`;
CREATE TABLE `scm_sales_order_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL COMMENT '销售订单ID',
  `seq_no` int NULL DEFAULT NULL COMMENT '序号',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `order_quantity` int NULL DEFAULT NULL COMMENT '订货数量',
  `amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `scm_sales_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `scm_sales_order` (`order_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售订单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_order_detail
-- ----------------------------
INSERT INTO `scm_sales_order_detail` VALUES (7, 3, 1, 102, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 2, 56000.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (8, 3, 2, 108, '涡轮增压器', 'TC-28', '28mm/单涡管', '件', 5200.00, 2, 10400.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (15, 1, 1, 101, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 2, 70000.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (16, 1, 2, 104, '前副车架', 'MQB-A', '钢制/焊接', '件', 4500.00, 2, 9000.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (17, 1, 3, 105, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 6800.00, 2, 13600.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (18, 2, 1, 103, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 65000.00, 2, 130000.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (19, 2, 2, 106, '驱动电机', 'EM-150', '150kW/永磁', '台', 12000.00, 1, 12000.00, NULL);
INSERT INTO `scm_sales_order_detail` VALUES (20, 2, 3, 107, 'MCU控制器', 'MCU-01', '400V/IGBT', '个', 8500.00, 11, 93500.00, NULL);

-- ----------------------------
-- Table structure for scm_sales_plan
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_plan`;
CREATE TABLE `scm_sales_plan`  (
  `plan_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `plan_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划单号',
  `plan_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划标题',
  `plan_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划类型：0年度计划,1季度计划,2月计划',
  `start_date` date NULL DEFAULT NULL COMMENT '起始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售计划主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_plan
-- ----------------------------
INSERT INTO `scm_sales_plan` VALUES (1, 'SP-2026-0001', '2026年度销售计划', '0', '2026-01-01', '2026-12-31', 'admin', '2026-06-05 00:16:37', '', '2026-06-05 00:16:37', '全年销售目标');
INSERT INTO `scm_sales_plan` VALUES (2, 'SP-2026-Q1', '2026年第一季度销售计划', '1', '2026-01-01', '2026-03-31', 'admin', '2026-06-05 00:16:37', '', '2026-06-05 00:16:37', 'Q1销售目标');
INSERT INTO `scm_sales_plan` VALUES (3, 'SP-2026-06', '2026年6月销售计划', '2', '2026-06-01', '2026-06-30', 'admin', '2026-06-05 00:16:37', 'admin', '2026-06-05 00:18:32', '6月销售目标');

-- ----------------------------
-- Table structure for scm_sales_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_plan_detail`;
CREATE TABLE `scm_sales_plan_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint NOT NULL COMMENT '销售计划ID',
  `seq_no` int NULL DEFAULT NULL COMMENT '序号',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `sales_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '销售额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `plan_id`(`plan_id` ASC) USING BTREE,
  CONSTRAINT `scm_sales_plan_detail_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `scm_sales_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售计划指标配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_plan_detail
-- ----------------------------
INSERT INTO `scm_sales_plan_detail` VALUES (1, 1, 1, 101, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 4200000.00, NULL);
INSERT INTO `scm_sales_plan_detail` VALUES (2, 1, 2, 102, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 3360000.00, NULL);
INSERT INTO `scm_sales_plan_detail` VALUES (3, 1, 3, 103, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 65000.00, 5200000.00, NULL);
INSERT INTO `scm_sales_plan_detail` VALUES (4, 2, 1, 101, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 1050000.00, NULL);
INSERT INTO `scm_sales_plan_detail` VALUES (5, 2, 2, 104, '前副车架', 'MQB-A', '钢制/焊接', '件', 4500.00, 540000.00, NULL);
INSERT INTO `scm_sales_plan_detail` VALUES (12, 3, 1, 102, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 560000.00, NULL);
INSERT INTO `scm_sales_plan_detail` VALUES (13, 3, 2, 105, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 6800.00, 136000.00, NULL);

-- ----------------------------
-- Table structure for scm_sales_return
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_return`;
CREATE TABLE `scm_sales_return`  (
  `return_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `return_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '退货单号',
  `delivery_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发货单号',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同编号',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户名称',
  `return_date` date NOT NULL COMMENT '退货日期',
  `refund_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `inbound_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '入库状态：0未入库,1入库中,2已入库',
  `return_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退货原因',
  `delivery_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '送货方式',
  `delivery_date` date NULL DEFAULT NULL COMMENT '交货日期',
  `delivery_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`return_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售退货主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_return
-- ----------------------------
INSERT INTO `scm_sales_return` VALUES (1, 'SR-20260605-0001', 'DL-20260601-0001', 'HT-2026-001', '华东汽车集团', '2026-06-05', 39800.00, '2', '发动机异响', '公路运输', '2026-07-15', '上海市浦东新区张江路88号', '张伟', '13800001111', 'admin', '2026-06-05 01:15:46', '', '2026-06-05 01:15:46', '质量退货');
INSERT INTO `scm_sales_return` VALUES (2, 'SR-20260608-0002', 'DL-20260602-0002', 'HT-2026-002', '南方新能源科技', '2026-06-08', 65000.00, '1', '电池续航不达标', '铁路运输', '2026-07-20', '深圳市南山区科技园路66号', '李娜', '13900002222', 'admin', '2026-06-05 01:15:46', '', '2026-06-05 01:15:46', '待入库');
INSERT INTO `scm_sales_return` VALUES (3, 'SR-20260610-0003', 'DL-20260603-0003', 'HT-2026-003', '北方重工机械', '2026-06-10', 28000.00, '0', '客户取消订单', '公路运输', '2026-08-01', '沈阳市铁西区重工街120号', '王强', '13700003333', 'admin', '2026-06-05 01:15:46', '', '2026-06-05 01:15:46', '未入库');

-- ----------------------------
-- Table structure for scm_sales_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `scm_sales_return_detail`;
CREATE TABLE `scm_sales_return_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `return_id` bigint NOT NULL COMMENT '退货主表ID',
  `seq_no` int NULL DEFAULT NULL COMMENT '序号',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '价格',
  `order_quantity` int NULL DEFAULT NULL COMMENT '订货数量',
  `delivery_quantity` int NULL DEFAULT NULL COMMENT '发货数量',
  `return_quantity` int NULL DEFAULT NULL COMMENT '退货数量',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `return_id`(`return_id` ASC) USING BTREE,
  CONSTRAINT `scm_sales_return_detail_ibfk_1` FOREIGN KEY (`return_id`) REFERENCES `scm_sales_return` (`return_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '销售退货明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_sales_return_detail
-- ----------------------------
INSERT INTO `scm_sales_return_detail` VALUES (1, 1, 1, '汽油发动机', 'EA888', '2.0T/162kW', '台', 35000.00, 2, 2, 1, NULL);
INSERT INTO `scm_sales_return_detail` VALUES (2, 1, 2, '后桥总成', 'R-Axle-01', '承载1.5T', '件', 6800.00, 2, 2, 1, NULL);
INSERT INTO `scm_sales_return_detail` VALUES (3, 2, 1, '三元锂电池包', 'NE-75', '75kWh/350V', '组', 65000.00, 2, 2, 1, NULL);
INSERT INTO `scm_sales_return_detail` VALUES (4, 3, 1, '双离合变速箱', 'DQ381', '7速/380Nm', '台', 28000.00, 2, 2, 1, NULL);

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
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (9, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2026-06-04 10:35:54', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');

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
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-06-04 10:35:53', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-06-04 10:35:53', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (110, 1, '未提交', '0', 'mes_apply_status', '', 'info', 'Y', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '未提交');
INSERT INTO `sys_dict_data` VALUES (111, 2, '待审核', '1', 'mes_apply_status', '', 'warning', 'N', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (112, 3, '已审核', '2', 'mes_apply_status', '', 'success', 'N', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '已审核');
INSERT INTO `sys_dict_data` VALUES (113, 1, '通过', '0', 'mes_audit_status', '', 'success', 'Y', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '审核通过');
INSERT INTO `sys_dict_data` VALUES (114, 2, '驳回', '1', 'mes_audit_status', '', 'danger', 'N', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '审核驳回');
INSERT INTO `sys_dict_data` VALUES (115, 1, '未入库', '0', 'sys_completion_status', '', 'info', 'Y', '0', 'admin', '2026-06-04 22:26:06', '', NULL, '未入库');
INSERT INTO `sys_dict_data` VALUES (116, 2, '入库中', '1', 'sys_completion_status', '', '', 'N', '0', 'admin', '2026-06-04 22:26:06', '', NULL, '入库中');
INSERT INTO `sys_dict_data` VALUES (117, 3, '已入库', '2', 'sys_completion_status', '', 'success', 'N', '0', 'admin', '2026-06-04 22:26:06', '', NULL, '已入库');
INSERT INTO `sys_dict_data` VALUES (118, 4, '检验合格', '3', 'sys_completion_status', '', 'success', 'N', '0', 'admin', '2026-06-04 22:26:06', '', NULL, '检验合格');
INSERT INTO `sys_dict_data` VALUES (119, 5, '检验未合格', '4', 'sys_completion_status', '', 'danger', 'N', '0', 'admin', '2026-06-04 22:26:06', '', NULL, '检验未合格');
INSERT INTO `sys_dict_data` VALUES (120, 1, '合格', '0', 'mes_test_result', '', 'success', 'Y', '0', 'admin', '2026-06-04 23:32:21', '', NULL, '合格');
INSERT INTO `sys_dict_data` VALUES (121, 2, '不合格', '1', 'mes_test_result', '', 'danger', 'N', '0', 'admin', '2026-06-04 23:32:21', '', NULL, '不合格');
INSERT INTO `sys_dict_data` VALUES (122, 1, '年度计划', '0', 'sys_plan_type', '', 'primary', 'N', '0', 'admin', '2026-06-05 00:16:10', '', NULL, '年度计划');
INSERT INTO `sys_dict_data` VALUES (123, 2, '季度计划', '1', 'sys_plan_type', '', 'success', 'N', '0', 'admin', '2026-06-05 00:16:10', '', NULL, '季度计划');
INSERT INTO `sys_dict_data` VALUES (124, 3, '月计划', '2', 'sys_plan_type', '', 'warning', 'N', '0', 'admin', '2026-06-05 00:16:10', '', NULL, '月计划');
INSERT INTO `sys_dict_data` VALUES (125, 1, '未提交', '0', 'sys_apply_status', '', 'info', 'N', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '未提交');
INSERT INTO `sys_dict_data` VALUES (126, 2, '待审核', '1', 'sys_apply_status', '', 'warning', 'N', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (127, 3, '已审核', '2', 'sys_apply_status', '', 'success', 'N', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '已审核');
INSERT INTO `sys_dict_data` VALUES (128, 1, '通过', '0', 'sys_audit_status', '', 'success', 'N', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '通过');
INSERT INTO `sys_dict_data` VALUES (129, 2, '驳回', '1', 'sys_audit_status', '', 'danger', 'N', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '驳回');
INSERT INTO `sys_dict_data` VALUES (130, 1, '快递', '0', 'sys_delivery_method', '', 'primary', 'N', '0', 'admin', '2026-06-05 01:14:29', '', NULL, '快递');
INSERT INTO `sys_dict_data` VALUES (131, 2, '物流', '1', 'sys_delivery_method', '', 'success', 'N', '0', 'admin', '2026-06-05 01:14:29', '', NULL, '物流');
INSERT INTO `sys_dict_data` VALUES (132, 1, '未入库', '0', 'sys_inbound_status', '', 'info', 'N', '0', 'admin', '2026-06-05 01:15:46', '', NULL, '未入库');
INSERT INTO `sys_dict_data` VALUES (133, 2, '入库中', '1', 'sys_inbound_status', '', 'warning', 'N', '0', 'admin', '2026-06-05 01:15:46', '', NULL, '入库中');
INSERT INTO `sys_dict_data` VALUES (134, 3, '已入库', '2', 'sys_inbound_status', '', 'success', 'N', '0', 'admin', '2026-06-05 01:15:46', '', NULL, '已入库');
INSERT INTO `sys_dict_data` VALUES (135, 1, '计划申请', '0', 'sys_apply_type', '', 'primary', 'Y', '0', 'admin', '2026-06-05 14:18:15', '', NULL, '计划申请');
INSERT INTO `sys_dict_data` VALUES (136, 2, '补货申请', '1', 'sys_apply_type', '', 'warning', 'N', '0', 'admin', '2026-06-05 14:18:15', '', NULL, '补货申请');
INSERT INTO `sys_dict_data` VALUES (137, 1, '未入库', '0', 'sys_arrival_status', NULL, NULL, 'N', '0', 'admin', NULL, '', NULL, '未入库');
INSERT INTO `sys_dict_data` VALUES (138, 2, '入库中', '1', 'sys_arrival_status', NULL, NULL, 'N', '0', 'admin', NULL, '', NULL, '入库中');
INSERT INTO `sys_dict_data` VALUES (139, 3, '已入库', '2', 'sys_arrival_status', NULL, NULL, 'N', '0', 'admin', NULL, '', NULL, '已入库');
INSERT INTO `sys_dict_data` VALUES (140, 1, '生产入库', '0', 'wms_business_type', '', 'default', 'N', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '生产入库');
INSERT INTO `sys_dict_data` VALUES (141, 2, '采购入库', '1', 'wms_business_type', '', 'primary', 'Y', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '采购入库');
INSERT INTO `sys_dict_data` VALUES (142, 3, '退货入库', '2', 'wms_business_type', '', 'warning', 'N', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '退货入库');
INSERT INTO `sys_dict_data` VALUES (143, 1, '采购合同', '0', 'wms_contract_type', '', 'primary', 'Y', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '采购合同');
INSERT INTO `sys_dict_data` VALUES (144, 2, '销售合同', '1', 'wms_contract_type', '', 'success', 'N', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '销售合同');
INSERT INTO `sys_dict_data` VALUES (145, 1, '未提交', '0', 'wms_apply_status', '', 'info', 'Y', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '未提交');
INSERT INTO `sys_dict_data` VALUES (146, 2, '待审核', '1', 'wms_apply_status', '', 'warning', 'N', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (147, 3, '已审核', '2', 'wms_apply_status', '', 'success', 'N', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '已审核');
INSERT INTO `sys_dict_data` VALUES (148, 1, '通过', '0', 'wms_audit_status', '', 'success', 'Y', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '审核通过');
INSERT INTO `sys_dict_data` VALUES (149, 2, '驳回', '1', 'wms_audit_status', '', 'danger', 'N', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '审核驳回');
INSERT INTO `sys_dict_data` VALUES (150, 1, '领料出库', '0', 'wms_outbound_business_type', '', 'primary', 'Y', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '领料出库');
INSERT INTO `sys_dict_data` VALUES (151, 2, '销售出库', '1', 'wms_outbound_business_type', '', 'success', 'N', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '销售出库');
INSERT INTO `sys_dict_data` VALUES (152, 1, '未分拣', '0', 'wms_doc_status', '', 'info', 'Y', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '未分拣');
INSERT INTO `sys_dict_data` VALUES (153, 2, '已分拣', '1', 'wms_doc_status', '', 'primary', 'N', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '已分拣');
INSERT INTO `sys_dict_data` VALUES (154, 3, '已盘点', '2', 'wms_doc_status', '', 'warning', 'N', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '已盘点');
INSERT INTO `sys_dict_data` VALUES (155, 4, '已发货', '3', 'wms_doc_status', '', 'success', 'N', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '已发货');
INSERT INTO `sys_dict_data` VALUES (156, 1, '未采购', '0', 'wms_purchase_status', '', 'info', 'Y', '0', 'admin', '2026-06-05 18:34:27', '', NULL, '未采购');
INSERT INTO `sys_dict_data` VALUES (157, 2, '采购中', '1', 'wms_purchase_status', '', 'warning', 'N', '0', 'admin', '2026-06-05 18:34:27', '', NULL, '采购中');
INSERT INTO `sys_dict_data` VALUES (158, 1, '月盘', '0', 'wms_count_type', '', 'primary', 'Y', '0', 'admin', '2026-06-05 18:37:57', '', NULL, '月盘');
INSERT INTO `sys_dict_data` VALUES (159, 2, '季盘', '1', 'wms_count_type', '', 'warning', 'N', '0', 'admin', '2026-06-05 18:37:57', '', NULL, '季盘');

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
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-06-04 10:35:54', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (200, '申请状态', 'mes_apply_status', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '领料申请状态');
INSERT INTO `sys_dict_type` VALUES (201, '审核状态', 'mes_audit_status', '0', 'admin', '2026-06-04 21:57:10', '', NULL, '领料审核状态');
INSERT INTO `sys_dict_type` VALUES (202, '检验结果', 'mes_test_result', '0', 'admin', '2026-06-04 23:32:14', '', NULL, '检验结果字典');
INSERT INTO `sys_dict_type` VALUES (203, '计划类型', 'sys_plan_type', '0', 'admin', '2026-06-05 00:16:10', '', NULL, '计划类型列表');
INSERT INTO `sys_dict_type` VALUES (204, '申请状态', 'sys_apply_status', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '申请状态列表');
INSERT INTO `sys_dict_type` VALUES (205, '审核状态', 'sys_audit_status', '0', 'admin', '2026-06-05 00:34:46', '', NULL, '审核状态列表');
INSERT INTO `sys_dict_type` VALUES (206, '送货方式', 'sys_delivery_method', '0', 'admin', '2026-06-05 01:14:29', '', NULL, '送货方式列表');
INSERT INTO `sys_dict_type` VALUES (207, '入库状态', 'sys_inbound_status', '0', 'admin', '2026-06-05 01:15:46', '', NULL, '入库状态列表');
INSERT INTO `sys_dict_type` VALUES (208, '到货状态', 'sys_arrival_status', '0', 'admin', NULL, 'admin', '2026-06-06 23:11:16', '到货状态：0未入库,1入库中,2已入库');
INSERT INTO `sys_dict_type` VALUES (209, '业务类型', 'wms_business_type', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '业务类型列表');
INSERT INTO `sys_dict_type` VALUES (210, '合同类型', 'wms_contract_type', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '合同类型列表');
INSERT INTO `sys_dict_type` VALUES (211, '申请状态', 'wms_apply_status', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '申请状态列表');
INSERT INTO `sys_dict_type` VALUES (212, '审核状态', 'wms_audit_status', '0', 'admin', '2026-06-05 18:25:25', '', NULL, '审核状态列表');
INSERT INTO `sys_dict_type` VALUES (213, '出库业务类型', 'wms_outbound_business_type', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '出库业务类型列表');
INSERT INTO `sys_dict_type` VALUES (214, '单据状态', 'wms_doc_status', '0', 'admin', '2026-06-05 18:29:34', '', NULL, '单据状态列表');
INSERT INTO `sys_dict_type` VALUES (215, '采购状态', 'wms_purchase_status', '0', 'admin', '2026-06-05 18:34:27', '', NULL, '采购状态列表');
INSERT INTO `sys_dict_type` VALUES (216, '盘点类型', 'wms_count_type', '0', 'admin', '2026-06-05 18:37:57', '', NULL, '盘点类型列表');

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
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-06-04 10:35:54', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-06-04 10:35:54', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-06-04 10:35:54', '', NULL, '');

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
  `start_time` datetime NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-08 22:25:25');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-08 23:27:23');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-09 17:56:12');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-11 10:42:13');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-06-11 11:14:49');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-11 11:14:52');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2071 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-06-04 10:35:53', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-06-04 10:35:53', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-06-04 10:35:53', 'admin', '2026-06-04 23:53:13', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 8, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '1', '', '404', 'admin', '2026-06-04 10:35:53', 'admin', '2026-06-06 23:54:44', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-06-04 10:35:53', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-06-04 10:35:53', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-06-04 10:35:53', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-06-04 10:35:53', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-06-04 10:35:53', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-06-04 10:35:53', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-06-04 10:35:53', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-06-04 10:35:53', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-06-04 10:35:53', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-06-04 10:35:53', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-06-04 10:35:53', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-06-04 10:35:53', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-06-04 10:35:53', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-06-04 10:35:53', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-06-04 10:35:53', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-06-04 10:35:53', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-06-04 10:35:53', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-06-04 10:35:53', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-06-04 10:35:53', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-06-04 10:35:53', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '我的任务', 0, 3, 'myTask', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'user', 'admin', '2026-06-04 13:53:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '流程审核', 2000, 1, 'audit', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-04 13:53:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '入库申请审核', 2001, 1, 'inboundAudit', 'mes/inboundAudit/index', NULL, '', 1, 0, 'C', '0', '0', 'myTask:inboundAudit:list', '#', 'admin', '2026-06-04 13:53:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '采购申请审核', 2001, 2, 'purchaseAudit', 'myTask/purchaseAudit/index', NULL, '', 1, 0, 'C', '0', '0', 'myTask:purchaseAudit:list', '#', 'admin', '2026-06-04 19:16:39', 'admin', '2026-06-04 23:02:00', '');
INSERT INTO `sys_menu` VALUES (2004, '制造执行MES', 0, 4, 'mes', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'email', 'admin', '2026-06-04 20:07:57', 'admin', '2026-06-06 23:09:12', '');
INSERT INTO `sys_menu` VALUES (2005, '生产管理', 2004, 1, 'production', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-04 20:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '作业装配', 2005, 1, 'assembly', 'mes/assembly/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:HomeworkAssembly:list', '#', 'admin', '2026-06-04 20:11:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '领料申请', 2005, 2, 'materialApply', 'mes/materialApply/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:materialApply:list', '#', 'admin', '2026-06-04 20:12:20', 'admin', '2026-06-04 23:01:42', '');
INSERT INTO `sys_menu` VALUES (2008, '生产完工单', 2005, 3, 'completionOrder', 'mes/completionOrder/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:completionOrder:list', '#', 'admin', '2026-06-04 20:13:23', 'admin', '2026-06-04 23:01:48', '');
INSERT INTO `sys_menu` VALUES (2026, '质量管理', 2004, 2, 'quality', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-04 22:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '质检标准', 2026, 1, 'qualityStandard', 'mes/qualityStandard/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:qualityStandard:list', '#', 'admin', '2026-06-04 22:58:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '生产采样', 2026, 2, 'productionSampling', 'mes/productionSampling/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:productionSampling:list', '#', 'admin', '2026-06-04 22:58:55', 'admin', '2026-06-04 23:01:04', '');
INSERT INTO `sys_menu` VALUES (2029, '来料检验', 2026, 3, 'incomingInspection', 'mes/incomingInspection/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:incomingInspection:list', '#', 'admin', '2026-06-04 22:59:34', 'admin', '2026-06-04 23:01:24', '');
INSERT INTO `sys_menu` VALUES (2030, '质量报告', 2026, 4, 'qualityReport', 'mes/qualityReport/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:qualityReport:list', '#', 'admin', '2026-06-04 23:00:07', 'admin', '2026-06-04 23:01:32', '');
INSERT INTO `sys_menu` VALUES (2031, '产品检验', 2026, 5, 'productInspection', 'mes/productInspection/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:productInspection:list', '#', 'admin', '2026-06-04 23:00:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '质量追溯', 2026, 6, 'qualityTrace', 'mes/qualityTrace/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:qualityTrace:list', '#', 'admin', '2026-06-04 23:02:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '防错管理', 2026, 7, 'errorPrevention', 'mes/errorPrevention/index', NULL, '', 1, 0, 'C', '0', '0', 'mes:errorPrevention:list', '#', 'admin', '2026-06-04 23:03:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '供应链SCM', 0, 5, 'scm', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2026-06-04 23:52:56', 'admin', '2026-06-04 23:53:07', '');
INSERT INTO `sys_menu` VALUES (2040, '销售管理', 2039, 1, 'sales', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-04 23:53:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '销售计划', 2040, 1, 'salesPlan', 'scm/salesPlan/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:salesPlan:list', '#', 'admin', '2026-06-04 23:58:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '销售订单', 2040, 2, 'salesOrder', 'scm/salesOrder/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:salesOrder:list', '#', 'admin', '2026-06-04 23:59:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '销售合同', 2040, 3, 'salesContract', 'scm/salesContract/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:salesContract:list', '#', 'admin', '2026-06-04 23:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '销售退货', 2040, 4, 'salesReturn', 'scm/salesReturn/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:salesReturn:list', '#', 'admin', '2026-06-05 00:00:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '采购管理', 2039, 2, 'purchase', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-05 12:52:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '采购申请', 2045, 1, 'purchaseApply', 'scm/purchaseApply/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:purchaseApply:list', '#', 'admin', '2026-06-05 12:52:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '采购合同', 2045, 2, 'purchaseContract', 'scm/purchaseContract/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:purchaseContract:list', '#', 'admin', '2026-06-05 12:53:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '采购到货', 2045, 3, 'purchaseArrival', 'scm/purchaseArrival/index', NULL, '', 1, 0, 'C', '0', '0', 'scm:purchaseArrival:list', '#', 'admin', '2026-06-05 12:54:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '智能仓储WMS', 0, 6, 'wms', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2026-06-05 17:51:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '基础数据', 2049, 1, 'base', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-05 17:52:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '库存业务', 2049, 2, 'stock', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2026-06-05 17:52:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '物料分类', 2050, 1, 'materialCategory', 'wms/materialCategory/index', NULL, '', 1, 0, 'C', '0', '0', 'wms:materialCategory:list', '#', 'admin', '2026-06-05 17:53:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '仓库信息', 2050, 2, 'warehouse', 'wms/warehouse/index', NULL, '', 1, 0, 'C', '0', '0', 'wms:warehouse:list', '#', 'admin', '2026-06-05 17:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '入库申请', 2051, 1, 'inboundApply', 'wms/inboundApply/index', NULL, '', 1, 0, 'C', '0', '0', 'wms:inboundApply:list', '#', 'admin', '2026-06-05 17:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '出库申请', 2051, 2, 'outboundApply', 'wms/outboundApply/index', NULL, '', 1, 0, 'C', '0', '0', 'wms:outboundApply:list', '#', 'admin', '2026-06-05 17:54:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '补货申请', 2051, 3, 'replenishApply', 'wms/replenishApply/index', NULL, '', 1, 0, 'C', '0', '0', 'wms:replenishApply:list', '#', 'admin', '2026-06-05 17:55:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '盘点信息', 2051, 4, 'inventoryCount', 'wms/inventoryCount/index', NULL, '', 1, 0, 'C', '0', '0', 'wms:inventoryCount:list', '#', 'admin', '2026-06-05 17:55:48', '', NULL, '');

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

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE COMMENT '同一用户同一公告只记录一次'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告已读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_read
-- ----------------------------
INSERT INTO `sys_notice_read` VALUES (4, 3, 1, '2026-06-06 23:12:02');
INSERT INTO `sys_notice_read` VALUES (5, 2, 1, '2026-06-06 23:12:02');
INSERT INTO `sys_notice_read` VALUES (6, 1, 1, '2026-06-06 23:12:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 00:21:55', 36);
INSERT INTO `sys_oper_log` VALUES (2, '登录日志', 9, 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 00:22:01', 43);
INSERT INTO `sys_oper_log` VALUES (3, '入库申请审核', 2, 'com.ruoyi.myTask.controller.InboundAuditController.edit()', 'PUT', 1, 'admin', '研发部门', '/myTask/inboundAudit', '127.0.0.1', '内网IP', '{\"applicant\":\"ry\",\"applyDate\":\"2026-06-02\",\"applyNo\":\"RK20260602001\",\"applyStatus\":\"2\",\"applyType\":\"退货入库\",\"auditDate\":\"2026-06-08\",\"auditId\":2,\"auditOpinion\":\"审核通过，同意入\",\"auditStatus\":\"0\",\"auditor\":\"admin\",\"businessType\":\"2\",\"contractNo\":\"HT20260202\",\"contractType\":\"1\",\"createBy\":\"ry\",\"createTime\":\"2026-06-04 13:48:12\",\"params\":{},\"relatedNo\":\"TH20260602001\",\"supplierName\":\"中兴通讯股份有限公司\",\"updateBy\":\"admin\",\"updateTime\":\"2026-06-06 23:16:37\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-08 22:31:25', 23);
INSERT INTO `sys_oper_log` VALUES (4, '入库申请审核', 2, 'com.ruoyi.myTask.controller.InboundAuditController.edit()', 'PUT', 1, 'admin', '研发部门', '/myTask/inboundAudit', '127.0.0.1', '内网IP', '{\"applicant\":\"ry\",\"applyDate\":\"2026-06-02\",\"applyNo\":\"RK20260602001\",\"applyStatus\":\"2\",\"applyType\":\"退货入库\",\"auditDate\":\"2026-06-08\",\"auditId\":2,\"auditOpinion\":\"审核通过，同意入\",\"auditStatus\":\"1\",\"auditor\":\"admin\",\"businessType\":\"2\",\"contractNo\":\"HT20260202\",\"contractType\":\"1\",\"createBy\":\"ry\",\"createTime\":\"2026-06-04 13:48:12\",\"params\":{},\"relatedNo\":\"TH20260602001\",\"supplierName\":\"中兴通讯股份有限公司\",\"updateBy\":\"admin\",\"updateTime\":\"2026-06-08 22:31:25\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-08 22:31:39', 15);

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
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-06-04 10:35:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-06-04 10:35:53', '', NULL, '');

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
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
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
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-06-04 10:35:53', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '0', '0', 'admin', '2026-06-04 10:35:53', 'admin', '2026-06-06 23:08:27', '普通角色');

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
INSERT INTO `sys_role_menu` VALUES (2, 117);
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

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'MES经理', '00', 'MES123@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-11 11:14:52', '2026-06-04 10:35:53', 'admin', '2026-06-04 10:35:53', '', '2026-06-06 23:14:41', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-04 10:35:53', '2026-06-04 10:35:53', 'admin', '2026-06-04 10:35:53', '', NULL, '测试员');

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
-- Table structure for wms_inbound_apply
-- ----------------------------
DROP TABLE IF EXISTS `wms_inbound_apply`;
CREATE TABLE `wms_inbound_apply`  (
  `apply_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请单号',
  `related_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联单据号',
  `business_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务类型：0生产入库,1采购入库,2退货入库',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同号',
  `contract_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同类型：0采购合同,1销售合同',
  `apply_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请类型',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核日期',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `audit_opinion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '审核意见',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'WMS入库申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inbound_apply
-- ----------------------------
INSERT INTO `wms_inbound_apply` VALUES (1, 'RK-2026-001', 'PO-2026-001', '1', '华为技术有限公司', 'CG-2026-001', '0', '采购入库', '张三', '2026-06-01', '2', 'admin', '2026-06-02', '0', '同意入库', 'admin', '2026-06-05 18:25:25', '', '2026-06-05 18:25:25', '');
INSERT INTO `wms_inbound_apply` VALUES (2, 'RK-2026-002', 'PO-2026-002', '1', '中兴通讯', 'CG-2026-002', '0', '采购入库', '李四', '2026-06-03', '1', NULL, NULL, NULL, NULL, 'admin', '2026-06-05 18:25:25', '', '2026-06-05 18:25:25', '');
INSERT INTO `wms_inbound_apply` VALUES (3, 'RK-2026-003', 'SC-2026-001', '0', NULL, 'XS-2026-001', '1', '生产入库', '王五', '2026-06-04', '0', NULL, NULL, NULL, NULL, 'admin', '2026-06-05 18:25:25', '', '2026-06-05 18:25:25', '');
INSERT INTO `wms_inbound_apply` VALUES (4, 'RK-2026-004', 'TH-2026-001', '2', '小米科技', 'XS-2026-002', '1', '退货入库', '赵六', '2026-06-05', '2', 'admin', '2026-06-06', '1', '退货原因不充分，驳回', 'admin', '2026-06-05 18:25:25', '', '2026-06-05 18:25:25', '');
INSERT INTO `wms_inbound_apply` VALUES (5, 'RK-2026-005', 'PO-2026-003', '1', '联想集团', 'CG-2026-003', '0', '采购入库', '张三', '2026-06-07', '1', NULL, NULL, NULL, NULL, 'admin', '2026-06-05 18:25:25', '', '2026-06-05 18:25:25', '');

-- ----------------------------
-- Table structure for wms_inventory_count
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_count`;
CREATE TABLE `wms_inventory_count`  (
  `count_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `count_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单据号',
  `material_id` bigint NOT NULL COMMENT '物料ID',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库',
  `location_area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库区',
  `location_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位',
  `batch_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '批号',
  `count_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盘点类型（0月盘,1季盘）',
  `inventory_month` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存月份（YYYY-MM）',
  `count_date` date NULL DEFAULT NULL COMMENT '盘点日期',
  `responsible_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `current_stock` int NULL DEFAULT NULL COMMENT '现库存',
  `actual_stock` int NOT NULL COMMENT '实际库存',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原因',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`count_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '盘点信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_count
-- ----------------------------
INSERT INTO `wms_inventory_count` VALUES (1, 'PD-2026-001', 1, '电子元件A', '主仓库', 'A区', 'A-01-01', 'B20260601', '0', '2026-06', '2026-06-30', '张三', 500, 498, '正常损耗', 'admin', '2026-06-05 18:37:57', '', '2026-06-05 18:37:57', '');
INSERT INTO `wms_inventory_count` VALUES (2, 'PD-2026-002', 2, '机械零件B', '原材料仓', 'B区', 'B-02-03', 'B20260515', '0', '2026-06', '2026-06-30', '李四', 200, 200, '', 'admin', '2026-06-05 18:37:57', '', '2026-06-05 18:37:57', '');
INSERT INTO `wms_inventory_count` VALUES (3, 'PD-2026-003', 3, '芯片C', '主仓库', 'A区', 'A-03-02', 'B20260420', '1', '2026-06', '2026-06-30', '王五', 1000, 985, '运输损坏5片，丢失10片', 'admin', '2026-06-05 18:37:57', '', '2026-06-05 18:37:57', '');
INSERT INTO `wms_inventory_count` VALUES (4, 'PD-2026-004', 4, '传感器D', '成品仓', 'C区', 'C-01-01', 'B20260610', '0', '2026-06', '2026-06-30', '赵六', 300, 300, '', 'admin', '2026-06-05 18:37:57', '', '2026-06-05 18:37:57', '');
INSERT INTO `wms_inventory_count` VALUES (5, 'PD-2026-005', 5, '显示屏E', '成品仓', 'C区', 'C-02-01', 'B20260301', '1', '2026-06', '2026-06-30', '张三', 80, 78, '2块不良品报废', 'admin', '2026-06-05 18:37:57', '', '2026-06-05 18:37:57', '');

-- ----------------------------
-- Table structure for wms_material_category
-- ----------------------------
DROP TABLE IF EXISTS `wms_material_category`;
CREATE TABLE `wms_material_category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级分类ID',
  `category_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类编码',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物料分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_material_category
-- ----------------------------
INSERT INTO `wms_material_category` VALUES (1, 0, 'PARTS', '零件', '零件根分类', 'admin', '2026-06-05 18:19:00', '', '2026-06-05 18:19:00', '');
INSERT INTO `wms_material_category` VALUES (2, 0, 'PRODUCT', '成品', '成品根分类', 'admin', '2026-06-05 18:19:00', '', '2026-06-05 18:19:00', '');
INSERT INTO `wms_material_category` VALUES (3, 1, 'PARTS_ELEC', '电子零件', '电子类零件', 'admin', '2026-06-05 18:19:00', '', '2026-06-05 18:19:00', '');
INSERT INTO `wms_material_category` VALUES (4, 1, 'PARTS_MECH', '机械零件', '机械类零件', 'admin', '2026-06-05 18:19:00', '', '2026-06-05 18:19:00', '');
INSERT INTO `wms_material_category` VALUES (5, 2, 'PRODUCT_A', 'A类成品', 'A类成品', 'admin', '2026-06-05 18:19:00', '', '2026-06-05 18:19:00', '');
INSERT INTO `wms_material_category` VALUES (6, 2, 'PRODUCT_B', 'B类成品', 'B类成品', 'admin', '2026-06-05 18:19:00', '', '2026-06-05 18:19:00', '');

-- ----------------------------
-- Table structure for wms_outbound_apply
-- ----------------------------
DROP TABLE IF EXISTS `wms_outbound_apply`;
CREATE TABLE `wms_outbound_apply`  (
  `apply_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单据号',
  `business_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务类型：0领料出库,1销售出库',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核日期',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `doc_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单据状态：0未分拣,1已分拣,2已盘点,3已发货',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '出库申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_outbound_apply
-- ----------------------------
INSERT INTO `wms_outbound_apply` VALUES (1, 'CK-2026-001', '1', '腾讯科技', '张三', '2026-06-01', '2', 'admin', '2026-06-02', '0', '3', 'admin', '2026-06-05 18:29:34', '', '2026-06-05 18:29:34', '销售出库已发货');
INSERT INTO `wms_outbound_apply` VALUES (2, 'CK-2026-002', '0', NULL, '李四', '2026-06-03', '1', NULL, NULL, NULL, '0', 'admin', '2026-06-05 18:29:34', '', '2026-06-05 18:29:34', '领料出库待审核');
INSERT INTO `wms_outbound_apply` VALUES (3, 'CK-2026-003', '1', '阿里巴巴', '王五', '2026-06-04', '0', NULL, NULL, NULL, '0', 'admin', '2026-06-05 18:29:34', '', '2026-06-05 18:29:34', '销售出库未提交');
INSERT INTO `wms_outbound_apply` VALUES (4, 'CK-2026-004', '0', NULL, '赵六', '2026-06-05', '2', 'admin', '2026-06-06', '1', '1', 'admin', '2026-06-05 18:29:34', '', '2026-06-05 18:29:34', '领料出库已驳回');
INSERT INTO `wms_outbound_apply` VALUES (5, 'CK-2026-005', '1', '字节跳动', '张三', '2026-06-07', '1', NULL, NULL, NULL, '0', 'admin', '2026-06-05 18:29:34', '', '2026-06-05 18:29:34', '销售出库待审核');

-- ----------------------------
-- Table structure for wms_outbound_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_outbound_apply_detail`;
CREATE TABLE `wms_outbound_apply_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `apply_id` bigint NOT NULL,
  `seq_no` int NULL DEFAULT NULL,
  `material_id` bigint NULL DEFAULT NULL,
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `outbound_quantity` int NULL DEFAULT NULL COMMENT '出库数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `apply_id`(`apply_id` ASC) USING BTREE,
  CONSTRAINT `wms_outbound_apply_detail_ibfk_1` FOREIGN KEY (`apply_id`) REFERENCES `wms_outbound_apply` (`apply_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '出库申请明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_outbound_apply_detail
-- ----------------------------
INSERT INTO `wms_outbound_apply_detail` VALUES (1, 1, 1, 1, '电子元件A', 'MOD-A01', '10x20mm', '个', 100, '');
INSERT INTO `wms_outbound_apply_detail` VALUES (2, 1, 2, 2, '机械零件B', 'MOD-B02', '30x40mm', '件', 50, '');
INSERT INTO `wms_outbound_apply_detail` VALUES (3, 2, 1, 3, '芯片C', 'MOD-C03', '5x5mm', '片', 200, '');
INSERT INTO `wms_outbound_apply_detail` VALUES (4, 3, 1, 1, '电子元件A', 'MOD-A01', '10x20mm', '个', 300, '');
INSERT INTO `wms_outbound_apply_detail` VALUES (5, 3, 2, 4, '传感器D', 'MOD-D04', '8x8mm', '个', 80, '');
INSERT INTO `wms_outbound_apply_detail` VALUES (6, 4, 1, 2, '机械零件B', 'MOD-B02', '30x40mm', '件', 60, '');
INSERT INTO `wms_outbound_apply_detail` VALUES (7, 5, 1, 5, '显示屏E', 'MOD-E05', '100x60mm', '块', 30, '');

-- ----------------------------
-- Table structure for wms_replenish_apply
-- ----------------------------
DROP TABLE IF EXISTS `wms_replenish_apply`;
CREATE TABLE `wms_replenish_apply`  (
  `apply_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `apply_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单据号',
  `applicant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申请状态：0未提交,1待审核,2已审核',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` date NULL DEFAULT NULL COMMENT '审核日期',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态：0通过,1驳回',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态：0未采购,1采购中',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '补货申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_replenish_apply
-- ----------------------------
INSERT INTO `wms_replenish_apply` VALUES (1, 'BH-2026-001', '张三', '2026-06-01', '2', 'admin', '2026-06-02', '0', '1', 'admin', '2026-06-05 18:34:27', '', '2026-06-05 18:34:27', '已生成采购');
INSERT INTO `wms_replenish_apply` VALUES (2, 'BH-2026-002', '李四', '2026-06-03', '2', 'admin', '2026-06-04', '0', '0', 'admin', '2026-06-05 18:34:27', '', '2026-06-05 18:34:27', '审核通过待采购');
INSERT INTO `wms_replenish_apply` VALUES (3, 'BH-2026-003', '王五', '2026-06-05', '1', NULL, NULL, NULL, '0', 'admin', '2026-06-05 18:34:27', '', '2026-06-05 18:34:27', '待审核');
INSERT INTO `wms_replenish_apply` VALUES (4, 'BH-2026-004', '赵六', '2026-06-06', '2', 'admin', '2026-06-07', '1', '0', 'admin', '2026-06-05 18:34:27', '', '2026-06-05 18:34:27', '审核驳回');
INSERT INTO `wms_replenish_apply` VALUES (5, 'BH-2026-005', '张三', '2026-06-08', '0', NULL, NULL, NULL, '0', 'admin', '2026-06-05 18:34:27', '', '2026-06-05 18:34:27', '未提交');

-- ----------------------------
-- Table structure for wms_replenish_apply_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_replenish_apply_detail`;
CREATE TABLE `wms_replenish_apply_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT,
  `apply_id` bigint NOT NULL,
  `seq_no` int NULL DEFAULT NULL,
  `material_id` bigint NULL DEFAULT NULL,
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replenish_quantity` int NULL DEFAULT NULL COMMENT '补货数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `apply_id`(`apply_id` ASC) USING BTREE,
  CONSTRAINT `wms_replenish_apply_detail_ibfk_1` FOREIGN KEY (`apply_id`) REFERENCES `wms_replenish_apply` (`apply_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '补货申请明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_replenish_apply_detail
-- ----------------------------
INSERT INTO `wms_replenish_apply_detail` VALUES (1, 1, 1, 1, '电子元件A', 'MOD-A01', '10x20mm', '个', 500, '');
INSERT INTO `wms_replenish_apply_detail` VALUES (2, 1, 2, 2, '机械零件B', 'MOD-B02', '30x40mm', '件', 200, '');
INSERT INTO `wms_replenish_apply_detail` VALUES (3, 2, 1, 3, '芯片C', 'MOD-C03', '5x5mm', '片', 1000, '');
INSERT INTO `wms_replenish_apply_detail` VALUES (4, 2, 2, 4, '传感器D', 'MOD-D04', '8x8mm', '个', 300, '');
INSERT INTO `wms_replenish_apply_detail` VALUES (5, 3, 1, 1, '电子元件A', 'MOD-A01', '10x20mm', '个', 800, '');
INSERT INTO `wms_replenish_apply_detail` VALUES (6, 4, 1, 2, '机械零件B', 'MOD-B02', '30x40mm', '件', 150, '');
INSERT INTO `wms_replenish_apply_detail` VALUES (7, 5, 1, 5, '显示屏E', 'MOD-E05', '100x60mm', '块', 50, '');

-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `warehouse_id` bigint NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库名称',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仓库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (1, 'WH-001', '主仓库', 'admin', '2026-06-05 18:21:42', '', '2026-06-05 18:21:42', '主要存储仓库');
INSERT INTO `wms_warehouse` VALUES (2, 'WH-002', '原材料仓', 'admin', '2026-06-05 18:21:42', '', '2026-06-05 18:21:42', '原材料存放仓库');
INSERT INTO `wms_warehouse` VALUES (3, 'WH-003', '成品仓', 'admin', '2026-06-05 18:21:42', '', '2026-06-05 18:21:42', '成品存放仓库');

SET FOREIGN_KEY_CHECKS = 1;
