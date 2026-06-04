
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.SalesOrder;
import com.ruoyi.scm.domain.SalesOrderDetail;

/**
 * 销售订单Mapper接口
 *
 * @author ruoyi
 */
public interface SalesOrderMapper
{
    /**
     * 查询销售订单
     *
     * @param orderId 销售订单ID
     * @return 销售订单
     */
    public SalesOrder selectSalesOrderById(Long orderId);

    /**
     * 查询销售订单列表
     *
     * @param salesOrder 销售订单
     * @return 销售订单集合
     */
    public List<SalesOrder> selectSalesOrderList(SalesOrder salesOrder);

    /**
     * 新增销售订单
     *
     * @param salesOrder 销售订单
     * @return 结果
     */
    public int insertSalesOrder(SalesOrder salesOrder);

    /**
     * 修改销售订单
     *
     * @param salesOrder 销售订单
     * @return 结果
     */
    public int updateSalesOrder(SalesOrder salesOrder);

    /**
     * 删除销售订单
     *
     * @param orderId 销售订单ID
     * @return 结果
     */
    public int deleteSalesOrderById(Long orderId);

    /**
     * 批量删除销售订单
     *
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSalesOrderByIds(Long[] orderIds);

    /**
     * 批量删除销售订单明细
     *
     * @param orderId 销售订单ID
     * @return 结果
     */
    public int deleteDetailByOrderId(Long orderId);

    /**
     * 批量新增销售订单明细
     *
     * @param detailList 销售订单明细列表
     * @return 结果
     */
    public int batchInsertDetail(List<SalesOrderDetail> detailList);
}
