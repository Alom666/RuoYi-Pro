
package com.ruoyi.scm.service;

import java.util.List;
import com.ruoyi.scm.domain.SalesOrder;

/**
 * 销售订单Service接口
 *
 * @author ruoyi
 */
public interface ISalesOrderService
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
     * 批量删除销售订单
     *
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSalesOrderByIds(Long[] orderIds);
}
