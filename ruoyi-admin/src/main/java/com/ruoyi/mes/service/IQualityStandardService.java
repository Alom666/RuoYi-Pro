
package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.QualityStandard;

/**
 * 质检标准Service接口
 *
 * @author ruoyi
 */
public interface IQualityStandardService
{
    /**
     * 查询质检标准
     *
     * @param standardId 质检标准ID
     * @return 质检标准
     */
    public QualityStandard selectQualityStandardById(Long standardId);

    /**
     * 查询质检标准列表
     *
     * @param qualityStandard 质检标准
     * @return 质检标准集合
     */
    public List<QualityStandard> selectQualityStandardList(QualityStandard qualityStandard);

    /**
     * 新增质检标准
     *
     * @param qualityStandard 质检标准
     * @return 结果
     */
    public int insertQualityStandard(QualityStandard qualityStandard);

    /**
     * 修改质检标准
     *
     * @param qualityStandard 质检标准
     * @return 结果
     */
    public int updateQualityStandard(QualityStandard qualityStandard);

    /**
     * 删除质检标准
     *
     * @param standardId 质检标准ID
     * @return 结果
     */
    public int deleteQualityStandardById(Long standardId);

    /**
     * 批量删除质检标准
     *
     * @param standardIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteQualityStandardByIds(Long[] standardIds);
}
