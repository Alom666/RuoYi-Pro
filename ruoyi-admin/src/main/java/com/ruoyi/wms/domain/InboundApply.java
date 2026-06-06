
package com.ruoyi.wms.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * WMS入库申请对象 wms_inbound_apply
 *
 * @author ruoyi
 */
public class InboundApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long applyId;

    /** 申请单号 */
    private String applyNo;

    /** 关联单据号 */
    private String relatedNo;

    /** 业务类型：0生产入库,1采购入库,2退货入库 */
    private String businessType;

    /** 供应商 */
    private String supplierName;

    /** 合同号 */
    private String contractNo;

    /** 合同类型：0采购合同,1销售合同 */
    private String contractType;

    /** 申请类型 */
    private String applyType;

    /** 申请人 */
    private String applicant;

    /** 申请日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date applyDate;

    /** 申请状态：0未提交,1待审核,2已审核 */
    private String applyStatus;

    /** 审核人 */
    private String auditor;

    /** 审核日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date auditDate;

    /** 审核状态：0通过,1驳回 */
    private String auditStatus;

    /** 审核意见 */
    private String auditOpinion;

    public Long getApplyId()
    {
        return applyId;
    }

    public void setApplyId(Long applyId)
    {
        this.applyId = applyId;
    }

    @NotBlank(message = "申请单号不能为空")
    @Size(min = 0, max = 50, message = "申请单号长度不能超过50个字符")
    public String getApplyNo()
    {
        return applyNo;
    }

    public void setApplyNo(String applyNo)
    {
        this.applyNo = applyNo;
    }

    @Size(min = 0, max = 50, message = "关联单据号长度不能超过50个字符")
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

    @Size(min = 0, max = 100, message = "供应商长度不能超过100个字符")
    public String getSupplierName()
    {
        return supplierName;
    }

    public void setSupplierName(String supplierName)
    {
        this.supplierName = supplierName;
    }

    @Size(min = 0, max = 50, message = "合同号长度不能超过50个字符")
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

    @Size(min = 0, max = 50, message = "申请类型长度不能超过50个字符")
    public String getApplyType()
    {
        return applyType;
    }

    public void setApplyType(String applyType)
    {
        this.applyType = applyType;
    }

    @Size(min = 0, max = 50, message = "申请人长度不能超过50个字符")
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

    @Size(min = 0, max = 50, message = "审核人长度不能超过50个字符")
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
            .append("applyId", getApplyId())
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
