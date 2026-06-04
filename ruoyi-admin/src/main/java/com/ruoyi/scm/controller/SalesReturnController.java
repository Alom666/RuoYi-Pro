
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
import com.ruoyi.scm.domain.SalesReturn;
import com.ruoyi.scm.service.ISalesReturnService;

/**
 * 销售退货Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/scm/salesReturn")
public class SalesReturnController extends BaseController
{
    @Autowired
    private ISalesReturnService salesReturnService;

    @PreAuthorize("@ss.hasPermi('scm:salesReturn:list')")
    @GetMapping("/list")
    public TableDataInfo list(SalesReturn salesReturn)
    {
        startPage();
        List<SalesReturn> list = salesReturnService.selectSalesReturnList(salesReturn);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('scm:salesReturn:export')")
    @Log(title = "销售退货", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SalesReturn salesReturn)
    {
        List<SalesReturn> list = salesReturnService.selectSalesReturnList(salesReturn);
        ExcelUtil<SalesReturn> util = new ExcelUtil<SalesReturn>(SalesReturn.class);
        util.exportExcel(response, list, "销售退货数据");
    }

    @PreAuthorize("@ss.hasPermi('scm:salesReturn:query')")
    @GetMapping(value = "/{returnId}")
    public AjaxResult getInfo(@PathVariable("returnId") Long returnId)
    {
        return success(salesReturnService.selectSalesReturnById(returnId));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesReturn:add')")
    @Log(title = "销售退货", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SalesReturn salesReturn)
    {
        salesReturn.setCreateBy(getUsername());
        return toAjax(salesReturnService.insertSalesReturn(salesReturn));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesReturn:edit')")
    @Log(title = "销售退货", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SalesReturn salesReturn)
    {
        salesReturn.setUpdateBy(getUsername());
        return toAjax(salesReturnService.updateSalesReturn(salesReturn));
    }

    @PreAuthorize("@ss.hasPermi('scm:salesReturn:remove')")
    @Log(title = "销售退货", businessType = BusinessType.DELETE)
    @DeleteMapping("/{returnIds}")
    public AjaxResult remove(@PathVariable Long[] returnIds)
    {
        return toAjax(salesReturnService.deleteSalesReturnByIds(returnIds));
    }
}
