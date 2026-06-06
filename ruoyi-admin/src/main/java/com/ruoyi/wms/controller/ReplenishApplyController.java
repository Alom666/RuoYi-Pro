
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
import com.ruoyi.wms.domain.ReplenishApply;
import com.ruoyi.wms.service.IReplenishApplyService;

/**
 * 补货申请Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/wms/replenishApply")
public class ReplenishApplyController extends BaseController
{
    @Autowired
    private IReplenishApplyService replenishApplyService;

    /**
     * 查询补货申请列表
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:list')")
    @GetMapping("/list")
    public TableDataInfo list(ReplenishApply replenishApply)
    {
        startPage();
        List<ReplenishApply> list = replenishApplyService.selectReplenishApplyList(replenishApply);
        return getDataTable(list);
    }

    /**
     * 导出补货申请列表
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:export')")
    @Log(title = "补货申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ReplenishApply replenishApply)
    {
        List<ReplenishApply> list = replenishApplyService.selectReplenishApplyList(replenishApply);
        ExcelUtil<ReplenishApply> util = new ExcelUtil<ReplenishApply>(ReplenishApply.class);
        util.exportExcel(response, list, "补货申请数据");
    }

    /**
     * 获取补货申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(replenishApplyService.selectReplenishApplyById(applyId));
    }

    /**
     * 新增补货申请
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:add')")
    @Log(title = "补货申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody ReplenishApply replenishApply)
    {
        replenishApply.setCreateBy(getUsername());
        return toAjax(replenishApplyService.insertReplenishApply(replenishApply));
    }

    /**
     * 修改补货申请
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:edit')")
    @Log(title = "补货申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody ReplenishApply replenishApply)
    {
        replenishApply.setUpdateBy(getUsername());
        return toAjax(replenishApplyService.updateReplenishApply(replenishApply));
    }

    /**
     * 提交补货申请
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:edit')")
    @Log(title = "补货申请", businessType = BusinessType.UPDATE)
    @PutMapping("/submit/{applyId}")
    public AjaxResult submit(@PathVariable Long applyId)
    {
        return toAjax(replenishApplyService.submitReplenishApply(applyId));
    }

    /**
     * 生成采购申请
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:generate')")
    @Log(title = "补货申请", businessType = BusinessType.UPDATE)
    @PutMapping("/generatePurchase/{applyId}")
    public AjaxResult generatePurchase(@PathVariable Long applyId)
    {
        return toAjax(replenishApplyService.generatePurchaseApply(applyId));
    }

    /**
     * 删除补货申请
     */
    @PreAuthorize("@ss.hasPermi('wms:replenishApply:remove')")
    @Log(title = "补货申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(replenishApplyService.deleteReplenishApplyByIds(applyIds));
    }
}
