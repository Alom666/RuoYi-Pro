-- ----------------------------
-- 建表SQL - 我的任务-入库申请审核
-- ----------------------------
CREATE TABLE `myTask_inbound_audit` (
  `audit_id` INT AUTO_INCREMENT COMMENT '审核ID（编号）',
  `apply_no` VARCHAR(50) NOT NULL COMMENT '申请单号',
  `related_no` VARCHAR(50) COMMENT '关联单据号',
  `business_type` char(1) COMMENT '业务类型：0生产入库、1采购入库、2退货入库',
  `supplier_name` VARCHAR(100) COMMENT '供应商',
  `contract_no` VARCHAR(50) COMMENT '合同号',
  `contract_type` char(1) COMMENT '合同类型：0采购合同、1销售合同',
  `apply_type` VARCHAR(50) COMMENT '申请类型',
  `applicant` VARCHAR(50) COMMENT '申请人',
  `apply_date` DATETIME COMMENT '申请日期',
  `apply_status` char(1) COMMENT '申请状态：0未提交、1待审核、2已审核',
  `auditor` VARCHAR(50) COMMENT '审核人',
  `audit_date` DATETIME COMMENT '审核日期',
  `audit_status` char(1) COMMENT '审核状态：0通过、1驳回',
  `audit_opinion` TEXT COMMENT '审核意见',
  `create_by` VARCHAR(64) default '' COMMENT '创建者',
  `create_time` DATETIME COMMENT '创建时间',
  `update_by` VARCHAR(64) default '' COMMENT '更新者',
  `update_time` DATETIME COMMENT '更新时间',
  `remark` VARCHAR(255) default null COMMENT '备注',
  PRIMARY KEY(`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='我的任务-入库申请审核';

-- ----------------------------
-- 测试数据
-- ----------------------------
INSERT INTO `myTask_inbound_audit` VALUES (1, 'RK20260601001', 'PO20260601001', '1', '华为技术有限公司', 'HT20260101', '0', '采购入库', 'admin', '2026-06-01 10:00:00', '1', 'ry', NULL, NULL, NULL, 'admin', sysdate(), '', NULL, NULL);
INSERT INTO `myTask_inbound_audit` VALUES (2, 'RK20260602001', 'TH20260602001', '2', '中兴通讯股份有限公司', 'HT20260202', '1', '退货入库', 'ry', '2026-06-02 14:30:00', '2', 'admin', '2026-06-03 09:00:00', '0', '审核通过，同意入库', 'ry', sysdate(), 'admin', sysdate(), NULL);
