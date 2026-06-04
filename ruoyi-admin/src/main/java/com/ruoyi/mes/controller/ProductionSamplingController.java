
package com.ruoyi.mes.controller;

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
import com.ruoyi.mes.domain.ProductionSampling;
import com.ruoyi.mes.service.IProductionSamplingService;

/**
 * 生产采样Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/mes/productionSampling")
public class ProductionSamplingController extends BaseController
{
    @Autowired
    private IProductionSamplingService productionSamplingService;

    /**
     * 查询生产采样列表
     */
    @PreAuthorize("@ss.hasPermi('mes:productionSampling:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProductionSampling productionSampling)
    {
        startPage();
        List<ProductionSampling> list = productionSamplingService.selectProductionSamplingList(productionSampling);
        return getDataTable(list);
    }

    /**
     * 导出生产采样列表
     */
    @PreAuthorize("@ss.hasPermi('mes:productionSampling:export')")
    @Log(title = "生产采样", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProductionSampling productionSampling)
    {
        List<ProductionSampling> list = productionSamplingService.selectProductionSamplingList(productionSampling);
        ExcelUtil<ProductionSampling> util = new ExcelUtil<ProductionSampling>(ProductionSampling.class);
        util.exportExcel(response, list, "生产采样数据");
    }

    /**
     * 获取生产采样详细信息
     */
    @PreAuthorize("@ss.hasPermi('mes:productionSampling:query')")
    @GetMapping(value = "/{samplingId}")
    public AjaxResult getInfo(@PathVariable("samplingId") Long samplingId)
    {
        return success(productionSamplingService.selectProductionSamplingById(samplingId));
    }

    /**
     * 新增生产采样
     */
    @PreAuthorize("@ss.hasPermi('mes:productionSampling:add')")
    @Log(title = "生产采样", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProductionSampling productionSampling)
    {
        productionSampling.setCreateBy(getUsername());
        return toAjax(productionSamplingService.insertProductionSampling(productionSampling));
    }

    /**
     * 修改生产采样
     */
    @PreAuthorize("@ss.hasPermi('mes:productionSampling:edit')")
    @Log(title = "生产采样", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProductionSampling productionSampling)
    {
        productionSampling.setUpdateBy(getUsername());
        return toAjax(productionSamplingService.updateProductionSampling(productionSampling));
    }

    /**
     * 删除生产采样
     */
    @PreAuthorize("@ss.hasPermi('mes:productionSampling:remove')")
    @Log(title = "生产采样", businessType = BusinessType.DELETE)
    @DeleteMapping("/{samplingIds}")
    public AjaxResult remove(@PathVariable Long[] samplingIds)
    {
        return toAjax(productionSamplingService.deleteProductionSamplingByIds(samplingIds));
    }
}
