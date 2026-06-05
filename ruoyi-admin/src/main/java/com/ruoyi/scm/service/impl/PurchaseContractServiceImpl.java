
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.PurchaseContractMapper;
import com.ruoyi.scm.domain.PurchaseContract;
import com.ruoyi.scm.domain.PurchaseContractDetail;
import com.ruoyi.scm.service.IPurchaseContractService;

/**
 * 采购合同Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class PurchaseContractServiceImpl implements IPurchaseContractService
{
    @Autowired
    private PurchaseContractMapper purchaseContractMapper;

    @Override
    public PurchaseContract selectPurchaseContractById(Long contractId)
    {
        return purchaseContractMapper.selectPurchaseContractById(contractId);
    }

    @Override
    public List<PurchaseContract> selectPurchaseContractList(PurchaseContract purchaseContract)
    {
        return purchaseContractMapper.selectPurchaseContractList(purchaseContract);
    }

    @Transactional
    @Override
    public int insertPurchaseContract(PurchaseContract purchaseContract)
    {
        int rows = purchaseContractMapper.insertPurchaseContract(purchaseContract);
        insertDetails(purchaseContract);
        return rows;
    }

    @Transactional
    @Override
    public int updatePurchaseContract(PurchaseContract purchaseContract)
    {
        purchaseContractMapper.deleteDetailByContractId(purchaseContract.getContractId());
        insertDetails(purchaseContract);
        return purchaseContractMapper.updatePurchaseContract(purchaseContract);
    }

    @Transactional
    @Override
    public int deletePurchaseContractByIds(Long[] contractIds)
    {
        for (Long contractId : contractIds)
        {
            purchaseContractMapper.deleteDetailByContractId(contractId);
        }
        return purchaseContractMapper.deletePurchaseContractByIds(contractIds);
    }

    private void insertDetails(PurchaseContract purchaseContract)
    {
        List<PurchaseContractDetail> detailList = purchaseContract.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (PurchaseContractDetail detail : detailList)
            {
                detail.setContractId(purchaseContract.getContractId());
            }
            purchaseContractMapper.batchInsertDetail(detailList);
        }
    }
}
