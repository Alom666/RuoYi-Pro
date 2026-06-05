
package com.ruoyi.scm.service;

import java.util.List;
import com.ruoyi.scm.domain.PurchaseContract;

/**
 * 采购合同Service接口
 *
 * @author ruoyi
 */
public interface IPurchaseContractService
{
    public PurchaseContract selectPurchaseContractById(Long contractId);

    public List<PurchaseContract> selectPurchaseContractList(PurchaseContract purchaseContract);

    public int insertPurchaseContract(PurchaseContract purchaseContract);

    public int updatePurchaseContract(PurchaseContract purchaseContract);

    public int deletePurchaseContractByIds(Long[] contractIds);
}
