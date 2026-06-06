
package com.ruoyi.wms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.wms.mapper.OutboundApplyMapper;
import com.ruoyi.wms.domain.OutboundApply;
import com.ruoyi.wms.domain.OutboundApplyDetail;
import com.ruoyi.wms.service.IOutboundApplyService;

/**
 * 出库申请Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class OutboundApplyServiceImpl implements IOutboundApplyService
{
    @Autowired
    private OutboundApplyMapper outboundApplyMapper;

    /**
     * 查询出库申请
     *
     * @param applyId 出库申请ID
     * @return 出库申请
     */
    @Override
    public OutboundApply selectOutboundApplyById(Long applyId)
    {
        OutboundApply outboundApply = outboundApplyMapper.selectOutboundApplyById(applyId);
        if (outboundApply != null)
        {
            outboundApply.setDetailList(outboundApplyMapper.selectDetailByApplyId(applyId));
        }
        return outboundApply;
    }

    /**
     * 查询出库申请列表
     *
     * @param outboundApply 出库申请
     * @return 出库申请
     */
    @Override
    public List<OutboundApply> selectOutboundApplyList(OutboundApply outboundApply)
    {
        return outboundApplyMapper.selectOutboundApplyList(outboundApply);
    }

    /**
     * 新增出库申请
     *
     * @param outboundApply 出库申请
     * @return 结果
     */
    @Transactional
    @Override
    public int insertOutboundApply(OutboundApply outboundApply)
    {
        int rows = outboundApplyMapper.insertOutboundApply(outboundApply);
        insertDetails(outboundApply);
        return rows;
    }

    /**
     * 修改出库申请
     *
     * @param outboundApply 出库申请
     * @return 结果
     */
    @Transactional
    @Override
    public int updateOutboundApply(OutboundApply outboundApply)
    {
        // 先删除旧明细
        outboundApplyMapper.deleteDetailByApplyId(outboundApply.getApplyId());
        // 再插入新明细
        insertDetails(outboundApply);
        return outboundApplyMapper.updateOutboundApply(outboundApply);
    }

    /**
     * 删除出库申请
     *
     * @param applyId 出库申请ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteOutboundApplyById(Long applyId)
    {
        outboundApplyMapper.deleteDetailByApplyId(applyId);
        return outboundApplyMapper.deleteOutboundApplyById(applyId);
    }

    /**
     * 批量删除出库申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteOutboundApplyByIds(Long[] applyIds)
    {
        for (Long applyId : applyIds)
        {
            outboundApplyMapper.deleteDetailByApplyId(applyId);
        }
        return outboundApplyMapper.deleteOutboundApplyByIds(applyIds);
    }

    /**
     * 提交出库申请（修改申请状态为待审核）
     *
     * @param applyId 出库申请ID
     * @return 结果
     */
    @Override
    public int submitOutboundApply(Long applyId)
    {
        OutboundApply outboundApply = new OutboundApply();
        outboundApply.setApplyId(applyId);
        outboundApply.setApplyStatus("1");
        return outboundApplyMapper.updateOutboundApply(outboundApply);
    }

    /**
     * 批量插入出库申请明细
     *
     * @param outboundApply 出库申请
     */
    private void insertDetails(OutboundApply outboundApply)
    {
        List<OutboundApplyDetail> detailList = outboundApply.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (OutboundApplyDetail detail : detailList)
            {
                detail.setApplyId(outboundApply.getApplyId());
            }
            outboundApplyMapper.batchInsertDetail(detailList);
        }
    }
}
