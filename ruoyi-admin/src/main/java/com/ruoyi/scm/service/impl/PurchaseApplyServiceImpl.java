
package com.ruoyi.scm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.scm.mapper.PurchaseApplyMapper;
import com.ruoyi.scm.domain.PurchaseApply;
import com.ruoyi.scm.domain.PurchaseApplyDetail;
import com.ruoyi.scm.service.IPurchaseApplyService;

/**
 * 采购申请Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class PurchaseApplyServiceImpl implements IPurchaseApplyService
{
    @Autowired
    private PurchaseApplyMapper purchaseApplyMapper;

    @Override
    public PurchaseApply selectPurchaseApplyById(Long applyId)
    {
        return purchaseApplyMapper.selectPurchaseApplyById(applyId);
    }

    @Override
    public List<PurchaseApply> selectPurchaseApplyList(PurchaseApply purchaseApply)
    {
        return purchaseApplyMapper.selectPurchaseApplyList(purchaseApply);
    }

    @Transactional
    @Override
    public int insertPurchaseApply(PurchaseApply purchaseApply)
    {
        int rows = purchaseApplyMapper.insertPurchaseApply(purchaseApply);
        insertDetails(purchaseApply);
        return rows;
    }

    @Transactional
    @Override
    public int updatePurchaseApply(PurchaseApply purchaseApply)
    {
        purchaseApplyMapper.deleteDetailByApplyId(purchaseApply.getApplyId());
        insertDetails(purchaseApply);
        return purchaseApplyMapper.updatePurchaseApply(purchaseApply);
    }

    @Transactional
    @Override
    public int deletePurchaseApplyByIds(Long[] applyIds)
    {
        for (Long applyId : applyIds)
        {
            purchaseApplyMapper.deleteDetailByApplyId(applyId);
        }
        return purchaseApplyMapper.deletePurchaseApplyByIds(applyIds);
    }

    private void insertDetails(PurchaseApply purchaseApply)
    {
        List<PurchaseApplyDetail> detailList = purchaseApply.getDetailList();
        if (detailList != null && !detailList.isEmpty())
        {
            for (PurchaseApplyDetail detail : detailList)
            {
                detail.setApplyId(purchaseApply.getApplyId());
            }
            purchaseApplyMapper.batchInsertDetail(detailList);
        }
    }
}
