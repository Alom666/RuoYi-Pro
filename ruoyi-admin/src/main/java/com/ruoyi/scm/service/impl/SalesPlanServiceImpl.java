
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.SalesPlanMapper;
import com.ruoyi.scm.domain.SalesPlan;
import com.ruoyi.scm.domain.SalesPlanDetail;
import com.ruoyi.scm.service.ISalesPlanService;

/**
 * 销售计划Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class SalesPlanServiceImpl implements ISalesPlanService
{
    @Autowired
    private SalesPlanMapper salesPlanMapper;

    /**
     * 查询销售计划
     *
     * @param planId 销售计划ID
     * @return 销售计划
     */
    @Override
    public SalesPlan selectSalesPlanById(Long planId)
    {
        return salesPlanMapper.selectSalesPlanById(planId);
    }

    /**
     * 查询销售计划列表
     *
     * @param salesPlan 销售计划
     * @return 销售计划
     */
    @Override
    public List<SalesPlan> selectSalesPlanList(SalesPlan salesPlan)
    {
        return salesPlanMapper.selectSalesPlanList(salesPlan);
    }

    /**
     * 新增销售计划
     *
     * @param salesPlan 销售计划
     * @return 结果
     */
    @Transactional
    @Override
    public int insertSalesPlan(SalesPlan salesPlan)
    {
        int rows = salesPlanMapper.insertSalesPlan(salesPlan);
        insertDetails(salesPlan);
        return rows;
    }

    /**
     * 修改销售计划
     *
     * @param salesPlan 销售计划
     * @return 结果
     */
    @Transactional
    @Override
    public int updateSalesPlan(SalesPlan salesPlan)
    {
        // 先删除旧明细
        salesPlanMapper.deleteDetailByPlanId(salesPlan.getPlanId());
        // 再插入新明细
        insertDetails(salesPlan);
        return salesPlanMapper.updateSalesPlan(salesPlan);
    }

    /**
     * 批量删除销售计划信息
     *
     * @param planIds 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSalesPlanByIds(Long[] planIds)
    {
        for (Long planId : planIds)
        {
            salesPlanMapper.deleteDetailByPlanId(planId);
        }
        return salesPlanMapper.deleteSalesPlanByIds(planIds);
    }

    /**
     * 批量插入销售计划指标配置
     *
     * @param salesPlan 销售计划
     */
    private void insertDetails(SalesPlan salesPlan)
    {
        List<SalesPlanDetail> detailList = salesPlan.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (SalesPlanDetail detail : detailList)
            {
                detail.setPlanId(salesPlan.getPlanId());
            }
            salesPlanMapper.batchInsertDetail(detailList);
        }
    }
}
