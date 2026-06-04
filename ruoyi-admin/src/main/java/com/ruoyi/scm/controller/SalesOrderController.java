
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
import com.ruoyi.scm.domain.SalesOrder;
import com.ruoyi.scm.service.ISalesOrderService;

/**
 * 销售订单Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/salesOrder")
public class SalesOrderController extends BaseController
{
    @Autowired
    private ISalesOrderService salesOrderService;

    @PreAuthorize("@ss.hasPermi('scm:salesOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(SalesOrder salesOrder)
    {
        startPage();
        List<SalesOrder> list = salesOrderService.selectSalesOrderList(salesOrder);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('scm:salesOrder:export')")
    @Log(title = "销售订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SalesOrder salesOrder)
    {
        List<SalesOrder> list = salesOrderService.selectSalesOrderList(salesOrder);
        ExcelUtil<SalesOrder> util = new ExcelUtil<SalesOrder>(SalesOrder.class);
        util.exportExcel(response, list, "销售订单数据");
    }

    @PreAuthorize("@ss.hasPermi('scm:salesOrder:query')")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return success(salesOrderService.selectSalesOrderById(orderId));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesOrder:add')")
    @Log(title = "销售订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SalesOrder salesOrder)
    {
        salesOrder.setCreateBy(getUsername());
        return toAjax(salesOrderService.insertSalesOrder(salesOrder));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesOrder:edit')")
    @Log(title = "销售订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SalesOrder salesOrder)
    {
        salesOrder.setUpdateBy(getUsername());
        return toAjax(salesOrderService.updateSalesOrder(salesOrder));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesOrder:remove')")
    @Log(title = "销售订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds)
    {
        return toAjax(salesOrderService.deleteSalesOrderByIds(orderIds));
    }
}
