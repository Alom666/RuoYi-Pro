
package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.QualityStandardMapper;
import com.ruoyi.mes.domain.QualityStandard;
import com.ruoyi.mes.service.IQualityStandardService;

/**
 * 质检标准Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class QualityStandardServiceImpl implements IQualityStandardService
{
    @Autowired
    private QualityStandardMapper qualityStandardMapper;

    /**
     * 查询质检标准
     *
     * @param standardId 质检标准ID
     * @return 质检标准
     */
    @Override
    public QualityStandard selectQualityStandardById(Long standardId)
    {
        return qualityStandardMapper.selectQualityStandardById(standardId);
    }

    /**
     * 查询质检标准列表
     *
     * @param qualityStandard 质检标准
     * @return 质检标准
     */
    @Override
    public List<QualityStandard> selectQualityStandardList(QualityStandard qualityStandard)
    {
        return qualityStandardMapper.selectQualityStandardList(qualityStandard);
    }

    /**
     * 新增质检标准
     *
     * @param qualityStandard 质检标准
     * @return 结果
     */
    @Override
    public int insertQualityStandard(QualityStandard qualityStandard)
    {
        return qualityStandardMapper.insertQualityStandard(qualityStandard);
    }

    /**
     * 修改质检标准
     *
     * @param qualityStandard 质检标准
     * @return 结果
     */
    @Override
    public int updateQualityStandard(QualityStandard qualityStandard)
    {
        return qualityStandardMapper.updateQualityStandard(qualityStandard);
    }

    /**
     * 删除质检标准对象
     *
     * @param standardId 质检标准ID
     * @return 结果
     */
    @Override
    public int deleteQualityStandardById(Long standardId)
    {
        return qualityStandardMapper.deleteQualityStandardById(standardId);
    }

    /**
     * 批量删除质检标准信息
     *
     * @param standardIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteQualityStandardByIds(Long[] standardIds)
    {
        return qualityStandardMapper.deleteQualityStandardByIds(standardIds);
    }
}
