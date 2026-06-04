
package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.CompletionOrderMapper;
import com.ruoyi.mes.domain.CompletionOrder;
import com.ruoyi.mes.service.ICompletionOrderService;

/**
 * 生产完工单Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class CompletionOrderServiceImpl implements ICompletionOrderService
{
    @Autowired
    private CompletionOrderMapper completionOrderMapper;

    /**
     * 查询生产完工单
     *
     * @param completionId 生产完工单ID
     * @return 生产完工单
     */
    @Override
    public CompletionOrder selectCompletionOrderById(Long completionId)
    {
        return completionOrderMapper.selectCompletionOrderById(completionId);
    }

    /**
     * 查询生产完工单列表
     *
     * @param completionOrder 生产完工单
     * @return 生产完工单
     */
    @Override
    public List<CompletionOrder> selectCompletionOrderList(CompletionOrder completionOrder)
    {
        return completionOrderMapper.selectCompletionOrderList(completionOrder);
    }

    /**
     * 新增生产完工单
     *
     * @param completionOrder 生产完工单
     * @return 结果
     */
    @Override
    public int insertCompletionOrder(CompletionOrder completionOrder)
    {
        return completionOrderMapper.insertCompletionOrder(completionOrder);
    }

    /**
     * 修改生产完工单
     *
     * @param completionOrder 生产完工单
     * @return 结果
     */
    @Override
    public int updateCompletionOrder(CompletionOrder completionOrder)
    {
        return completionOrderMapper.updateCompletionOrder(completionOrder);
    }

    /**
     * 批量删除生产完工单信息
     *
     * @param completionIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCompletionOrderByIds(Long[] completionIds)
    {
        return completionOrderMapper.deleteCompletionOrderByIds(completionIds);
    }
}
