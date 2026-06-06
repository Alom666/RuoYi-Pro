
package com.ruoyi.wms.service;

import java.util.List;
import com.ruoyi.wms.domain.InventoryCount;

/**
 * 盘点信息Service接口
 *
 * @author ruoyi
 */
public interface IInventoryCountService
{
    /**
     * 查询盘点信息
     *
     * @param countId 盘点信息ID
     * @return 盘点信息
     */
    public InventoryCount selectInventoryCountById(Long countId);

    /**
     * 查询盘点信息列表
     *
     * @param inventoryCount 盘点信息
     * @return 盘点信息集合
     */
    public List<InventoryCount> selectInventoryCountList(InventoryCount inventoryCount);

    /**
     * 新增盘点信息
     *
     * @param inventoryCount 盘点信息
     * @return 结果
     */
    public int insertInventoryCount(InventoryCount inventoryCount);

    /**
     * 修改盘点信息
     *
     * @param inventoryCount 盘点信息
     * @return 结果
     */
    public int updateInventoryCount(InventoryCount inventoryCount);

    /**
     * 删除盘点信息
     *
     * @param countId 盘点信息ID
     * @return 结果
     */
    public int deleteInventoryCountById(Long countId);

    /**
     * 批量删除盘点信息
     *
     * @param countIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteInventoryCountByIds(Long[] countIds);
}
