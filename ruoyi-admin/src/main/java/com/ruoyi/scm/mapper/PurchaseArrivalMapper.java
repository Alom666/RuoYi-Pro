
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.PurchaseArrival;
import com.ruoyi.scm.domain.PurchaseArrivalDetail;

/**
 * 采购到货Mapper接口
 *
 * @author ruoyi
 */
public interface PurchaseArrivalMapper
{
    public PurchaseArrival selectPurchaseArrivalById(Long arrivalId);

    public List<PurchaseArrival> selectPurchaseArrivalList(PurchaseArrival purchaseArrival);

    public int insertPurchaseArrival(PurchaseArrival purchaseArrival);

    public int updatePurchaseArrival(PurchaseArrival purchaseArrival);

    public int deletePurchaseArrivalById(Long arrivalId);

    public int deletePurchaseArrivalByIds(Long[] arrivalIds);

    public int deleteDetailByArrivalId(Long arrivalId);

    public int batchInsertDetail(List<PurchaseArrivalDetail> detailList);
}
