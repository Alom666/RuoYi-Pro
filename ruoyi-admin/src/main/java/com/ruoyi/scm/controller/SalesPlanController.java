
package com.ruoyi.scm.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.scm.domain.SalesPlan;
import com.ruoyi.scm.service.ISalesPlanService;

/**
 * 销售计划Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/salesPlan")
public class SalesPlanController extends BaseController
{
    @Autowired
    private ISalesPlanService salesPlanService;

    /**
     * 查询销售计划列表
     */
    @PreAuthorize("@ss.hasPermi('scm:salesPlan:list')")
    @GetMapping("/list")
    public TableDataInfo list(SalesPlan salesPlan)
    {
        startPage();
        List<SalesPlan> list = salesPlanService.selectSalesPlanList(salesPlan);
        return getDataTable(list);
    }

    /**
     * 导出销售计划列表
     */
    @PreAuthorize("@ss.hasPermi('scm:salesPlan:export')")
    @Log(title = "销售计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SalesPlan salesPlan)
    {
        List<SalesPlan> list = salesPlanService.selectSalesPlanList(salesPlan);
        ExcelUtil<SalesPlan> util = new ExcelUtil<SalesPlan>(SalesPlan.class);
        util.exportExcel(response, list, "销售计划数据");
    }

    /**
     * 获取销售计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('scm:salesPlan:query')")
    @GetMapping(value = "/{planId}")
    public AjaxResult getInfo(@PathVariable("planId") Long planId)
    {
        return success(salesPlanService.selectSalesPlanById(planId));
    }

    /**
     * 新增销售计划
     */
    @PreAuthorize("@ss.hasPermi('scm:salesPlan:add')")
    @Log(title = "销售计划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SalesPlan salesPlan)
    {
        salesPlan.setCreateBy(getUsername());
        return toAjax(salesPlanService.insertSalesPlan(salesPlan));
    }

    /**
     * 修改销售计划
     */
    @PreAuthorize("@ss.hasPermi('scm:salesPlan:edit')")
    @Log(title = "销售计划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SalesPlan salesPlan)
    {
        salesPlan.setUpdateBy(getUsername());
        return toAjax(salesPlanService.updateSalesPlan(salesPlan));
    }

    /**
     * 删除销售计划
     */
    @PreAuthorize("@ss.hasPermi('scm:salesPlan:remove')")
    @Log(title = "销售计划", businessType = BusinessType.DELETE)
    @DeleteMapping("/{planIds}")
    public AjaxResult remove(@PathVariable Long[] planIds)
    {
        return toAjax(salesPlanService.deleteSalesPlanByIds(planIds));
    }
}
