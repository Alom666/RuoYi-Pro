
package com.ruoyi.mes.service;

import java.util.List;
import com.ruoyi.mes.domain.ProductionSampling;

/**
 * 生产采样Service接口
 *
 * @author ruoyi
 */
public interface IProductionSamplingService
{
    /**
     * 查询生产采样
     *
     * @param samplingId 生产采样ID
     * @return 生产采样
     */
    public ProductionSampling selectProductionSamplingById(Long samplingId);

    /**
     * 查询生产采样列表
     *
     * @param productionSampling 生产采样
     * @return 生产采样集合
     */
    public List<ProductionSampling> selectProductionSamplingList(ProductionSampling productionSampling);

    /**
     * 新增生产采样
     *
     * @param productionSampling 生产采样
     * @return 结果
     */
    public int insertProductionSampling(ProductionSampling productionSampling);

    /**
     * 修改生产采样
     *
     * @param productionSampling 生产采样
     * @return 结果
     */
    public int updateProductionSampling(ProductionSampling productionSampling);

    /**
     * 删除生产采样
     *
     * @param samplingId 生产采样ID
     * @return 结果
     */
    public int deleteProductionSamplingById(Long samplingId);

    /**
     * 批量删除生产采样
     *
     * @param samplingIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteProductionSamplingByIds(Long[] samplingIds);
}
