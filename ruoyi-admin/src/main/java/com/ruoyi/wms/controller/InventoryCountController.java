
package com.ruoyi.wms.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
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
import com.ruoyi.wms.domain.InventoryCount;
import com.ruoyi.wms.service.IInventoryCountService;

/**
 * 盘点信息Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/wms/inventoryCount")
public class InventoryCountController extends BaseController
{
    @Autowired
    private IInventoryCountService inventoryCountService;

    /**
     * 查询盘点信息列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inventoryCount:list')")
    @GetMapping("/list")
    public TableDataInfo list(InventoryCount inventoryCount)
    {
        startPage();
        List<InventoryCount> list = inventoryCountService.selectInventoryCountList(inventoryCount);
        return getDataTable(list);
    }

    /**
     * 导出盘点信息列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inventoryCount:export')")
    @Log(title = "盘点信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, InventoryCount inventoryCount)
    {
        List<InventoryCount> list = inventoryCountService.selectInventoryCountList(inventoryCount);
        ExcelUtil<InventoryCount> util = new ExcelUtil<InventoryCount>(InventoryCount.class);
        util.exportExcel(response, list, "盘点信息数据");
    }

    /**
     * 获取盘点信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inventoryCount:query')")
    @GetMapping(value = "/{countId}")
    public AjaxResult getInfo(@PathVariable("countId") Long countId)
    {
        return success(inventoryCountService.selectInventoryCountById(countId));
    }

    /**
     * 新增盘点信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inventoryCount:add')")
    @Log(title = "盘点信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody InventoryCount inventoryCount)
    {
        inventoryCount.setCreateBy(getUsername());
        return toAjax(inventoryCountService.insertInventoryCount(inventoryCount));
    }

    /**
     * 修改盘点信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inventoryCount:edit')")
    @Log(title = "盘点信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody InventoryCount inventoryCount)
    {
        inventoryCount.setUpdateBy(getUsername());
        return toAjax(inventoryCountService.updateInventoryCount(inventoryCount));
    }

    /**
     * 删除盘点信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inventoryCount:remove')")
    @Log(title = "盘点信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{countIds}")
    public AjaxResult remove(@PathVariable Long[] countIds)
    {
        return toAjax(inventoryCountService.deleteInventoryCountByIds(countIds));
    }
}
