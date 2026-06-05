
package com.ruoyi.scm.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 采购到货主表对象 scm_purchase_arrival
 *
 * @author ruoyi
 */
public class PurchaseArrival extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long arrivalId;

    /** 到货单号 */
    @Excel(name = "到货单号")
    private String arrivalNo;

    /** 合同编号 */
    @Excel(name = "合同编号")
    private String contractNo;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactPerson;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 到货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "到货日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date arrivalDate;

    /** 状态：0未入库,1入库中,2已入库 */
    @Excel(name = "状态", readConverterExp = "0=未入库,1=入库中,2=已入库")
    private String status;

    /** 子表：到货明细 */
    private List<PurchaseArrivalDetail> detailList;

    public Long getArrivalId()
    {
        return arrivalId;
    }

    public void setArrivalId(Long arrivalId)
    {
        this.arrivalId = arrivalId;
    }

    public String getArrivalNo()
    {
        return arrivalNo;
    }

    public void setArrivalNo(String arrivalNo)
    {
        this.arrivalNo = arrivalNo;
    }

    public String getContractNo()
    {
        return contractNo;
    }

    public void setContractNo(String contractNo)
    {
        this.contractNo = contractNo;
    }

    public String getSupplierName()
    {
        return supplierName;
    }

    public void setSupplierName(String supplierName)
    {
        this.supplierName = supplierName;
    }

    public String getContactPerson()
    {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson)
    {
        this.contactPerson = contactPerson;
    }

    public String getContactPhone()
    {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone)
    {
        this.contactPhone = contactPhone;
    }

    public Date getArrivalDate()
    {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate)
    {
        this.arrivalDate = arrivalDate;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public List<PurchaseArrivalDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<PurchaseArrivalDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("arrivalId", getArrivalId())
            .append("arrivalNo", getArrivalNo())
            .append("contractNo", getContractNo())
            .append("supplierName", getSupplierName())
            .append("contactPerson", getContactPerson())
            .append("contactPhone", getContactPhone())
            .append("arrivalDate", getArrivalDate())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
