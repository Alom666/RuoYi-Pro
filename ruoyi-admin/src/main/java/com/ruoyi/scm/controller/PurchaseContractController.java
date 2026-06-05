
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
import com.ruoyi.scm.domain.PurchaseContract;
import com.ruoyi.scm.service.IPurchaseContractService;

/**
 * 采购合同Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/purchaseContract")
public class PurchaseContractController extends BaseController
{
    @Autowired
    private IPurchaseContractService purchaseContractService;

    @PreAuthorize("@ss.hasPermi('scm:purchaseContract:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseContract purchaseContract)
    {
        startPage();
        List<PurchaseContract> list = purchaseContractService.selectPurchaseContractList(purchaseContract);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseContract:export')")
    @Log(title = "采购合同", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseContract purchaseContract)
    {
        List<PurchaseContract> list = purchaseContractService.selectPurchaseContractList(purchaseContract);
        ExcelUtil<PurchaseContract> util = new ExcelUtil<PurchaseContract>(PurchaseContract.class);
        util.exportExcel(response, list, "采购合同数据");
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseContract:query')")
    @GetMapping(value = "/{contractId}")
    public AjaxResult getInfo(@PathVariable("contractId") Long contractId)
    {
        return success(purchaseContractService.selectPurchaseContractById(contractId));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseContract:add')")
    @Log(title = "采购合同", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseContract purchaseContract)
    {
        purchaseContract.setCreateBy(getUsername());
        return toAjax(purchaseContractService.insertPurchaseContract(purchaseContract));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseContract:edit')")
    @Log(title = "采购合同", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseContract purchaseContract)
    {
        purchaseContract.setUpdateBy(getUsername());
        return toAjax(purchaseContractService.updatePurchaseContract(purchaseContract));
    }

    @PreAuthorize("@ss.hasPermi('scm:purchaseContract:remove')")
    @Log(title = "采购合同", businessType = BusinessType.DELETE)
    @DeleteMapping("/{contractIds}")
    public AjaxResult remove(@PathVariable Long[] contractIds)
    {
        return toAjax(purchaseContractService.deletePurchaseContractByIds(contractIds));
    }
}
