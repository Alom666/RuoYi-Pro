
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
import com.ruoyi.mes.domain.MaterialApply;
import com.ruoyi.mes.service.IMaterialApplyService;

/**
 * 领料申请Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/mes/materialApply")
public class MaterialApplyController extends BaseController
{
    @Autowired
    private IMaterialApplyService materialApplyService;

    /**
     * 查询领料申请列表
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:list')")
    @GetMapping("/list")
    public TableDataInfo list(MaterialApply materialApply)
    {
        startPage();
        List<MaterialApply> list = materialApplyService.selectMaterialApplyList(materialApply);
        return getDataTable(list);
    }

    /**
     * 导出领料申请列表
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:export')")
    @Log(title = "领料申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MaterialApply materialApply)
    {
        List<MaterialApply> list = materialApplyService.selectMaterialApplyList(materialApply);
        ExcelUtil<MaterialApply> util = new ExcelUtil<MaterialApply>(MaterialApply.class);
        util.exportExcel(response, list, "领料申请数据");
    }

    /**
     * 获取领料申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(materialApplyService.selectMaterialApplyById(applyId));
    }

    /**
     * 新增领料申请
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:add')")
    @Log(title = "领料申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MaterialApply materialApply)
    {
        materialApply.setCreateBy(getUsername());
        return toAjax(materialApplyService.insertMaterialApply(materialApply));
    }

    /**
     * 修改领料申请
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:edit')")
    @Log(title = "领料申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MaterialApply materialApply)
    {
        materialApply.setUpdateBy(getUsername());
        return toAjax(materialApplyService.updateMaterialApply(materialApply));
    }

    /**
     * 审核领料申请
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:audit')")
    @Log(title = "领料申请", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public AjaxResult audit(@RequestBody MaterialApply materialApply)
    {
        materialApply.setUpdateBy(getUsername());
        materialApply.setAuditor(getUsername());
        materialApply.setAuditDate(new java.util.Date());
        materialApply.setApplyStatus("2");
        return toAjax(materialApplyService.updateMaterialApply(materialApply));
    }

    /**
     * 删除领料申请
     */
    @PreAuthorize("@ss.hasPermi('mes:materialApply:remove')")
    @Log(title = "领料申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(materialApplyService.deleteMaterialApplyByIds(applyIds));
    }
}
