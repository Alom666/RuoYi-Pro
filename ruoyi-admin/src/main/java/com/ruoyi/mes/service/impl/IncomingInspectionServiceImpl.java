
package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.IncomingInspectionMapper;
import com.ruoyi.mes.domain.IncomingInspection;
import com.ruoyi.mes.service.IIncomingInspectionService;

/**
 * 来料检验Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class IncomingInspectionServiceImpl implements IIncomingInspectionService
{
    @Autowired
    private IncomingInspectionMapper incomingInspectionMapper;

    /**
     * 查询来料检验
     *
     * @param inspectionId 来料检验ID
     * @return 来料检验
     */
    @Override
    public IncomingInspection selectIncomingInspectionById(Long inspectionId)
    {
        return incomingInspectionMapper.selectIncomingInspectionById(inspectionId);
    }

    /**
     * 查询来料检验列表
     *
     * @param incomingInspection 来料检验
     * @return 来料检验
     */
    @Override
    public List<IncomingInspection> selectIncomingInspectionList(IncomingInspection incomingInspection)
    {
        return incomingInspectionMapper.selectIncomingInspectionList(incomingInspection);
    }

    /**
     * 新增来料检验
     *
     * @param incomingInspection 来料检验
     * @return 结果
     */
    @Override
    public int insertIncomingInspection(IncomingInspection incomingInspection)
    {
        return incomingInspectionMapper.insertIncomingInspection(incomingInspection);
    }

    /**
     * 修改来料检验
     *
     * @param incomingInspection 来料检验
     * @return 结果
     */
    @Override
    public int updateIncomingInspection(IncomingInspection incomingInspection)
    {
        return incomingInspectionMapper.updateIncomingInspection(incomingInspection);
    }

    /**
     * 批量删除来料检验信息
     *
     * @param inspectionIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteIncomingInspectionByIds(Long[] inspectionIds)
    {
        return incomingInspectionMapper.deleteIncomingInspectionByIds(inspectionIds);
    }
}
