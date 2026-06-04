package com.ruoyi.myTask.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.myTask.mapper.InboundAuditMapper;
import com.ruoyi.myTask.domain.InboundAudit;
import com.ruoyi.myTask.service.IInboundAuditService;

/**
 * 入库申请审核Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class InboundAuditServiceImpl implements IInboundAuditService
{
    @Autowired
    private InboundAuditMapper inboundAuditMapper;

    /**
     * 查询入库申请审核
     *
     * @param auditId 审核ID
     * @return 入库申请审核
     */
    @Override
    public InboundAudit selectInboundAuditById(Integer auditId)
    {
        return inboundAuditMapper.selectInboundAuditById(auditId);
    }

    /**
     * 查询入库申请审核列表
     *
     * @param inboundAudit 入库申请审核
     * @return 入库申请审核
     */
    @Override
    public List<InboundAudit> selectInboundAuditList(InboundAudit inboundAudit)
    {
        return inboundAuditMapper.selectInboundAuditList(inboundAudit);
    }

    /**
     * 新增入库申请审核
     *
     * @param inboundAudit 入库申请审核
     * @return 结果
     */
    @Override
    public int insertInboundAudit(InboundAudit inboundAudit)
    {
        return inboundAuditMapper.insertInboundAudit(inboundAudit);
    }

    /**
     * 修改入库申请审核
     *
     * @param inboundAudit 入库申请审核
     * @return 结果
     */
    @Override
    public int updateInboundAudit(InboundAudit inboundAudit)
    {
        return inboundAuditMapper.updateInboundAudit(inboundAudit);
    }

    /**
     * 删除入库申请审核对象
     *
     * @param auditId 审核ID
     * @return 结果
     */
    @Override
    public int deleteInboundAuditById(Integer auditId)
    {
        return inboundAuditMapper.deleteInboundAuditById(auditId);
    }

    /**
     * 批量删除入库申请审核信息
     *
     * @param auditIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteInboundAuditByIds(Integer[] auditIds)
    {
        return inboundAuditMapper.deleteInboundAuditByIds(auditIds);
    }
}
