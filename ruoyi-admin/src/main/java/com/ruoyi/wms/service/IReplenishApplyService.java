
package com.ruoyi.wms.service;

import java.util.List;
import com.ruoyi.wms.domain.ReplenishApply;

/**
 * 补货申请Service接口
 *
 * @author ruoyi
 */
public interface IReplenishApplyService
{
    /**
     * 查询补货申请
     *
     * @param applyId 补货申请ID
     * @return 补货申请
     */
    public ReplenishApply selectReplenishApplyById(Long applyId);

    /**
     * 查询补货申请列表
     *
     * @param replenishApply 补货申请
     * @return 补货申请集合
     */
    public List<ReplenishApply> selectReplenishApplyList(ReplenishApply replenishApply);

    /**
     * 新增补货申请
     *
     * @param replenishApply 补货申请
     * @return 结果
     */
    public int insertReplenishApply(ReplenishApply replenishApply);

    /**
     * 修改补货申请
     *
     * @param replenishApply 补货申请
     * @return 结果
     */
    public int updateReplenishApply(ReplenishApply replenishApply);

    /**
     * 删除补货申请
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    public int deleteReplenishApplyById(Long applyId);

    /**
     * 批量删除补货申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteReplenishApplyByIds(Long[] applyIds);

    /**
     * 提交补货申请（修改申请状态为待审核）
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    public int submitReplenishApply(Long applyId);

    /**
     * 生成采购申请
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    public int generatePurchaseApply(Long applyId);
}
