
package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.MaterialApply;

/**
 * 领料申请Service接口
 *
 * @author ruoyi
 */
public interface IMaterialApplyService
{
    /**
     * 查询领料申请
     *
     * @param applyId 领料申请ID
     * @return 领料申请
     */
    public MaterialApply selectMaterialApplyById(Long applyId);

    /**
     * 查询领料申请列表
     *
     * @param materialApply 领料申请
     * @return 领料申请集合
     */
    public List<MaterialApply> selectMaterialApplyList(MaterialApply materialApply);

    /**
     * 新增领料申请
     *
     * @param materialApply 领料申请
     * @return 结果
     */
    public int insertMaterialApply(MaterialApply materialApply);

    /**
     * 修改领料申请
     *
     * @param materialApply 领料申请
     * @return 结果
     */
    public int updateMaterialApply(MaterialApply materialApply);

    /**
     * 删除领料申请
     *
     * @param applyId 领料申请ID
     * @return 结果
     */
    public int deleteMaterialApplyById(Long applyId);

    /**
     * 批量删除领料申请
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteMaterialApplyByIds(Long[] applyIds);
}
