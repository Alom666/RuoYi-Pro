
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
import com.ruoyi.wms.domain.InboundApply;
import com.ruoyi.wms.service.IInboundApplyService;

/**
 * WMS入库申请Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/wms/inboundApply")
public class InboundApplyController extends BaseController
{
    @Autowired
    private IInboundApplyService inboundApplyService;

    /**
     * 查询入库申请列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inboundApply:list')")
    @GetMapping("/list")
    public TableDataInfo list(InboundApply inboundApply)
    {
        startPage();
        List<InboundApply> list = inboundApplyService.selectInboundApplyList(inboundApply);
        return getDataTable(list);
    }

    /**
     * 导出入库申请列表
     */
    @PreAuthorize("@ss.hasPermi('wms:inboundApply:export')")
    @Log(title = "入库申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, InboundApply inboundApply)
    {
        List<InboundApply> list = inboundApplyService.selectInboundApplyList(inboundApply);
        ExcelUtil<InboundApply> util = new ExcelUtil<InboundApply>(InboundApply.class);
        util.exportExcel(response, list, "入库申请数据");
    }

    /**
     * 获取入库申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:inboundApply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(inboundApplyService.selectInboundApplyById(applyId));
    }

    /**
     * 新增入库申请
     */
    @PreAuthorize("@ss.hasPermi('wms:inboundApply:add')")
    @Log(title = "入库申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody InboundApply inboundApply)
    {
        inboundApply.setCreateBy(getUsername());
        return toAjax(inboundApplyService.insertInboundApply(inboundApply));
    }

    /**
     * 修改入库申请（含审核操作）
     */
    @PreAuthorize("@ss.hasPermi('wms:inboundApply:edit')")
    @Log(title = "入库申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody InboundApply inboundApply)
    {
        inboundApply.setUpdateBy(getUsername());
        return toAjax(inboundApplyService.updateInboundApply(inboundApply));
    }

    /**
     * 删除入库申请
     */
    @PreAuthorize("@ss.hasPermi('wms:inboundApply:remove')")
    @Log(title = "入库申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(inboundApplyService.deleteInboundApplyByIds(applyIds));
    }
}
