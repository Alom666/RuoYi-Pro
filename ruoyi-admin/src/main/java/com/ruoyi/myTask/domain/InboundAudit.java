package com.ruoyi.myTask.domain;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 我的任务-入库申请审核对象 myTask_inbound_audit
 *
 * @author ruoyi
 */
public class InboundAudit extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 审核ID（编号） */
    private Integer auditId;

    /** 申请单号 */
    @Excel(name = "申请单号")
    private String applyNo;

    /** 关联单据号 */
    @Excel(name = "关联单据号")
    private String relatedNo;

    /** 业务类型：0生产入库、1采购入库、2退货入库 */
    @Excel(name = "业务类型", readConverterExp = "0=生产入库,1=采购入库,2=退货入库")
    private String businessType;

    /** 供应商 */
    @Excel(name = "供应商")
    private String supplierName;

    /** 合同号 */
    @Excel(name = "合同号")
    private String contractNo;

    /** 合同类型：0采购合同、1销售合同 */
    @Excel(name = "合同类型", readConverterExp = "0=采购合同,1=销售合同")
    private String contractType;

    /** 申请类型 */
    @Excel(name = "申请类型")
    private String applyType;

    /** 申请人 */
    @Excel(name = "申请人")
    private String applicant;

    /** 申请日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "申请日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date applyDate;

    /** 申请状态：0未提交、1待审核、2已审核 */
    @Excel(name = "申请状态", readConverterExp = "0=未提交,1=待审核,2=已审核")
    private String applyStatus;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditor;

    /** 审核日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date auditDate;

    /** 审核状态：0通过、1驳回 */
    @Excel(name = "审核状态", readConverterExp = "0=通过,1=驳回")
    private String auditStatus;

    /** 审核意见 */
    @Excel(name = "审核意见")
    private String auditOpinion;

    public Integer getAuditId()
    {
        return auditId;
    }

    public void setAuditId(Integer auditId)
    {
        this.auditId = auditId;
    }

    public String getApplyNo()
    {
        return applyNo;
    }

    public void setApplyNo(String applyNo)
    {
        this.applyNo = applyNo;
    }

    public String getRelatedNo()
    {
        return relatedNo;
    }

    public void setRelatedNo(String relatedNo)
    {
        this.relatedNo = relatedNo;
    }

    public String getBusinessType()
    {
        return businessType;
    }

    public void setBusinessType(String businessType)
    {
        this.businessType = businessType;
    }

    public String getSupplierName()
    {
        return supplierName;
    }

    public void setSupplierName(String supplierName)
    {
        this.supplierName = supplierName;
    }

    public String getContractNo()
    {
        return contractNo;
    }

    public void setContractNo(String contractNo)
    {
        this.contractNo = contractNo;
    }

    public String getContractType()
    {
        return contractType;
    }

    public void setContractType(String contractType)
    {
        this.contractType = contractType;
    }

    public String getApplyType()
    {
        return applyType;
    }

    public void setApplyType(String applyType)
    {
        this.applyType = applyType;
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

    public String getAuditOpinion()
    {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion)
    {
        this.auditOpinion = auditOpinion;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("auditId", getAuditId())
            .append("applyNo", getApplyNo())
            .append("relatedNo", getRelatedNo())
            .append("businessType", getBusinessType())
            .append("supplierName", getSupplierName())
            .append("contractNo", getContractNo())
            .append("contractType", getContractType())
            .append("applyType", getApplyType())
            .append("applicant", getApplicant())
            .append("applyDate", getApplyDate())
            .append("applyStatus", getApplyStatus())
            .append("auditor", getAuditor())
            .append("auditDate", getAuditDate())
            .append("auditStatus", getAuditStatus())
            .append("auditOpinion", getAuditOpinion())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
