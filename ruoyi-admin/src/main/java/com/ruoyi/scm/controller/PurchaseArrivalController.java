
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
import com.ruoyi.scm.domain.PurchaseArrival;
import com.ruoyi.scm.service.IPurchaseArrivalService;

/**
 * 采购到货Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/purchaseArrival")
public class PurchaseArrivalController extends BaseController
{
    @Autowired
    private IPurchaseArrivalService purchaseArrivalService;

    @PreAuthorize("@ss.hasPermi('scm:purchaseArrival:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseArrival purchaseArrival)
    {
        startPage();
        List<PurchaseArrival> list = purchaseArrivalService.selectPurchaseArrivalList(purchaseArrival);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseArrival:export')")
    @Log(title = "采购到货", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseArrival purchaseArrival)
    {
        List<PurchaseArrival> list = purchaseArrivalService.selectPurchaseArrivalList(purchaseArrival);
        ExcelUtil<PurchaseArrival> util = new ExcelUtil<PurchaseArrival>(PurchaseArrival.class);
        util.exportExcel(response, list, "采购到货数据");
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseArrival:query')")
    @GetMapping(value = "/{arrivalId}")
    public AjaxResult getInfo(@PathVariable("arrivalId") Long arrivalId)
    {
        return success(purchaseArrivalService.selectPurchaseArrivalById(arrivalId));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseArrival:add')")
    @Log(title = "采购到货", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseArrival purchaseArrival)
    {
        purchaseArrival.setCreateBy(getUsername());
        return toAjax(purchaseArrivalService.insertPurchaseArrival(purchaseArrival));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseArrival:edit')")
    @Log(title = "采购到货", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseArrival purchaseArrival)
    {
        purchaseArrival.setUpdateBy(getUsername());
        return toAjax(purchaseArrivalService.updatePurchaseArrival(purchaseArrival));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseArrival:remove')")
    @Log(title = "采购到货", businessType = BusinessType.DELETE)
    @DeleteMapping("/{arrivalIds}")
    public AjaxResult remove(@PathVariable Long[] arrivalIds)
    {
        return toAjax(purchaseArrivalService.deletePurchaseArrivalByIds(arrivalIds));
    }
}
