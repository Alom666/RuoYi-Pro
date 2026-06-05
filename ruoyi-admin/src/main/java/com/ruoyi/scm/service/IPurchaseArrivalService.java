
package com.ruoyi.scm.service;

import java.util.List;
import com.ruoyi.scm.domain.PurchaseArrival;

/**
 * 采购到货Service接口
 *
 * @author ruoyi
 */
public interface IPurchaseArrivalService
{
    public PurchaseArrival selectPurchaseArrivalById(Long arrivalId);

    public List<PurchaseArrival> selectPurchaseArrivalList(PurchaseArrival purchaseArrival);

    public int insertPurchaseArrival(PurchaseArrival purchaseArrival);

    public int updatePurchaseArrival(PurchaseArrival purchaseArrival);

    public int deletePurchaseArrivalByIds(Long[] arrivalIds);
}
