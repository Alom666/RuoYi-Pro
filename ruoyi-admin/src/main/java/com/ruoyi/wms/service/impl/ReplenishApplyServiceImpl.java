
package com.ruoyi.wms.service.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.wms.mapper.ReplenishApplyMapper;
import com.ruoyi.wms.domain.ReplenishApply;
import com.ruoyi.wms.domain.ReplenishApplyDetail;
import com.ruoyi.wms.service.IReplenishApplyService;

/**
 * 补货申请Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class ReplenishApplyServiceImpl implements IReplenishApplyService
{
    private static final Logger log = LoggerFactory.getLogger(ReplenishApplyServiceImpl.class);
    @Autowired
    private ReplenishApplyMapper replenishApplyMapper;

    /**
     * 查询补货申请
     *
     * @param applyId 补货申请ID
     * @return 补货申请
     */
    @Override
    public ReplenishApply selectReplenishApplyById(Long applyId)
    {
        ReplenishApply replenishApply = replenishApplyMapper.selectReplenishApplyById(applyId);
        if (replenishApply != null)
        {
            replenishApply.setDetailList(replenishApplyMapper.selectDetailByApplyId(applyId));
        }
        return replenishApply;
    }

    /**
     * 查询补货申请列表
     *
     * @param replenishApply 补货申请
     * @return 补货申请
     */
    @Override
    public List<ReplenishApply> selectReplenishApplyList(ReplenishApply replenishApply)
    {
        return replenishApplyMapper.selectReplenishApplyList(replenishApply);
    }

    /**
     * 新增补货申请
     *
     * @param replenishApply 补货申请
     * @return 结果
     */
    @Transactional
    @Override
    public int insertReplenishApply(ReplenishApply replenishApply)
    {
        int rows = replenishApplyMapper.insertReplenishApply(replenishApply);
        insertDetails(replenishApply);
        return rows;
    }

    /**
     * 修改补货申请
     *
     * @param replenishApply 补货申请
     * @return 结果
     */
    @Transactional
    @Override
    public int updateReplenishApply(ReplenishApply replenishApply)
    {
        // 先删除旧明细
        replenishApplyMapper.deleteDetailByApplyId(replenishApply.getApplyId());
        // 再插入新明细
        insertDetails(replenishApply);
        return replenishApplyMapper.updateReplenishApply(replenishApply);
    }

    /**
     * 删除补货申请
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteReplenishApplyById(Long applyId)
    {
        replenishApplyMapper.deleteDetailByApplyId(applyId);
        return replenishApplyMapper.deleteReplenishApplyById(applyId);
    }

    /**
     * 批量删除补货申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteReplenishApplyByIds(Long[] applyIds)
    {
        for (Long applyId : applyIds)
        {
            replenishApplyMapper.deleteDetailByApplyId(applyId);
        }
        return replenishApplyMapper.deleteReplenishApplyByIds(applyIds);
    }

    /**
     * 提交补货申请（修改申请状态为待审核）
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    @Override
    public int submitReplenishApply(Long applyId)
    {
        ReplenishApply replenishApply = new ReplenishApply();
        replenishApply.setApplyId(applyId);
        replenishApply.setApplyStatus("1");
        return replenishApplyMapper.updateReplenishApply(replenishApply);
    }

    /**
     * 生成采购申请
     *
     * @param applyId 补货申请ID
     * @return 结果
     */
    @Transactional
    @Override
    public int generatePurchaseApply(Long applyId)
    {
        ReplenishApply replenishApply = replenishApplyMapper.selectReplenishApplyById(applyId);
        if (replenishApply == null)
        {
            throw new ServiceException("补货申请不存在");
        }
        if (!"2".equals(replenishApply.getApplyStatus()))
        {
            throw new ServiceException("只有已审核的补货申请才能生成采购申请");
        }
        if (!"0".equals(replenishApply.getAuditStatus()))
        {
            throw new ServiceException("只有审核通过的补货申请才能生成采购申请");
        }
        if ("1".equals(replenishApply.getStatus()))
        {
            throw new ServiceException("该补货申请已在采购中，请勿重复生成");
        }
        // 更新采购状态为采购中
        ReplenishApply update = new ReplenishApply();
        update.setApplyId(applyId);
        update.setStatus("1");
        log.warn("补货申请[{}]未关联采购申请Service，采购申请记录未生成", applyId);
        // TODO: 此处可调用采购申请Service生成采购申请记录
        // purchaseApplyService.generateFromReplenish(applyId);
        return replenishApplyMapper.updateReplenishApply(update);
    }

    /**
     * 批量插入补货申请明细
     *
     * @param replenishApply 补货申请
     */
    private void insertDetails(ReplenishApply replenishApply)
    {
        List<ReplenishApplyDetail> detailList = replenishApply.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (ReplenishApplyDetail detail : detailList)
            {
                detail.setApplyId(replenishApply.getApplyId());
            }
            replenishApplyMapper.batchInsertDetail(detailList);
        }
    }
}
