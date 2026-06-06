
package com.ruoyi.wms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.mapper.InboundApplyMapper;
import com.ruoyi.wms.domain.InboundApply;
import com.ruoyi.wms.service.IInboundApplyService;

/**
 * WMS入库申请Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class InboundApplyServiceImpl implements IInboundApplyService
{
    @Autowired
    private InboundApplyMapper inboundApplyMapper;

    /**
     * 查询入库申请
     *
     * @param applyId 入库申请ID
     * @return 入库申请
     */
    @Override
    public InboundApply selectInboundApplyById(Long applyId)
    {
        return inboundApplyMapper.selectInboundApplyById(applyId);
    }

    /**
     * 查询入库申请列表
     *
     * @param inboundApply 入库申请
     * @return 入库申请
     */
    @Override
    public List<InboundApply> selectInboundApplyList(InboundApply inboundApply)
    {
        return inboundApplyMapper.selectInboundApplyList(inboundApply);
    }

    /**
     * 新增入库申请
     *
     * @param inboundApply 入库申请
     * @return 结果
     */
    @Override
    public int insertInboundApply(InboundApply inboundApply)
    {
        return inboundApplyMapper.insertInboundApply(inboundApply);
    }

    /**
     * 修改入库申请
     *
     * @param inboundApply 入库申请
     * @return 结果
     */
    @Override
    public int updateInboundApply(InboundApply inboundApply)
    {
        return inboundApplyMapper.updateInboundApply(inboundApply);
    }

    /**
     * 删除入库申请
     *
     * @param applyId 入库申请ID
     * @return 结果
     */
    @Override
    public int deleteInboundApplyById(Long applyId)
    {
        return inboundApplyMapper.deleteInboundApplyById(applyId);
    }

    /**
     * 批量删除入库申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteInboundApplyByIds(Long[] applyIds)
    {
        return inboundApplyMapper.deleteInboundApplyByIds(applyIds);
    }
}
