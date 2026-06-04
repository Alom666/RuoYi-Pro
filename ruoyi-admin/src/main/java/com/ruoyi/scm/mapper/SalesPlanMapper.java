
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.SalesPlan;
import com.ruoyi.scm.domain.SalesPlanDetail;

/**
 * 销售计划Mapper接口
 *
 * @author ruoyi
 */
public interface SalesPlanMapper
{
    /**
     * 查询销售计划
     *
     * @param planId 销售计划ID
     * @return 销售计划
     */
    public SalesPlan selectSalesPlanById(Long planId);

    /**
     * 查询销售计划列表
     *
     * @param salesPlan 销售计划
     * @return 销售计划集合
     */
    public List<SalesPlan> selectSalesPlanList(SalesPlan salesPlan);

    /**
     * 新增销售计划
     *
     * @param salesPlan 销售计划
     * @return 结果
     */
    public int insertSalesPlan(SalesPlan salesPlan);

    /**
     * 修改销售计划
     *
     * @param salesPlan 销售计划
     * @return 结果
     */
    public int updateSalesPlan(SalesPlan salesPlan);

    /**
     * 删除销售计划
     *
     * @param planId 销售计划ID
     * @return 结果
     */
    public int deleteSalesPlanById(Long planId);

    /**
     * 批量删除销售计划
     *
     * @param planIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSalesPlanByIds(Long[] planIds);

    /**
     * 批量删除销售计划指标配置
     *
     * @param planId 销售计划ID
     * @return 结果
     */
    public int deleteDetailByPlanId(Long planId);

    /**
     * 批量新增销售计划指标配置
     *
     * @param detailList 销售计划指标配置列表
     * @return 结果
     */
    public int batchInsertDetail(List<SalesPlanDetail> detailList);
}
