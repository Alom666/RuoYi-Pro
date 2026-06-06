
package com.ruoyi.wms.service;

import java.util.List;
import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.wms.domain.MaterialCategory;

/**
 * 物料分类Service接口
 *
 * @author ruoyi
 */
public interface IMaterialCategoryService
{
    /**
     * 查询物料分类
     *
     * @param categoryId 物料分类ID
     * @return 物料分类
     */
    public MaterialCategory selectMaterialCategoryById(Long categoryId);

    /**
     * 查询物料分类列表
     *
     * @param materialCategory 物料分类
     * @return 物料分类集合
     */
    public List<MaterialCategory> selectMaterialCategoryList(MaterialCategory materialCategory);

    /**
     * 构建前端所需要树结构
     *
     * @param categories 物料分类列表
     * @return 树结构列表
     */
    public List<MaterialCategory> buildCategoryTree(List<MaterialCategory> categories);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param categories 物料分类列表
     * @return 下拉树结构列表
     */
    public List<TreeSelect> buildCategoryTreeSelect(List<MaterialCategory> categories);

    /**
     * 查询物料分类树结构信息
     *
     * @param materialCategory 物料分类
     * @return 物料分类树信息集合
     */
    public List<TreeSelect> selectCategoryTreeList(MaterialCategory materialCategory);

    /**
     * 新增物料分类
     *
     * @param materialCategory 物料分类
     * @return 结果
     */
    public int insertMaterialCategory(MaterialCategory materialCategory);

    /**
     * 修改物料分类
     *
     * @param materialCategory 物料分类
     * @return 结果
     */
    public int updateMaterialCategory(MaterialCategory materialCategory);

    /**
     * 删除物料分类
     *
     * @param categoryId 物料分类ID
     * @return 结果
     */
    public int deleteMaterialCategoryById(Long categoryId);

    /**
     * 批量删除物料分类
     *
     * @param categoryIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteMaterialCategoryByIds(Long[] categoryIds);

    /**
     * 是否存在子节点
     *
     * @param categoryId 分类ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean hasChildByCategoryId(Long categoryId);
}
