
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.SalesContractMapper;
import com.ruoyi.scm.domain.SalesContract;
import com.ruoyi.scm.domain.SalesContractDetail;
import com.ruoyi.scm.service.ISalesContractService;

/**
 * 销售合同Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class SalesContractServiceImpl implements ISalesContractService
{
    @Autowired
    private SalesContractMapper salesContractMapper;

    @Override
    public SalesContract selectSalesContractById(Long contractId)
    {
        return salesContractMapper.selectSalesContractById(contractId);
    }

    @Override
    public List<SalesContract> selectSalesContractList(SalesContract salesContract)
    {
        return salesContractMapper.selectSalesContractList(salesContract);
    }

    @Transactional
    @Override
    public int insertSalesContract(SalesContract salesContract)
    {
        int rows = salesContractMapper.insertSalesContract(salesContract);
        insertDetails(salesContract);
        return rows;
    }

    @Transactional
    @Override
    public int updateSalesContract(SalesContract salesContract)
    {
        salesContractMapper.deleteDetailByContractId(salesContract.getContractId());
        insertDetails(salesContract);
        return salesContractMapper.updateSalesContract(salesContract);
    }

    @Transactional
    @Override
    public int deleteSalesContractByIds(Long[] contractIds)
    {
        for (Long contractId : contractIds)
        {
            salesContractMapper.deleteDetailByContractId(contractId);
        }
        return salesContractMapper.deleteSalesContractByIds(contractIds);
    }

    private void insertDetails(SalesContract salesContract)
    {
        List<SalesContractDetail> detailList = salesContract.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (SalesContractDetail detail : detailList)
            {
                detail.setContractId(salesContract.getContractId());
            }
            salesContractMapper.batchInsertDetail(detailList);
        }
    }
}
