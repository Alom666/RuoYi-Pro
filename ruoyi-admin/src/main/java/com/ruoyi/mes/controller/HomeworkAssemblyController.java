
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
import com.ruoyi.mes.domain.HomeworkAssembly;
import com.ruoyi.mes.service.IHomeworkAssemblyService;

/**
 * 作业装配Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/mes/HomeworkAssembly")
public class HomeworkAssemblyController extends BaseController
{
    @Autowired
    private IHomeworkAssemblyService homeworkAssemblyService;

    /**
     * 查询作业装配列表
     */
    @PreAuthorize("@ss.hasPermi('mes:HomeworkAssembly:list')")
    @GetMapping("/list")
    public TableDataInfo list(HomeworkAssembly homeworkAssembly)
    {
        startPage();
        List<HomeworkAssembly> list = homeworkAssemblyService.selectHomeworkAssemblyList(homeworkAssembly);
        return getDataTable(list);
    }

    /**
     * 导出作业装配列表
     */
    @PreAuthorize("@ss.hasPermi('mes:HomeworkAssembly:export')")
    @Log(title = "作业装配", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HomeworkAssembly homeworkAssembly)
    {
        List<HomeworkAssembly> list = homeworkAssemblyService.selectHomeworkAssemblyList(homeworkAssembly);
        ExcelUtil<HomeworkAssembly> util = new ExcelUtil<HomeworkAssembly>(HomeworkAssembly.class);
        util.exportExcel(response, list, "作业装配数据");
    }

    /**
     * 获取作业装配详细信息
     */
    @PreAuthorize("@ss.hasPermi('mes:HomeworkAssembly:query')")
    @GetMapping(value = "/{assemblyId}")
    public AjaxResult getInfo(@PathVariable("assemblyId") Long assemblyId)
    {
        return success(homeworkAssemblyService.selectHomeworkAssemblyById(assemblyId));
    }

    /**
     * 新增作业装配
     */
    @PreAuthorize("@ss.hasPermi('mes:HomeworkAssembly:add')")
    @Log(title = "作业装配", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HomeworkAssembly homeworkAssembly)
    {
        homeworkAssembly.setCreateBy(getUsername());
        return toAjax(homeworkAssemblyService.insertHomeworkAssembly(homeworkAssembly));
    }

    /**
     * 修改作业装配
     */
    @PreAuthorize("@ss.hasPermi('mes:HomeworkAssembly:edit')")
    @Log(title = "作业装配", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HomeworkAssembly homeworkAssembly)
    {
        homeworkAssembly.setUpdateBy(getUsername());
        return toAjax(homeworkAssemblyService.updateHomeworkAssembly(homeworkAssembly));
    }

    /**
     * 删除作业装配
     */
    @PreAuthorize("@ss.hasPermi('mes:HomeworkAssembly:remove')")
    @Log(title = "作业装配", businessType = BusinessType.DELETE)
    @DeleteMapping("/{assemblyIds}")
    public AjaxResult remove(@PathVariable Long[] assemblyIds)
    {
        return toAjax(homeworkAssemblyService.deleteHomeworkAssemblyByIds(assemblyIds));
    }
}
