
package com.ruoyi.mes.mapper;

import java.util.List;
import com.ruoyi.mes.domain.HomeworkAssembly;

/**
 * 作业装配Mapper接口
 *
 * @author ruoyi
 */
public interface HomeworkAssemblyMapper
{
    /**
     * 查询作业装配
     *
     * @param assemblyId 作业装配ID
     * @return 作业装配
     */
    public HomeworkAssembly selectHomeworkAssemblyById(Long assemblyId);

    /**
     * 查询作业装配列表
     *
     * @param homeworkAssembly 作业装配
     * @return 作业装配集合
     */
    public List<HomeworkAssembly> selectHomeworkAssemblyList(HomeworkAssembly homeworkAssembly);

    /**
     * 新增作业装配
     *
     * @param homeworkAssembly 作业装配
     * @return 结果
     */
    public int insertHomeworkAssembly(HomeworkAssembly homeworkAssembly);

    /**
     * 修改作业装配
     *
     * @param homeworkAssembly 作业装配
     * @return 结果
     */
    public int updateHomeworkAssembly(HomeworkAssembly homeworkAssembly);

    /**
     * 删除作业装配
     *
     * @param assemblyId 作业装配ID
     * @return 结果
     */
    public int deleteHomeworkAssemblyById(Long assemblyId);

    /**
     * 批量删除作业装配
     *
     * @param assemblyIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteHomeworkAssemblyByIds(Long[] assemblyIds);
}
