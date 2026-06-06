
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
 * 补货申请对象 wms_replenish_apply
 *
 * @author ruoyi
 */
public class ReplenishApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long applyId;

    /** 单据号 */
    private String applyNo;

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

    /** 状态：0未采购,1采购中 */
    private String status;

    /** 补货申请明细列表 */
    private List<ReplenishApplyDetail> detailList;

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

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public List<ReplenishApplyDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<ReplenishApplyDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("applyId", getApplyId())
            .append("applyNo", getApplyNo())
            .append("applicant", getApplicant())
            .append("applyDate", getApplyDate())
            .append("applyStatus", getApplyStatus())
            .append("auditor", getAuditor())
            .append("auditDate", getAuditDate())
            .append("auditStatus", getAuditStatus())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
