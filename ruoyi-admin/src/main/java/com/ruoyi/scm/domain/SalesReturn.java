
package com.ruoyi.scm.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 销售退货主表对象 scm_sales_return
 *
 * @author ruoyi
 */
public class SalesReturn extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long returnId;

    /** 退货单号 */
    @Excel(name = "退货单号")
    private String returnNo;

    /** 发货单号 */
    @Excel(name = "发货单号")
    private String deliveryNo;

    /** 合同编号 */
    @Excel(name = "合同编号")
    private String contractNo;

    /** 客户名称 */
    @Excel(name = "客户名称")
    private String customerName;

    /** 退货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "退货日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date returnDate;

    /** 退款金额 */
    @Excel(name = "退款金额")
    private BigDecimal refundAmount;

    /** 入库状态：0未入库,1入库中,2已入库 */
    @Excel(name = "入库状态", readConverterExp = "0=未入库,1=入库中,2=已入库")
    private String inboundStatus;

    /** 退货原因 */
    @Excel(name = "退货原因")
    private String returnReason;

    /** 送货方式 */
    private String deliveryMethod;

    /** 交货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date deliveryDate;

    /** 收货地址 */
    private String deliveryAddress;

    /** 联系人 */
    private String contactPerson;

    /** 联系电话 */
    private String contactPhone;

    /** 子表：退货明细 */
    private List<SalesReturnDetail> detailList;

    public Long getReturnId()
    {
        return returnId;
    }

    public void setReturnId(Long returnId)
    {
        this.returnId = returnId;
    }

    public String getReturnNo()
    {
        return returnNo;
    }

    public void setReturnNo(String returnNo)
    {
        this.returnNo = returnNo;
    }

    public String getDeliveryNo()
    {
        return deliveryNo;
    }

    public void setDeliveryNo(String deliveryNo)
    {
        this.deliveryNo = deliveryNo;
    }

    public String getContractNo()
    {
        return contractNo;
    }

    public void setContractNo(String contractNo)
    {
        this.contractNo = contractNo;
    }

    public String getCustomerName()
    {
        return customerName;
    }

    public void setCustomerName(String customerName)
    {
        this.customerName = customerName;
    }

    public Date getReturnDate()
    {
        return returnDate;
    }

    public void setReturnDate(Date returnDate)
    {
        this.returnDate = returnDate;
    }

    public BigDecimal getRefundAmount()
    {
        return refundAmount;
    }

    public void setRefundAmount(BigDecimal refundAmount)
    {
        this.refundAmount = refundAmount;
    }

    public String getInboundStatus()
    {
        return inboundStatus;
    }

    public void setInboundStatus(String inboundStatus)
    {
        this.inboundStatus = inboundStatus;
    }

    public String getReturnReason()
    {
        return returnReason;
    }

    public void setReturnReason(String returnReason)
    {
        this.returnReason = returnReason;
    }

    public String getDeliveryMethod()
    {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod)
    {
        this.deliveryMethod = deliveryMethod;
    }

    public Date getDeliveryDate()
    {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate)
    {
        this.deliveryDate = deliveryDate;
    }

    public String getDeliveryAddress()
    {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress)
    {
        this.deliveryAddress = deliveryAddress;
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

    public List<SalesReturnDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<SalesReturnDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("returnId", getReturnId())
            .append("returnNo", getReturnNo())
            .append("deliveryNo", getDeliveryNo())
            .append("contractNo", getContractNo())
            .append("customerName", getCustomerName())
            .append("returnDate", getReturnDate())
            .append("refundAmount", getRefundAmount())
            .append("inboundStatus", getInboundStatus())
            .append("returnReason", getReturnReason())
            .append("deliveryMethod", getDeliveryMethod())
            .append("deliveryDate", getDeliveryDate())
            .append("deliveryAddress", getDeliveryAddress())
            .append("contactPerson", getContactPerson())
            .append("contactPhone", getContactPhone())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
