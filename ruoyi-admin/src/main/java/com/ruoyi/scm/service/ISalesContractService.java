
package com.ruoyi.scm.service;

import java.util.List;
import com.ruoyi.scm.domain.SalesContract;

/**
 * 销售合同Service接口
 *
 * @author ruoyi
 */
public interface ISalesContractService
{
    public SalesContract selectSalesContractById(Long contractId);

    public List<SalesContract> selectSalesContractList(SalesContract salesContract);

    public int insertSalesContract(SalesContract salesContract);

    public int updateSalesContract(SalesContract salesContract);

    public int deleteSalesContractByIds(Long[] contractIds);
}
