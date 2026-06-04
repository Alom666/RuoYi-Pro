package com.ruoyi.myTask.service;

import java.util.List;
import com.ruoyi.myTask.domain.PurchaseAudit;

/**
 * 采购申请审核Service接口
 *
 * @author ruoyi
 */
public interface IPurchaseAuditService
{
    /**
     * 查询采购申请审核
     *
     * @param auditId 编号
     * @return 采购申请审核
     */
    public PurchaseAudit selectPurchaseAuditById(Long auditId);

    /**
     * 查询采购申请审核列表
     *
     * @param purchaseAudit 采购申请审核
     * @return 采购申请审核集合
     */
    public List<PurchaseAudit> selectPurchaseAuditList(PurchaseAudit purchaseAudit);

    /**
     * 新增采购申请审核
     *
     * @param purchaseAudit 采购申请审核
     * @return 结果
     */
    public int insertPurchaseAudit(PurchaseAudit purchaseAudit);

    /**
     * 修改采购申请审核
     *
     * @param purchaseAudit 采购申请审核
     * @return 结果
     */
    public int updatePurchaseAudit(PurchaseAudit purchaseAudit);

    /**
     * 删除采购申请审核
     *
     * @param auditId 编号
     * @return 结果
     */
    public int deletePurchaseAuditById(Long auditId);

    /**
     * 批量删除采购申请审核
     *
     * @param auditIds 需要删除的数据ID
     * @return 结果
     */
    public int deletePurchaseAuditByIds(Long[] auditIds);
}
