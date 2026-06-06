
package com.ruoyi.wms.controller;

import java.util.List;
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
import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wms.domain.MaterialCategory;
import com.ruoyi.wms.service.IMaterialCategoryService;

/**
 * 物料分类Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/wms/materialCategory")
public class MaterialCategoryController extends BaseController
{
    @Autowired
    private IMaterialCategoryService materialCategoryService;

    /**
     * 查询物料分类列表
     */
    @PreAuthorize("@ss.hasPermi('wms:materialCategory:list')")
    @GetMapping("/list")
    public AjaxResult list(MaterialCategory materialCategory)
    {
        List<MaterialCategory> list = materialCategoryService.selectMaterialCategoryList(materialCategory);
        return success(list);
    }

    /**
     * 查询物料分类树结构
     */
    @PreAuthorize("@ss.hasPermi('wms:materialCategory:list')")
    @GetMapping("/tree")
    public AjaxResult tree(MaterialCategory materialCategory)
    {
        List<MaterialCategory> list = materialCategoryService.selectMaterialCategoryList(materialCategory);
        return success(materialCategoryService.buildCategoryTree(list));
    }

    /**
     * 查询物料分类下拉树结构
     */
    @GetMapping("/treeselect")
    public AjaxResult treeselect(MaterialCategory materialCategory)
    {
        List<TreeSelect> treeSelects = materialCategoryService.selectCategoryTreeList(materialCategory);
        return success(treeSelects);
    }

    /**
     * 获取物料分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('wms:materialCategory:query')")
    @GetMapping(value = "/{categoryId}")
    public AjaxResult getInfo(@PathVariable("categoryId") Long categoryId)
    {
        return success(materialCategoryService.selectMaterialCategoryById(categoryId));
    }

    /**
     * 新增物料分类
     */
    @PreAuthorize("@ss.hasPermi('wms:materialCategory:add')")
    @Log(title = "物料分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody MaterialCategory materialCategory)
    {
        materialCategory.setCreateBy(getUsername());
        return toAjax(materialCategoryService.insertMaterialCategory(materialCategory));
    }

    /**
     * 修改物料分类
     */
    @PreAuthorize("@ss.hasPermi('wms:materialCategory:edit')")
    @Log(title = "物料分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody MaterialCategory materialCategory)
    {
        materialCategory.setUpdateBy(getUsername());
        return toAjax(materialCategoryService.updateMaterialCategory(materialCategory));
    }

    /**
     * 删除物料分类
     */
    @PreAuthorize("@ss.hasPermi('wms:materialCategory:remove')")
    @Log(title = "物料分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{categoryId}")
    public AjaxResult remove(@PathVariable Long categoryId)
    {
        if (materialCategoryService.hasChildByCategoryId(categoryId))
        {
            return warn("存在子分类,不允许删除");
        }
        return toAjax(materialCategoryService.deleteMaterialCategoryById(categoryId));
    }
}
