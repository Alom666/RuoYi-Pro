
package com.ruoyi.scm.service;

import java.util.List;
import com.ruoyi.scm.domain.SalesReturn;

/**
 * 销售退货Service接口
 *
 * @author ruoyi
 */
public interface ISalesReturnService
{
    public SalesReturn selectSalesReturnById(Long returnId);

    public List<SalesReturn> selectSalesReturnList(SalesReturn salesReturn);

    public int insertSalesReturn(SalesReturn salesReturn);

    public int updateSalesReturn(SalesReturn salesReturn);

    public int deleteSalesReturnByIds(Long[] returnIds);
}
