
package com.ruoyi.wms.mapper;

import java.util.List;
import com.ruoyi.wms.domain.InboundApply;

/**
 * WMS入库申请Mapper接口
 *
 * @author ruoyi
 */
public interface InboundApplyMapper
{
    /**
     * 查询入库申请
     *
     * @param applyId 入库申请ID
     * @return 入库申请
     */
    public InboundApply selectInboundApplyById(Long applyId);

    /**
     * 查询入库申请列表
     *
     * @param inboundApply 入库申请
     * @return 入库申请集合
     */
    public List<InboundApply> selectInboundApplyList(InboundApply inboundApply);

    /**
     * 新增入库申请
     *
     * @param inboundApply 入库申请
     * @return 结果
     */
    public int insertInboundApply(InboundApply inboundApply);

    /**
     * 修改入库申请
     *
     * @param inboundApply 入库申请
     * @return 结果
     */
    public int updateInboundApply(InboundApply inboundApply);

    /**
     * 删除入库申请
     *
     * @param applyId 入库申请ID
     * @return 结果
     */
    public int deleteInboundApplyById(Long applyId);

    /**
     * 批量删除入库申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteInboundApplyByIds(Long[] applyIds);
}
