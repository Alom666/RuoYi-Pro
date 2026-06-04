
package com.ruoyi.scm.mapper;

import java.util.List;
import com.ruoyi.scm.domain.SalesReturn;
import com.ruoyi.scm.domain.SalesReturnDetail;

/**
 * 销售退货Mapper接口
 *
 * @author ruoyi
 */
public interface SalesReturnMapper
{
    public SalesReturn selectSalesReturnById(Long returnId);

    public List<SalesReturn> selectSalesReturnList(SalesReturn salesReturn);

    public int insertSalesReturn(SalesReturn salesReturn);

    public int updateSalesReturn(SalesReturn salesReturn);

    public int deleteSalesReturnById(Long returnId);

    public int deleteSalesReturnByIds(Long[] returnIds);

    public int deleteDetailByReturnId(Long returnId);

    public int batchInsertDetail(List<SalesReturnDetail> detailList);
}
