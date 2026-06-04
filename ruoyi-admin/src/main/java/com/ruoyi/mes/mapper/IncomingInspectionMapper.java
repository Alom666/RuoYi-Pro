
package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.IncomingInspection;

/**
 * 来料检验Mapper接口
 *
 * @author ruoyi
 */
public interface IncomingInspectionMapper
{
    /**
     * 查询来料检验
     *
     * @param inspectionId 来料检验ID
     * @return 来料检验
     */
    public IncomingInspection selectIncomingInspectionById(Long inspectionId);

    /**
     * 查询来料检验列表
     *
     * @param incomingInspection 来料检验
     * @return 来料检验集合
     */
    public List<IncomingInspection> selectIncomingInspectionList(IncomingInspection incomingInspection);

    /**
     * 新增来料检验
     *
     * @param incomingInspection 来料检验
     * @return 结果
     */
    public int insertIncomingInspection(IncomingInspection incomingInspection);

    /**
     * 修改来料检验
     *
     * @param incomingInspection 来料检验
     * @return 结果
     */
    public int updateIncomingInspection(IncomingInspection incomingInspection);

    /**
     * 批量删除来料检验
     *
     * @param inspectionIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteIncomingInspectionByIds(Long[] inspectionIds);
}
