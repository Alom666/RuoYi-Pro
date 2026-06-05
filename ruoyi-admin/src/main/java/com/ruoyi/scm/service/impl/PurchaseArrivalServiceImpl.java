
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.PurchaseArrivalMapper;
import com.ruoyi.scm.domain.PurchaseArrival;
import com.ruoyi.scm.domain.PurchaseArrivalDetail;
import com.ruoyi.scm.service.IPurchaseArrivalService;

/**
 * 采购到货Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class PurchaseArrivalServiceImpl implements IPurchaseArrivalService
{
    @Autowired
    private PurchaseArrivalMapper purchaseArrivalMapper;

    @Override
    public PurchaseArrival selectPurchaseArrivalById(Long arrivalId)
    {
        return purchaseArrivalMapper.selectPurchaseArrivalById(arrivalId);
    }

    @Override
    public List<PurchaseArrival> selectPurchaseArrivalList(PurchaseArrival purchaseArrival)
    {
        return purchaseArrivalMapper.selectPurchaseArrivalList(purchaseArrival);
    }

    @Transactional
    @Override
    public int insertPurchaseArrival(PurchaseArrival purchaseArrival)
    {
        int rows = purchaseArrivalMapper.insertPurchaseArrival(purchaseArrival);
        insertDetails(purchaseArrival);
        return rows;
    }

    @Transactional
    @Override
    public int updatePurchaseArrival(PurchaseArrival purchaseArrival)
    {
        purchaseArrivalMapper.deleteDetailByArrivalId(purchaseArrival.getArrivalId());
        insertDetails(purchaseArrival);
        return purchaseArrivalMapper.updatePurchaseArrival(purchaseArrival);
    }

    @Transactional
    @Override
    public int deletePurchaseArrivalByIds(Long[] arrivalIds)
    {
        for (Long arrivalId : arrivalIds)
        {
            purchaseArrivalMapper.deleteDetailByArrivalId(arrivalId);
        }
        return purchaseArrivalMapper.deletePurchaseArrivalByIds(arrivalIds);
    }

    private void insertDetails(PurchaseArrival purchaseArrival)
    {
        List<PurchaseArrivalDetail> detailList = purchaseArrival.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (PurchaseArrivalDetail detail : detailList)
            {
                detail.setArrivalId(purchaseArrival.getArrivalId());
            }
            purchaseArrivalMapper.batchInsertDetail(detailList);
        }
    }
}
