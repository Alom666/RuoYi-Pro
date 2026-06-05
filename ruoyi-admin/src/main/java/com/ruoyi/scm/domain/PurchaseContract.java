
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
 * 采购合同主表对象 scm_purchase_contract
 *
 * @author ruoyi
 */
public class PurchaseContract extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long contractId;

    /** 合同编号 */
    @Excel(name = "合同编号")
    private String contractNo;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderNo;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactPerson;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 合同金额 */
    @Excel(name = "合同金额")
    private BigDecimal totalAmount;

    /** 交货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "交货日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deliveryDate;

    /** 送货方式：0快递,1物流 */
    @Excel(name = "送货方式", readConverterExp = "0=快递,1=物流")
    private String deliveryMethod;

    /** 收货地址 */
    @Excel(name = "收货地址")
    private String deliveryAddress;

    /** 签订日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "签订日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date signDate;

    /** 申请人 */
    @Excel(name = "申请人")
    private String applicant;

    /** 申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date applyDate;

    /** 申请状态：0未提交,1待审核,2已审核 */
    @Excel(name = "申请状态", readConverterExp = "0=未提交,1=待审核,2=已审核")
    private String applyStatus;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditor;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date auditDate;

    /** 审核状态：0通过,1驳回 */
    @Excel(name = "审核状态", readConverterExp = "0=通过,1=驳回")
    private String auditStatus;

    /** 子表：合同明细 */
    private List<PurchaseContractDetail> detailList;

    public Long getContractId()
    {
        return contractId;
    }

    public void setContractId(Long contractId)
    {
        this.contractId = contractId;
    }

    public String getContractNo()
    {
        return contractNo;
    }

    public void setContractNo(String contractNo)
    {
        this.contractNo = contractNo;
    }

    public String getOrderNo()
    {
        return orderNo;
    }

    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
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

    public BigDecimal getTotalAmount()
    {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount)
    {
        this.totalAmount = totalAmount;
    }

    public Date getDeliveryDate()
    {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate)
    {
        this.deliveryDate = deliveryDate;
    }

    public String getDeliveryMethod()
    {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod)
    {
        this.deliveryMethod = deliveryMethod;
    }

    public String getDeliveryAddress()
    {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress)
    {
        this.deliveryAddress = deliveryAddress;
    }

    public Date getSignDate()
    {
        return signDate;
    }

    public void setSignDate(Date signDate)
    {
        this.signDate = signDate;
    }

    public String getApplicant()
    {
        return applicant;
    }

    public void setApplicant(String applicant)
    {
        this.applicant = applicant;
    }

    public Date getApplyDate()
    {
        return applyDate;
    }

    public void setApplyDate(Date applyDate)
    {
        this.applyDate = applyDate;
    }

    public String getApplyStatus()
    {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus)
    {
        this.applyStatus = applyStatus;
    }

    public String getAuditor()
    {
        return auditor;
    }

    public void setAuditor(String auditor)
    {
        this.auditor = auditor;
    }

    public Date getAuditDate()
    {
        return auditDate;
    }

    public void setAuditDate(Date auditDate)
    {
        this.auditDate = auditDate;
    }

    public String getAuditStatus()
    {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus)
    {
        this.auditStatus = auditStatus;
    }

    public List<PurchaseContractDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<PurchaseContractDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("contractId", getContractId())
            .append("contractNo", getContractNo())
            .append("orderNo", getOrderNo())
            .append("supplierName", getSupplierName())
            .append("contactPerson", getContactPerson())
            .append("contactPhone", getContactPhone())
            .append("totalAmount", getTotalAmount())
            .append("deliveryDate", getDeliveryDate())
            .append("deliveryMethod", getDeliveryMethod())
            .append("deliveryAddress", getDeliveryAddress())
            .append("signDate", getSignDate())
            .append("applicant", getApplicant())
            .append("applyDate", getApplyDate())
            .append("applyStatus", getApplyStatus())
            .append("auditor", getAuditor())
            .append("auditDate", getAuditDate())
            .append("auditStatus", getAuditStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
