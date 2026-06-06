
package com.ruoyi.wms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.wms.mapper.MaterialCategoryMapper;
import com.ruoyi.wms.domain.MaterialCategory;
import com.ruoyi.wms.service.IMaterialCategoryService;

/**
 * 物料分类Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class MaterialCategoryServiceImpl implements IMaterialCategoryService
{
    @Autowired
    private MaterialCategoryMapper materialCategoryMapper;

    /**
     * 查询物料分类
     *
     * @param categoryId 物料分类ID
     * @return 物料分类
     */
    @Override
    public MaterialCategory selectMaterialCategoryById(Long categoryId)
    {
        return materialCategoryMapper.selectMaterialCategoryById(categoryId);
    }

    /**
     * 查询物料分类列表
     *
     * @param materialCategory 物料分类
     * @return 物料分类
     */
    @Override
    public List<MaterialCategory> selectMaterialCategoryList(MaterialCategory materialCategory)
    {
        return materialCategoryMapper.selectMaterialCategoryList(materialCategory);
    }

    /**
     * 构建前端所需要树结构
     *
     * @param categories 物料分类列表
     * @return 树结构列表
     */
    @Override
    public List<MaterialCategory> buildCategoryTree(List<MaterialCategory> categories)
    {
        List<MaterialCategory> returnList = new ArrayList<MaterialCategory>();
        List<Long> tempList = categories.stream().map(MaterialCategory::getCategoryId).collect(Collectors.toList());
        for (MaterialCategory category : categories)
        {
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(category.getParentId()))
            {
                recursionFn(categories, category);
                returnList.add(category);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = categories;
        }
        return returnList;
    }

    /**
     * 构建前端所需要下拉树结构
     *
     * @param categories 物料分类列表
     * @return 下拉树结构列表
     */
    @Override
    public List<TreeSelect> buildCategoryTreeSelect(List<MaterialCategory> categories)
    {
        List<MaterialCategory> categoryTrees = buildCategoryTree(categories);
        return categoryTrees.stream().map(this::convertToTreeSelect).collect(Collectors.toList());
    }

    /**
     * 将MaterialCategory转换为TreeSelect
     */
    private TreeSelect convertToTreeSelect(MaterialCategory category)
    {
        TreeSelect treeSelect = new TreeSelect();
        treeSelect.setId(category.getCategoryId());
        treeSelect.setLabel(category.getCategoryName());
        if (category.getChildren() != null && !category.getChildren().isEmpty())
        {
            treeSelect.setChildren(category.getChildren().stream().map(this::convertToTreeSelect).collect(Collectors.toList()));
        }
        return treeSelect;
    }

    /**
     * 查询物料分类树结构信息
     *
     * @param materialCategory 物料分类
     * @return 物料分类树信息集合
     */
    @Override
    public List<TreeSelect> selectCategoryTreeList(MaterialCategory materialCategory)
    {
        List<MaterialCategory> categories = materialCategoryMapper.selectMaterialCategoryList(materialCategory);
        return buildCategoryTreeSelect(categories);
    }

    /**
     * 新增物料分类
     *
     * @param materialCategory 物料分类
     * @return 结果
     */
    @Override
    public int insertMaterialCategory(MaterialCategory materialCategory)
    {
        return materialCategoryMapper.insertMaterialCategory(materialCategory);
    }

    /**
     * 修改物料分类
     *
     * @param materialCategory 物料分类
     * @return 结果
     */
    @Override
    public int updateMaterialCategory(MaterialCategory materialCategory)
    {
        return materialCategoryMapper.updateMaterialCategory(materialCategory);
    }

    /**
     * 删除物料分类
     *
     * @param categoryId 物料分类ID
     * @return 结果
     */
    @Override
    public int deleteMaterialCategoryById(Long categoryId)
    {
        return materialCategoryMapper.deleteMaterialCategoryById(categoryId);
    }

    /**
     * 批量删除物料分类
     *
     * @param categoryIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMaterialCategoryByIds(Long[] categoryIds)
    {
        return materialCategoryMapper.deleteMaterialCategoryByIds(categoryIds);
    }

    /**
     * 是否存在子节点
     *
     * @param categoryId 分类ID
     * @return 结果 true 存在 false 不存在
     */
    @Override
    public boolean hasChildByCategoryId(Long categoryId)
    {
        int result = materialCategoryMapper.hasChildByParentId(categoryId);
        return result > 0;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<MaterialCategory> list, MaterialCategory t)
    {
        // 得到子节点列表
        List<MaterialCategory> childList = getChildList(list, t);
        t.setChildren(childList);
        for (MaterialCategory tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<MaterialCategory> getChildList(List<MaterialCategory> list, MaterialCategory t)
    {
        List<MaterialCategory> tlist = new ArrayList<MaterialCategory>();
        for (MaterialCategory n : list)
        {
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getCategoryId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<MaterialCategory> list, MaterialCategory t)
    {
        return !getChildList(list, t).isEmpty();
    }
}
