
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
import com.ruoyi.scm.domain.PurchaseApply;
import com.ruoyi.scm.service.IPurchaseApplyService;

/**
 * 采购申请Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/purchaseApply")
public class PurchaseApplyController extends BaseController
{
    @Autowired
    private IPurchaseApplyService purchaseApplyService;

    @PreAuthorize("@ss.hasPermi('scm:purchaseApply:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseApply purchaseApply)
    {
        startPage();
        List<PurchaseApply> list = purchaseApplyService.selectPurchaseApplyList(purchaseApply);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseApply:export')")
    @Log(title = "采购申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseApply purchaseApply)
    {
        List<PurchaseApply> list = purchaseApplyService.selectPurchaseApplyList(purchaseApply);
        ExcelUtil<PurchaseApply> util = new ExcelUtil<PurchaseApply>(PurchaseApply.class);
        util.exportExcel(response, list, "采购申请数据");
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseApply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(purchaseApplyService.selectPurchaseApplyById(applyId));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseApply:add')")
    @Log(title = "采购申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseApply purchaseApply)
    {
        purchaseApply.setCreateBy(getUsername());
        return toAjax(purchaseApplyService.insertPurchaseApply(purchaseApply));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseApply:edit')")
    @Log(title = "采购申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseApply purchaseApply)
    {
        purchaseApply.setUpdateBy(getUsername());
        return toAjax(purchaseApplyService.updatePurchaseApply(purchaseApply));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseApply:remove')")
    @Log(title = "采购申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(purchaseApplyService.deletePurchaseApplyByIds(applyIds));
    }
}
