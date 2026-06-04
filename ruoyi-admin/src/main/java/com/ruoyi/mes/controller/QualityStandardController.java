
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
import com.ruoyi.mes.domain.QualityStandard;
import com.ruoyi.mes.service.IQualityStandardService;

/**
 * 质检标准Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/mes/qualityStandard")
public class QualityStandardController extends BaseController
{
    @Autowired
    private IQualityStandardService qualityStandardService;

    /**
     * 查询质检标准列表
     */
    @PreAuthorize("@ss.hasPermi('mes:qualityStandard:list')")
    @GetMapping("/list")
    public TableDataInfo list(QualityStandard qualityStandard)
    {
        startPage();
        List<QualityStandard> list = qualityStandardService.selectQualityStandardList(qualityStandard);
        return getDataTable(list);
    }

    /**
     * 导出质检标准列表
     */
    @PreAuthorize("@ss.hasPermi('mes:qualityStandard:export')")
    @Log(title = "质检标准", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, QualityStandard qualityStandard)
    {
        List<QualityStandard> list = qualityStandardService.selectQualityStandardList(qualityStandard);
        ExcelUtil<QualityStandard> util = new ExcelUtil<QualityStandard>(QualityStandard.class);
        util.exportExcel(response, list, "质检标准数据");
    }

    /**
     * 获取质检标准详细信息
     */
    @PreAuthorize("@ss.hasPermi('mes:qualityStandard:query')")
    @GetMapping(value = "/{standardId}")
    public AjaxResult getInfo(@PathVariable("standardId") Long standardId)
    {
        return success(qualityStandardService.selectQualityStandardById(standardId));
    }

    /**
     * 新增质检标准
     */
    @PreAuthorize("@ss.hasPermi('mes:qualityStandard:add')")
    @Log(title = "质检标准", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody QualityStandard qualityStandard)
    {
        qualityStandard.setCreateBy(getUsername());
        return toAjax(qualityStandardService.insertQualityStandard(qualityStandard));
    }

    /**
     * 修改质检标准
     */
    @PreAuthorize("@ss.hasPermi('mes:qualityStandard:edit')")
    @Log(title = "质检标准", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody QualityStandard qualityStandard)
    {
        qualityStandard.setUpdateBy(getUsername());
        return toAjax(qualityStandardService.updateQualityStandard(qualityStandard));
    }

    /**
     * 删除质检标准
     */
    @PreAuthorize("@ss.hasPermi('mes:qualityStandard:remove')")
    @Log(title = "质检标准", businessType = BusinessType.DELETE)
    @DeleteMapping("/{standardIds}")
    public AjaxResult remove(@PathVariable Long[] standardIds)
    {
        return toAjax(qualityStandardService.deleteQualityStandardByIds(standardIds));
    }
}
