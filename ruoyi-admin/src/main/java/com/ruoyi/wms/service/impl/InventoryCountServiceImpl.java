
package com.ruoyi.wms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.mapper.InventoryCountMapper;
import com.ruoyi.wms.domain.InventoryCount;
import com.ruoyi.wms.service.IInventoryCountService;

/**
 * 盘点信息Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class InventoryCountServiceImpl implements IInventoryCountService
{
    @Autowired
    private InventoryCountMapper inventoryCountMapper;

    /**
     * 查询盘点信息
     *
     * @param countId 盘点信息ID
     * @return 盘点信息
     */
    @Override
    public InventoryCount selectInventoryCountById(Long countId)
    {
        return inventoryCountMapper.selectInventoryCountById(countId);
    }

    /**
     * 查询盘点信息列表
     *
     * @param inventoryCount 盘点信息
     * @return 盘点信息
     */
    @Override
    public List<InventoryCount> selectInventoryCountList(InventoryCount inventoryCount)
    {
        return inventoryCountMapper.selectInventoryCountList(inventoryCount);
    }

    /**
     * 新增盘点信息
     *
     * @param inventoryCount 盘点信息
     * @return 结果
     */
    @Override
    public int insertInventoryCount(InventoryCount inventoryCount)
    {
        return inventoryCountMapper.insertInventoryCount(inventoryCount);
    }

    /**
     * 修改盘点信息
     *
     * @param inventoryCount 盘点信息
     * @return 结果
     */
    @Override
    public int updateInventoryCount(InventoryCount inventoryCount)
    {
        return inventoryCountMapper.updateInventoryCount(inventoryCount);
    }

    /**
     * 删除盘点信息
     *
     * @param countId 盘点信息ID
     * @return 结果
     */
    @Override
    public int deleteInventoryCountById(Long countId)
    {
        return inventoryCountMapper.deleteInventoryCountById(countId);
    }

    /**
     * 批量删除盘点信息
     *
     * @param countIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteInventoryCountByIds(Long[] countIds)
    {
        return inventoryCountMapper.deleteInventoryCountByIds(countIds);
    }
}
