
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
import com.ruoyi.scm.domain.SalesContract;
import com.ruoyi.scm.service.ISalesContractService;

/**
 * 销售合同Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/salesContract")
public class SalesContractController extends BaseController
{
    @Autowired
    private ISalesContractService salesContractService;

    @PreAuthorize("@ss.hasPermi('scm:salesContract:list')")
    @GetMapping("/list")
    public TableDataInfo list(SalesContract salesContract)
    {
        startPage();
        List<SalesContract> list = salesContractService.selectSalesContractList(salesContract);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('scm:salesContract:export')")
    @Log(title = "销售合同", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SalesContract salesContract)
    {
        List<SalesContract> list = salesContractService.selectSalesContractList(salesContract);
        ExcelUtil<SalesContract> util = new ExcelUtil<SalesContract>(SalesContract.class);
        util.exportExcel(response, list, "销售合同数据");
    }

    @PreAuthorize("@ss.hasPermi('scm:salesContract:query')")
    @GetMapping(value = "/{contractId}")
    public AjaxResult getInfo(@PathVariable("contractId") Long contractId)
    {
        return success(salesContractService.selectSalesContractById(contractId));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesContract:add')")
    @Log(title = "销售合同", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SalesContract salesContract)
    {
        salesContract.setCreateBy(getUsername());
        return toAjax(salesContractService.insertSalesContract(salesContract));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesContract:edit')")
    @Log(title = "销售合同", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SalesContract salesContract)
    {
        salesContract.setUpdateBy(getUsername());
        return toAjax(salesContractService.updateSalesContract(salesContract));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesContract:remove')")
    @Log(title = "销售合同", businessType = BusinessType.DELETE)
    @DeleteMapping("/{contractIds}")
    public AjaxResult remove(@PathVariable Long[] contractIds)
    {
        return toAjax(salesContractService.deleteSalesContractByIds(contractIds));
    }
}
