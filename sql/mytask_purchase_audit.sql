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

 Date: 04/06/2026 20:30:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
