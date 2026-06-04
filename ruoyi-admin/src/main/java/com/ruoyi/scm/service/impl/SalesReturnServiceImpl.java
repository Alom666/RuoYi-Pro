
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.SalesReturnMapper;
import com.ruoyi.scm.domain.SalesReturn;
import com.ruoyi.scm.domain.SalesReturnDetail;
import com.ruoyi.scm.service.ISalesReturnService;

/**
 * 销售退货Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class SalesReturnServiceImpl implements ISalesReturnService
{
    @Autowired
    private SalesReturnMapper salesReturnMapper;

    @Override
    public SalesReturn selectSalesReturnById(Long returnId)
    {
        return salesReturnMapper.selectSalesReturnById(returnId);
    }

    @Override
    public List<SalesReturn> selectSalesReturnList(SalesReturn salesReturn)
    {
        return salesReturnMapper.selectSalesReturnList(salesReturn);
    }

    @Transactional
    @Override
    public int insertSalesReturn(SalesReturn salesReturn)
    {
        int rows = salesReturnMapper.insertSalesReturn(salesReturn);
        insertDetails(salesReturn);
        return rows;
    }

    @Transactional
    @Override
    public int updateSalesReturn(SalesReturn salesReturn)
    {
        salesReturnMapper.deleteDetailByReturnId(salesReturn.getReturnId());
        insertDetails(salesReturn);
        return salesReturnMapper.updateSalesReturn(salesReturn);
    }

    @Transactional
    @Override
    public int deleteSalesReturnByIds(Long[] returnIds)
    {
        for (Long returnId : returnIds)
        {
            salesReturnMapper.deleteDetailByReturnId(returnId);
        }
        return salesReturnMapper.deleteSalesReturnByIds(returnIds);
    }

    private void insertDetails(SalesReturn salesReturn)
    {
        List<SalesReturnDetail> detailList = salesReturn.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (SalesReturnDetail detail : detailList)
            {
                detail.setReturnId(salesReturn.getReturnId());
            }
            salesReturnMapper.batchInsertDetail(detailList);
        }
    }
}
