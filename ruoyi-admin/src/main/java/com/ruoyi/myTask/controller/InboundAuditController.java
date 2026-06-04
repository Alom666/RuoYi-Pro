package com.ruoyi.myTask.controller;

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
import com.ruoyi.myTask.domain.InboundAudit;
import com.ruoyi.myTask.service.IInboundAuditService;

/**
 * 入库申请审核Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/myTask/inboundAudit")
public class InboundAuditController extends BaseController
{
    @Autowired
    private IInboundAuditService inboundAuditService;

    /**
     * 查询入库申请审核列表
     */
    @PreAuthorize("@ss.hasPermi('myTask:inboundAudit:list')")
    @GetMapping("/list")
    public TableDataInfo list(InboundAudit inboundAudit)
    {
        startPage();
        List<InboundAudit> list = inboundAuditService.selectInboundAuditList(inboundAudit);
        return getDataTable(list);
    }

    /**
     * 导出入库申请审核列表
     */
    @PreAuthorize("@ss.hasPermi('myTask:inboundAudit:export')")
    @Log(title = "入库申请审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, InboundAudit inboundAudit)
    {
        List<InboundAudit> list = inboundAuditService.selectInboundAuditList(inboundAudit);
        ExcelUtil<InboundAudit> util = new ExcelUtil<InboundAudit>(InboundAudit.class);
        util.exportExcel(response, list, "入库申请审核数据");
    }

    /**
     * 获取入库申请审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('myTask:inboundAudit:query')")
    @GetMapping(value = "/{auditId}")
    public AjaxResult getInfo(@PathVariable("auditId") Integer auditId)
    {
        return success(inboundAuditService.selectInboundAuditById(auditId));
    }

    /**
     * 新增入库申请审核
     */
    @PreAuthorize("@ss.hasPermi('myTask:inboundAudit:add')")
    @Log(title = "入库申请审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody InboundAudit inboundAudit)
    {
        inboundAudit.setCreateBy(getUsername());
        return toAjax(inboundAuditService.insertInboundAudit(inboundAudit));
    }

    /**
     * 修改入库申请审核
     */
    @PreAuthorize("@ss.hasPermi('myTask:inboundAudit:edit')")
    @Log(title = "入库申请审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody InboundAudit inboundAudit)
    {
        inboundAudit.setUpdateBy(getUsername());
        // 审核操作时（auditStatus不为空），自动设置审核人和审核日期
        if (inboundAudit.getAuditStatus() != null && !"".equals(inboundAudit.getAuditStatus()))
        {
            inboundAudit.setAuditor(getUsername());
            inboundAudit.setAuditDate(new java.util.Date());
        }
        return toAjax(inboundAuditService.updateInboundAudit(inboundAudit));
    }

    /**
     * 删除入库申请审核
     */
    @PreAuthorize("@ss.hasPermi('myTask:inboundAudit:remove')")
    @Log(title = "入库申请审核", businessType = BusinessType.DELETE)
    @DeleteMapping("/{auditIds}")
    public AjaxResult remove(@PathVariable Integer[] auditIds)
    {
        return toAjax(inboundAuditService.deleteInboundAuditByIds(auditIds));
    }
}
