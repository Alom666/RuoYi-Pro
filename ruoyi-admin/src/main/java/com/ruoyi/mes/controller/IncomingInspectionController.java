
package com.ruoyi.mes.controller;

import java.util.List;
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
import com.ruoyi.mes.domain.IncomingInspection;
import com.ruoyi.mes.service.IIncomingInspectionService;

/**
 * 来料检验Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/mes/incomingInspection")
public class IncomingInspectionController extends BaseController
{
    @Autowired
    private IIncomingInspectionService incomingInspectionService;

    /**
     * 查询来料检验列表
     */
    @PreAuthorize("@ss.hasPermi('mes:incomingInspection:list')")
    @GetMapping("/list")
    public TableDataInfo list(IncomingInspection incomingInspection)
    {
        startPage();
        List<IncomingInspection> list = incomingInspectionService.selectIncomingInspectionList(incomingInspection);
        return getDataTable(list);
    }

    /**
     * 获取来料检验详细信息
     */
    @PreAuthorize("@ss.hasPermi('mes:incomingInspection:query')")
    @GetMapping(value = "/{inspectionId}")
    public AjaxResult getInfo(@PathVariable("inspectionId") Long inspectionId)
    {
        return success(incomingInspectionService.selectIncomingInspectionById(inspectionId));
    }

    /**
     * 新增来料检验
     */
    @PreAuthorize("@ss.hasPermi('mes:incomingInspection:add')")
    @Log(title = "来料检验", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IncomingInspection incomingInspection)
    {
        incomingInspection.setCreateBy(getUsername());
        return toAjax(incomingInspectionService.insertIncomingInspection(incomingInspection));
    }

    /**
     * 修改来料检验
     */
    @PreAuthorize("@ss.hasPermi('mes:incomingInspection:edit')")
    @Log(title = "来料检验", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IncomingInspection incomingInspection)
    {
        incomingInspection.setUpdateBy(getUsername());
        return toAjax(incomingInspectionService.updateIncomingInspection(incomingInspection));
    }

    /**
     * 删除来料检验
     */
    @PreAuthorize("@ss.hasPermi('mes:incomingInspection:remove')")
    @Log(title = "来料检验", businessType = BusinessType.DELETE)
    @DeleteMapping("/{inspectionIds}")
    public AjaxResult remove(@PathVariable Long[] inspectionIds)
    {
        return toAjax(incomingInspectionService.deleteIncomingInspectionByIds(inspectionIds));
    }
}
