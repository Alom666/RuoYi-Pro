
package com.ruoyi.wms.service;

import java.util.List;
import com.ruoyi.wms.domain.Warehouse;

/**
 * 仓库信息Service接口
 *
 * @author ruoyi
 */
public interface IWarehouseService
{
    /**
     * 查询仓库信息
     *
     * @param warehouseId 仓库ID
     * @return 仓库信息
     */
    public Warehouse selectWarehouseById(Long warehouseId);

    /**
     * 查询仓库信息列表
     *
     * @param warehouse 仓库信息
     * @return 仓库信息集合
     */
    public List<Warehouse> selectWarehouseList(Warehouse warehouse);

    /**
     * 新增仓库信息
     *
     * @param warehouse 仓库信息
     * @return 结果
     */
    public int insertWarehouse(Warehouse warehouse);

    /**
     * 修改仓库信息
     *
     * @param warehouse 仓库信息
     * @return 结果
     */
    public int updateWarehouse(Warehouse warehouse);

    /**
     * 删除仓库信息
     *
     * @param warehouseId 仓库ID
     * @return 结果
     */
    public int deleteWarehouseById(Long warehouseId);

    /**
     * 批量删除仓库信息
     *
     * @param warehouseIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteWarehouseByIds(Long[] warehouseIds);
}
