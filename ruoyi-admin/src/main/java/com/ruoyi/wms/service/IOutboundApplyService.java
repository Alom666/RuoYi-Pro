
package com.ruoyi.wms.service;

import java.util.List;
import com.ruoyi.wms.domain.OutboundApply;

/**
 * 出库申请Service接口
 *
 * @author ruoyi
 */
public interface IOutboundApplyService
{
    /**
     * 查询出库申请
     *
     * @param applyId 出库申请ID
     * @return 出库申请
     */
    public OutboundApply selectOutboundApplyById(Long applyId);

    /**
     * 查询出库申请列表
     *
     * @param outboundApply 出库申请
     * @return 出库申请集合
     */
    public List<OutboundApply> selectOutboundApplyList(OutboundApply outboundApply);

    /**
     * 新增出库申请
     *
     * @param outboundApply 出库申请
     * @return 结果
     */
    public int insertOutboundApply(OutboundApply outboundApply);

    /**
     * 修改出库申请
     *
     * @param outboundApply 出库申请
     * @return 结果
     */
    public int updateOutboundApply(OutboundApply outboundApply);

    /**
     * 删除出库申请
     *
     * @param applyId 出库申请ID
     * @return 结果
     */
    public int deleteOutboundApplyById(Long applyId);

    /**
     * 批量删除出库申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteOutboundApplyByIds(Long[] applyIds);

    /**
     * 提交出库申请（修改申请状态为待审核）
     *
     * @param applyId 出库申请ID
     * @return 结果
     */
    public int submitOutboundApply(Long applyId);
}
