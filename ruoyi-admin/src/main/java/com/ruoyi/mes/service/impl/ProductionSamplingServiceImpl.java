
package com.ruoyi.mes.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mes.mapper.ProductionSamplingMapper;
import com.ruoyi.mes.domain.ProductionSampling;
import com.ruoyi.mes.service.IProductionSamplingService;

/**
 * 生产采样Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class ProductionSamplingServiceImpl implements IProductionSamplingService
{
    @Autowired
    private ProductionSamplingMapper productionSamplingMapper;

    /**
     * 查询生产采样
     *
     * @param samplingId 生产采样ID
     * @return 生产采样
     */
    @Override
    public ProductionSampling selectProductionSamplingById(Long samplingId)
    {
        return productionSamplingMapper.selectProductionSamplingById(samplingId);
    }

    /**
     * 查询生产采样列表
     *
     * @param productionSampling 生产采样
     * @return 生产采样
     */
    @Override
    public List<ProductionSampling> selectProductionSamplingList(ProductionSampling productionSampling)
    {
        return productionSamplingMapper.selectProductionSamplingList(productionSampling);
    }

    /**
     * 新增生产采样
     *
     * @param productionSampling 生产采样
     * @return 结果
     */
    @Override
    public int insertProductionSampling(ProductionSampling productionSampling)
    {
        return productionSamplingMapper.insertProductionSampling(productionSampling);
    }

    /**
     * 修改生产采样
     *
     * @param productionSampling 生产采样
     * @return 结果
     */
    @Override
    public int updateProductionSampling(ProductionSampling productionSampling)
    {
        return productionSamplingMapper.updateProductionSampling(productionSampling);
    }

    /**
     * 删除生产采样对象
     *
     * @param samplingId 生产采样ID
     * @return 结果
     */
    @Override
    public int deleteProductionSamplingById(Long samplingId)
    {
        return productionSamplingMapper.deleteProductionSamplingById(samplingId);
    }

    /**
     * 批量删除生产采样信息
     *
     * @param samplingIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteProductionSamplingByIds(Long[] samplingIds)
    {
        return productionSamplingMapper.deleteProductionSamplingByIds(samplingIds);
    }
}
