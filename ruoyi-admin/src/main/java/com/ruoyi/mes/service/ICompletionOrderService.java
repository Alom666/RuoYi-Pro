
package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.CompletionOrder;

/**
 * 生产完工单Service接口
 *
 * @author ruoyi
 */
public interface ICompletionOrderService
{
    /**
     * 查询生产完工单
     *
     * @param completionId 生产完工单ID
     * @return 生产完工单
     */
    public CompletionOrder selectCompletionOrderById(Long completionId);

    /**
     * 查询生产完工单列表
     *
     * @param completionOrder 生产完工单
     * @return 生产完工单集合
     */
    public List<CompletionOrder> selectCompletionOrderList(CompletionOrder completionOrder);

    /**
     * 修改生产完工单
     *
     * @param completionOrder 生产完工单
     * @return 结果
     */
    public int updateCompletionOrder(CompletionOrder completionOrder);

    /**
     * 批量删除生产完工单
     *
     * @param completionIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCompletionOrderByIds(Long[] completionIds);
}
