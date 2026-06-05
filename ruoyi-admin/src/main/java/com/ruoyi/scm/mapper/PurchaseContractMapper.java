
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.PurchaseContract;
import com.ruoyi.scm.domain.PurchaseContractDetail;

/**
 * 采购合同Mapper接口
 *
 * @author ruoyi
 */
public interface PurchaseContractMapper
{
    public PurchaseContract selectPurchaseContractById(Long contractId);

    public List<PurchaseContract> selectPurchaseContractList(PurchaseContract purchaseContract);

    public int insertPurchaseContract(PurchaseContract purchaseContract);

    public int updatePurchaseContract(PurchaseContract purchaseContract);

    public int deletePurchaseContractById(Long contractId);

    public int deletePurchaseContractByIds(Long[] contractIds);

    public int deleteDetailByContractId(Long contractId);

    public int batchInsertDetail(List<PurchaseContractDetail> detailList);
}
