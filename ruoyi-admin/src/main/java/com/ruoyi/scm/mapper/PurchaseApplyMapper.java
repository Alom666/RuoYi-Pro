
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.PurchaseApply;
import com.ruoyi.scm.domain.PurchaseApplyDetail;

/**
 * 采购申请Mapper接口
 *
 * @author ruoyi
 */
public interface PurchaseApplyMapper
{
    public PurchaseApply selectPurchaseApplyById(Long applyId);

    public List<PurchaseApply> selectPurchaseApplyList(PurchaseApply purchaseApply);

    public int insertPurchaseApply(PurchaseApply purchaseApply);

    public int updatePurchaseApply(PurchaseApply purchaseApply);

    public int deletePurchaseApplyById(Long applyId);

    public int deletePurchaseApplyByIds(Long[] applyIds);

    public int deleteDetailByApplyId(Long applyId);

    public int batchInsertDetail(List<PurchaseApplyDetail> detailList);
}
