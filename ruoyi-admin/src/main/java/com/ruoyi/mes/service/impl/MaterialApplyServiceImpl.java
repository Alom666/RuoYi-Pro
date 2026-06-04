
package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.mes.mapper.MaterialApplyMapper;
import com.ruoyi.mes.domain.MaterialApply;
import com.ruoyi.mes.domain.MaterialApplyDetail;
import com.ruoyi.mes.service.IMaterialApplyService;

/**
 * 领料申请Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class MaterialApplyServiceImpl implements IMaterialApplyService
{
    @Autowired
    private MaterialApplyMapper materialApplyMapper;

    /**
     * 查询领料申请
     *
     * @param applyId 领料申请ID
     * @return 领料申请
     */
    @Override
    public MaterialApply selectMaterialApplyById(Long applyId)
    {
        return materialApplyMapper.selectMaterialApplyById(applyId);
    }

    /**
     * 查询领料申请列表
     *
     * @param materialApply 领料申请
     * @return 领料申请
     */
    @Override
    public List<MaterialApply> selectMaterialApplyList(MaterialApply materialApply)
    {
        return materialApplyMapper.selectMaterialApplyList(materialApply);
    }

    /**
     * 新增领料申请
     *
     * @param materialApply 领料申请
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMaterialApply(MaterialApply materialApply)
    {
        int rows = materialApplyMapper.insertMaterialApply(materialApply);
        insertDetails(materialApply);
        return rows;
    }

    /**
     * 修改领料申请
     *
     * @param materialApply 领料申请
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMaterialApply(MaterialApply materialApply)
    {
        // 只有当detailList不为空时才更新明细（编辑操作会传detailList，审核操作不会）
        if (materialApply.getDetailList() != null)
        {
            // 先删除旧明细
            materialApplyMapper.deleteDetailByApplyId(materialApply.getApplyId());
            // 再插入新明细
            insertDetails(materialApply);
        }
        return materialApplyMapper.updateMaterialApply(materialApply);
    }

    /**
     * 删除领料申请对象
     *
     * @param applyId 领料申请ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMaterialApplyById(Long applyId)
    {
        materialApplyMapper.deleteDetailByApplyId(applyId);
        return materialApplyMapper.deleteMaterialApplyById(applyId);
    }

    /**
     * 批量删除领料申请信息
     *
     * @param applyIds 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMaterialApplyByIds(Long[] applyIds)
    {
        for (Long applyId : applyIds)
        {
            materialApplyMapper.deleteDetailByApplyId(applyId);
        }
        return materialApplyMapper.deleteMaterialApplyByIds(applyIds);
    }

    /**
     * 批量插入领料申请明细
     *
     * @param materialApply 领料申请
     */
    private void insertDetails(MaterialApply materialApply)
    {
        List<MaterialApplyDetail> detailList = materialApply.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (MaterialApplyDetail detail : detailList)
            {
                detail.setApplyId(materialApply.getApplyId());
            }
            materialApplyMapper.batchInsertDetail(detailList);
        }
    }
}
