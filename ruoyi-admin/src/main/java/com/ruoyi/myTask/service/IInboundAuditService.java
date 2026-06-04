package com.ruoyi.myTask.service;

import java.util.List;
import com.ruoyi.myTask.domain.InboundAudit;

/**
 * 入库申请审核Service接口
 *
 * @author ruoyi
 */
public interface IInboundAuditService
{
    /**
     * 查询入库申请审核
     *
     * @param auditId 审核ID
     * @return 入库申请审核
     */
    public InboundAudit selectInboundAuditById(Integer auditId);

    /**
     * 查询入库申请审核列表
     *
     * @param inboundAudit 入库申请审核
     * @return 入库申请审核集合
     */
    public List<InboundAudit> selectInboundAuditList(InboundAudit inboundAudit);

    /**
     * 新增入库申请审核
     *
     * @param inboundAudit 入库申请审核
     * @return 结果
     */
    public int insertInboundAudit(InboundAudit inboundAudit);

    /**
     * 修改入库申请审核
     *
     * @param inboundAudit 入库申请审核
     * @return 结果
     */
    public int updateInboundAudit(InboundAudit inboundAudit);

    /**
     * 删除入库申请审核
     *
     * @param auditId 审核ID
     * @return 结果
     */
    public int deleteInboundAuditById(Integer auditId);

    /**
     * 批量删除入库申请审核
     *
     * @param auditIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteInboundAuditByIds(Integer[] auditIds);
}
