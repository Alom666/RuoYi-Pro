
package com.ruoyi.wms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wms.mapper.WarehouseMapper;
import com.ruoyi.wms.domain.Warehouse;
import com.ruoyi.wms.service.IWarehouseService;

/**
 * 仓库信息Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class WarehouseServiceImpl implements IWarehouseService
{
    @Autowired
    private WarehouseMapper warehouseMapper;

    /**
     * 查询仓库信息
     *
     * @param warehouseId 仓库ID
     * @return 仓库信息
     */
    @Override
    public Warehouse selectWarehouseById(Long warehouseId)
    {
        return warehouseMapper.selectWarehouseById(warehouseId);
    }

    /**
     * 查询仓库信息列表
     *
     * @param warehouse 仓库信息
     * @return 仓库信息
     */
    @Override
    public List<Warehouse> selectWarehouseList(Warehouse warehouse)
    {
        return warehouseMapper.selectWarehouseList(warehouse);
    }

    /**
     * 新增仓库信息
     *
     * @param warehouse 仓库信息
     * @return 结果
     */
    @Override
    public int insertWarehouse(Warehouse warehouse)
    {
        return warehouseMapper.insertWarehouse(warehouse);
    }

    /**
     * 修改仓库信息
     *
     * @param warehouse 仓库信息
     * @return 结果
     */
    @Override
    public int updateWarehouse(Warehouse warehouse)
    {
        return warehouseMapper.updateWarehouse(warehouse);
    }

    /**
     * 删除仓库信息
     *
     * @param warehouseId 仓库ID
     * @return 结果
     */
    @Override
    public int deleteWarehouseById(Long warehouseId)
    {
        return warehouseMapper.deleteWarehouseById(warehouseId);
    }

    /**
     * 批量删除仓库信息
     *
     * @param warehouseIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteWarehouseByIds(Long[] warehouseIds)
    {
        return warehouseMapper.deleteWarehouseByIds(warehouseIds);
    }
}
