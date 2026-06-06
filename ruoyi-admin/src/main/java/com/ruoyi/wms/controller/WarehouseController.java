
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
import com.ruoyi.wms.domain.Warehouse;
import com.ruoyi.wms.service.IWarehouseService;

/**
 * 仓库信息Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/wms/warehouse")
public class WarehouseController extends BaseController
{
    @Autowired
    private IWarehouseService warehouseService;

    /**
     * 查询仓库信息列表
     */
    @PreAuthorize("@ss.hasPermi('wms:warehouse:list')")
    @GetMapping("/list")
    public TableDataInfo list(Warehouse warehouse)
    {
        startPage();
        List<Warehouse> list = warehouseService.selectWarehouseList(warehouse);
        return getDataTable(list);
    }

    /**
     * 导出仓库信息列表
     */
    @PreAuthorize("@ss.hasPermi('wms:warehouse:export')")
    @Log(title = "仓库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Warehouse warehouse)
    {
        List<Warehouse> list = warehouseService.selectWarehouseList(warehouse);
        ExcelUtil<Warehouse> util = new ExcelUtil<Warehouse>(Warehouse.class);
        util.exportExcel(response, list, "仓库信息数据");
    }

    /**
     * 获取仓库信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:warehouse:query')")
    @GetMapping(value = "/{warehouseId}")
    public AjaxResult getInfo(@PathVariable("warehouseId") Long warehouseId)
    {
        return success(warehouseService.selectWarehouseById(warehouseId));
    }

    /**
     * 新增仓库信息
     */
    @PreAuthorize("@ss.hasPermi('wms:warehouse:add')")
    @Log(title = "仓库信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Warehouse warehouse)
    {
        warehouse.setCreateBy(getUsername());
        return toAjax(warehouseService.insertWarehouse(warehouse));
    }

    /**
     * 修改仓库信息
     */
    @PreAuthorize("@ss.hasPermi('wms:warehouse:edit')")
    @Log(title = "仓库信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Warehouse warehouse)
    {
        warehouse.setUpdateBy(getUsername());
        return toAjax(warehouseService.updateWarehouse(warehouse));
    }

    /**
     * 删除仓库信息
     */
    @PreAuthorize("@ss.hasPermi('wms:warehouse:remove')")
    @Log(title = "仓库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{warehouseIds}")
    public AjaxResult remove(@PathVariable Long[] warehouseIds)
    {
        return toAjax(warehouseService.deleteWarehouseByIds(warehouseIds));
    }
}
