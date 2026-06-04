
package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.HomeworkAssemblyMapper;
import com.ruoyi.mes.domain.HomeworkAssembly;
import com.ruoyi.mes.service.IHomeworkAssemblyService;

/**
 * 作业装配Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class HomeworkAssemblyServiceImpl implements IHomeworkAssemblyService
{
    @Autowired
    private HomeworkAssemblyMapper homeworkAssemblyMapper;

    /**
     * 查询作业装配
     *
     * @param assemblyId 作业装配ID
     * @return 作业装配
     */
    @Override
    public HomeworkAssembly selectHomeworkAssemblyById(Long assemblyId)
    {
        return homeworkAssemblyMapper.selectHomeworkAssemblyById(assemblyId);
    }

    /**
     * 查询作业装配列表
     *
     * @param homeworkAssembly 作业装配
     * @return 作业装配
     */
    @Override
    public List<HomeworkAssembly> selectHomeworkAssemblyList(HomeworkAssembly homeworkAssembly)
    {
        return homeworkAssemblyMapper.selectHomeworkAssemblyList(homeworkAssembly);
    }

    /**
     * 新增作业装配
     *
     * @param homeworkAssembly 作业装配
     * @return 结果
     */
    @Override
    public int insertHomeworkAssembly(HomeworkAssembly homeworkAssembly)
    {
        return homeworkAssemblyMapper.insertHomeworkAssembly(homeworkAssembly);
    }

    /**
     * 修改作业装配
     *
     * @param homeworkAssembly 作业装配
     * @return 结果
     */
    @Override
    public int updateHomeworkAssembly(HomeworkAssembly homeworkAssembly)
    {
        return homeworkAssemblyMapper.updateHomeworkAssembly(homeworkAssembly);
    }

    /**
     * 删除作业装配对象
     *
     * @param assemblyId 作业装配ID
     * @return 结果
     */
    @Override
    public int deleteHomeworkAssemblyById(Long assemblyId)
    {
        return homeworkAssemblyMapper.deleteHomeworkAssemblyById(assemblyId);
    }

    /**
     * 批量删除作业装配信息
     *
     * @param assemblyIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteHomeworkAssemblyByIds(Long[] assemblyIds)
    {
        return homeworkAssemblyMapper.deleteHomeworkAssemblyByIds(assemblyIds);
    }
}
