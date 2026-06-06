
package com.ruoyi.wms.mapper;

import java.util.List;
import com.ruoyi.wms.domain.MaterialCategory;

/**
 * 物料分类Mapper接口
 *
 * @author ruoyi
 */
public interface MaterialCategoryMapper
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
     * @param parentId 父级分类ID
     * @return 结果
     */
    public int hasChildByParentId(Long parentId);
}
