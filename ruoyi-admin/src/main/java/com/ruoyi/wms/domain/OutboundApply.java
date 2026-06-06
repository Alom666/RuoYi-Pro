
package com.ruoyi.wms.domain;

import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出库申请对象 wms_outbound_apply
 *
 * @author ruoyi
 */
public class OutboundApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long applyId;

    /** 单据号 */
    private String applyNo;

    /** 业务类型：0领料出库,1销售出库 */
    private String businessType;

    /** 客户 */
    private String customerName;

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

    /** 单据状态：0未分拣,1已分拣,2已盘点,3已发货 */
    private String docStatus;

    /** 出库申请明细列表 */
    private List<OutboundApplyDetail> detailList;

    public Long getApplyId()
    {
        return applyId;
    }

    public void setApplyId(Long applyId)
    {
        this.applyId = applyId;
    }

    @NotBlank(message = "单据号不能为空")
    @Size(min = 0, max = 50, message = "单据号长度不能超过50个字符")
    public String getApplyNo()
    {
        return applyNo;
    }

    public void setApplyNo(String applyNo)
    {
        this.applyNo = applyNo;
    }

    public String getBusinessType()
    {
        return businessType;
    }

    public void setBusinessType(String businessType)
    {
        this.businessType = businessType;
    }

    @Size(min = 0, max = 100, message = "客户长度不能超过100个字符")
    public String getCustomerName()
    {
        return customerName;
    }

    public void setCustomerName(String customerName)
    {
        this.customerName = customerName;
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

    public String getDocStatus()
    {
        return docStatus;
    }

    public void setDocStatus(String docStatus)
    {
        this.docStatus = docStatus;
    }

    public List<OutboundApplyDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<OutboundApplyDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("applyId", getApplyId())
            .append("applyNo", getApplyNo())
            .append("businessType", getBusinessType())
            .append("customerName", getCustomerName())
            .append("applicant", getApplicant())
            .append("applyDate", getApplyDate())
            .append("applyStatus", getApplyStatus())
            .append("auditor", getAuditor())
            .append("auditDate", getAuditDate())
            .append("auditStatus", getAuditStatus())
            .append("docStatus", getDocStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
