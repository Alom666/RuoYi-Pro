
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.SalesContract;
import com.ruoyi.scm.domain.SalesContractDetail;

/**
 * 销售合同Mapper接口
 *
 * @author ruoyi
 */
public interface SalesContractMapper
{
    public SalesContract selectSalesContractById(Long contractId);

    public List<SalesContract> selectSalesContractList(SalesContract salesContract);

    public int insertSalesContract(SalesContract salesContract);

    public int updateSalesContract(SalesContract salesContract);

    public int deleteSalesContractById(Long contractId);

    public int deleteSalesContractByIds(Long[] contractIds);

    public int deleteDetailByContractId(Long contractId);

    public int batchInsertDetail(List<SalesContractDetail> detailList);
}
