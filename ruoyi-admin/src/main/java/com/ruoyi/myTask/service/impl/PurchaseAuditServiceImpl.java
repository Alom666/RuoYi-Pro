package com.ruoyi.myTask.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.myTask.mapper.PurchaseAuditMapper;
import com.ruoyi.myTask.domain.PurchaseAudit;
import com.ruoyi.myTask.service.IPurchaseAuditService;

/**
 * 采购申请审核Service业务层处理
 *
 * @author ruoyi
 */
@Service
@Transactional
public class PurchaseAuditServiceImpl implements IPurchaseAuditService
{
    @Autowired
    private PurchaseAuditMapper purchaseAuditMapper;

    /**
     * 查询采购申请审核
     *
     * @param auditId 编号
     * @return 采购申请审核
     */
    @Override
    public PurchaseAudit selectPurchaseAuditById(Long auditId)
    {
        return purchaseAuditMapper.selectPurchaseAuditById(auditId);
    }

    /**
     * 查询采购申请审核列表
     *
     * @param purchaseAudit 采购申请审核
     * @return 采购申请审核
     */
    @Override
    public List<PurchaseAudit> selectPurchaseAuditList(PurchaseAudit purchaseAudit)
    {
        return purchaseAuditMapper.selectPurchaseAuditList(purchaseAudit);
    }

    /**
     * 新增采购申请审核
     *
     * @param purchaseAudit 采购申请审核
     * @return 结果
     */
    @Override
    public int insertPurchaseAudit(PurchaseAudit purchaseAudit)
    {
        return purchaseAuditMapper.insertPurchaseAudit(purchaseAudit);
    }

    /**
     * 修改采购申请审核
     *
     * @param purchaseAudit 采购申请审核
     * @return 结果
     */
    @Override
    public int updatePurchaseAudit(PurchaseAudit purchaseAudit)
    {
        return purchaseAuditMapper.updatePurchaseAudit(purchaseAudit);
    }

    /**
     * 删除采购申请审核对象
     *
     * @param auditId 编号
     * @return 结果
     */
    @Override
    public int deletePurchaseAuditById(Long auditId)
    {
        return purchaseAuditMapper.deletePurchaseAuditById(auditId);
    }

    /**
     * 批量删除采购申请审核信息
     *
     * @param auditIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePurchaseAuditByIds(Long[] auditIds)
    {
        return purchaseAuditMapper.deletePurchaseAuditByIds(auditIds);
    }
}
