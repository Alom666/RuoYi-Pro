
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
import com.ruoyi.wms.domain.OutboundApply;
import com.ruoyi.wms.service.IOutboundApplyService;

/**
 * 出库申请Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/wms/outboundApply")
public class OutboundApplyController extends BaseController
{
    @Autowired
    private IOutboundApplyService outboundApplyService;

    /**
     * 查询出库申请列表
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:list')")
    @GetMapping("/list")
    public TableDataInfo list(OutboundApply outboundApply)
    {
        startPage();
        List<OutboundApply> list = outboundApplyService.selectOutboundApplyList(outboundApply);
        return getDataTable(list);
    }

    /**
     * 导出出库申请列表
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:export')")
    @Log(title = "出库申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OutboundApply outboundApply)
    {
        List<OutboundApply> list = outboundApplyService.selectOutboundApplyList(outboundApply);
        ExcelUtil<OutboundApply> util = new ExcelUtil<OutboundApply>(OutboundApply.class);
        util.exportExcel(response, list, "出库申请数据");
    }

    /**
     * 获取出库申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(outboundApplyService.selectOutboundApplyById(applyId));
    }

    /**
     * 新增出库申请
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:add')")
    @Log(title = "出库申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody OutboundApply outboundApply)
    {
        outboundApply.setCreateBy(getUsername());
        return toAjax(outboundApplyService.insertOutboundApply(outboundApply));
    }

    /**
     * 修改出库申请
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:edit')")
    @Log(title = "出库申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody OutboundApply outboundApply)
    {
        outboundApply.setUpdateBy(getUsername());
        return toAjax(outboundApplyService.updateOutboundApply(outboundApply));
    }

    /**
     * 提交出库申请
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:edit')")
    @Log(title = "出库申请", businessType = BusinessType.UPDATE)
    @PutMapping("/submit/{applyId}")
    public AjaxResult submit(@PathVariable Long applyId)
    {
        return toAjax(outboundApplyService.submitOutboundApply(applyId));
    }

    /**
     * 删除出库申请
     */
    @PreAuthorize("@ss.hasPermi('wms:outboundApply:remove')")
    @Log(title = "出库申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(outboundApplyService.deleteOutboundApplyByIds(applyIds));
    }
}
