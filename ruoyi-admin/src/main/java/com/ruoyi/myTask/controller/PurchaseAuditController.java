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
import com.ruoyi.myTask.domain.PurchaseAudit;
import com.ruoyi.myTask.service.IPurchaseAuditService;

/**
 * 采购申请审核Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/myTask/purchaseAudit")
public class PurchaseAuditController extends BaseController
{
    @Autowired
    private IPurchaseAuditService purchaseAuditService;

    /**
     * 查询采购申请审核列表
     */
    @PreAuthorize("@ss.hasPermi('myTask:purchaseAudit:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseAudit purchaseAudit)
    {
        startPage();
        List<PurchaseAudit> list = purchaseAuditService.selectPurchaseAuditList(purchaseAudit);
        return getDataTable(list);
    }

    /**
     * 导出采购申请审核列表
     */
    @PreAuthorize("@ss.hasPermi('myTask:purchaseAudit:export')")
    @Log(title = "采购申请审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseAudit purchaseAudit)
    {
        List<PurchaseAudit> list = purchaseAuditService.selectPurchaseAuditList(purchaseAudit);
        ExcelUtil<PurchaseAudit> util = new ExcelUtil<PurchaseAudit>(PurchaseAudit.class);
        util.exportExcel(response, list, "采购申请审核数据");
    }

    /**
     * 获取采购申请审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('myTask:purchaseAudit:query')")
    @GetMapping(value = "/{auditId}")
    public AjaxResult getInfo(@PathVariable("auditId") Long auditId)
    {
        return success(purchaseAuditService.selectPurchaseAuditById(auditId));
    }

    /**
     * 新增采购申请审核
     */
    @PreAuthorize("@ss.hasPermi('myTask:purchaseAudit:add')")
    @Log(title = "采购申请审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseAudit purchaseAudit)
    {
        purchaseAudit.setCreateBy(getUsername());
        return toAjax(purchaseAuditService.insertPurchaseAudit(purchaseAudit));
    }

    /**
     * 修改采购申请审核
     */
    @PreAuthorize("@ss.hasPermi('myTask:purchaseAudit:edit')")
    @Log(title = "采购申请审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseAudit purchaseAudit)
    {
        purchaseAudit.setUpdateBy(getUsername());
        // 审核操作时（auditStatus不为空），自动设置审核人和审核日期
        if (purchaseAudit.getAuditStatus() != null && !"".equals(purchaseAudit.getAuditStatus()))
        {
            purchaseAudit.setAuditor(getUsername());
            purchaseAudit.setAuditDate(new java.util.Date());
        }
        return toAjax(purchaseAuditService.updatePurchaseAudit(purchaseAudit));
    }

    /**
     * 删除采购申请审核
     */
    @PreAuthorize("@ss.hasPermi('myTask:purchaseAudit:remove')")
    @Log(title = "采购申请审核", businessType = BusinessType.DELETE)
    @DeleteMapping("/{auditIds}")
    public AjaxResult remove(@PathVariable Long[] auditIds)
    {
        return toAjax(purchaseAuditService.deletePurchaseAuditByIds(auditIds));
    }
}
