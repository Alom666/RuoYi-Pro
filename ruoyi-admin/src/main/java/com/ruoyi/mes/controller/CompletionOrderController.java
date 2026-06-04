
package com.ruoyi.mes.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.mes.domain.CompletionOrder;
import com.ruoyi.mes.service.ICompletionOrderService;

/**
 * 生产完工单Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/mes/completionOrder")
public class CompletionOrderController extends BaseController
{
    @Autowired
    private ICompletionOrderService completionOrderService;

    /**
     * 查询生产完工单列表
     */
    @PreAuthorize("@ss.hasPermi('mes:completionOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(CompletionOrder completionOrder)
    {
        startPage();
        List<CompletionOrder> list = completionOrderService.selectCompletionOrderList(completionOrder);
        return getDataTable(list);
    }

    /**
     * 获取生产完工单详细信息
     */
    @PreAuthorize("@ss.hasPermi('mes:completionOrder:query')")
    @GetMapping(value = "/{completionId}")
    public AjaxResult getInfo(@PathVariable("completionId") Long completionId)
    {
        return success(completionOrderService.selectCompletionOrderById(completionId));
    }

    /**
     * 修改生产完工单
     */
    @PreAuthorize("@ss.hasPermi('mes:completionOrder:edit')")
    @Log(title = "生产完工单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CompletionOrder completionOrder)
    {
        completionOrder.setUpdateBy(getUsername());
        return toAjax(completionOrderService.updateCompletionOrder(completionOrder));
    }

    /**
     * 删除生产完工单
     */
    @PreAuthorize("@ss.hasPermi('mes:completionOrder:remove')")
    @Log(title = "生产完工单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{completionIds}")
    public AjaxResult remove(@PathVariable Long[] completionIds)
    {
        return toAjax(completionOrderService.deleteCompletionOrderByIds(completionIds));
    }
}
