
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.SalesOrderMapper;
import com.ruoyi.scm.domain.SalesOrder;
import com.ruoyi.scm.domain.SalesOrderDetail;
import com.ruoyi.scm.service.ISalesOrderService;

/**
 * 销售订单Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class SalesOrderServiceImpl implements ISalesOrderService
{
    @Autowired
    private SalesOrderMapper salesOrderMapper;

    @Override
    public SalesOrder selectSalesOrderById(Long orderId)
    {
        return salesOrderMapper.selectSalesOrderById(orderId);
    }

    @Override
    public List<SalesOrder> selectSalesOrderList(SalesOrder salesOrder)
    {
        return salesOrderMapper.selectSalesOrderList(salesOrder);
    }

    @Transactional
    @Override
    public int insertSalesOrder(SalesOrder salesOrder)
    {
        int rows = salesOrderMapper.insertSalesOrder(salesOrder);
        insertDetails(salesOrder);
        return rows;
    }

    @Transactional
    @Override
    public int updateSalesOrder(SalesOrder salesOrder)
    {
        salesOrderMapper.deleteDetailByOrderId(salesOrder.getOrderId());
        insertDetails(salesOrder);
        return salesOrderMapper.updateSalesOrder(salesOrder);
    }

    @Transactional
    @Override
    public int deleteSalesOrderByIds(Long[] orderIds)
    {
        for (Long orderId : orderIds)
        {
            salesOrderMapper.deleteDetailByOrderId(orderId);
        }
        return salesOrderMapper.deleteSalesOrderByIds(orderIds);
    }

    private void insertDetails(SalesOrder salesOrder)
    {
        List<SalesOrderDetail> detailList = salesOrder.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (SalesOrderDetail detail : detailList)
            {
                detail.setOrderId(salesOrder.getOrderId());
            }
            salesOrderMapper.batchInsertDetail(detailList);
        }
    }
}
