
package com.ruoyi.wms.mapper;

import java.util.List;
import com.ruoyi.wms.domain.ReplenishApply;
import com.ruoyi.wms.domain.ReplenishApplyDetail;

/**
 * 补货申请Mapper接口
 *
 * @author ruoyi
 */
public interface ReplenishApplyMapper
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
     * 查询补货申请明细列表
     *
     * @param applyId 补货申请ID
     * @return 补货申请明细集合
     */
    public List<ReplenishApplyDetail> selectDetailByApplyId(Long applyId);

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
     * 批量删除补货申请明细
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    public int deleteDetailByApplyId(Long applyId);

    /**
     * 批量新增补货申请明细
     *
     * @param detailList 补货申请明细列表
     * @return 结果
     */
    public int batchInsertDetail(List<ReplenishApplyDetail> detailList);
}
