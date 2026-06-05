
package com.ruoyi.scm.service;

import java.util.List;
import com.ruoyi.scm.domain.PurchaseApply;

/**
 * 采购申请Service接口
 *
 * @author ruoyi
 */
public interface IPurchaseApplyService
{
    public PurchaseApply selectPurchaseApplyById(Long applyId);

    public List<PurchaseApply> selectPurchaseApplyList(PurchaseApply purchaseApply);

    public int insertPurchaseApply(PurchaseApply purchaseApply);

    public int updatePurchaseApply(PurchaseApply purchaseApply);

    public int deletePurchaseApplyByIds(Long[] applyIds);
}
