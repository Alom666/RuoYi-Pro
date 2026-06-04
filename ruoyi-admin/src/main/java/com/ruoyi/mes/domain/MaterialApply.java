
package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 领料申请对象 mes_material_apply
 *
 * @author ruoyi
 */
public class MaterialApply extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long applyId;

    /** 领料单号 */
    @Excel(name = "领料单号")
    private String applyNo;

    /** 生产计划编号 */
    @Excel(name = "生产计划编号")
    private String productionPlanCode;

    /** 计划排产编号 */
    @Excel(name = "计划排产编号")
    private String schedulingCode;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String productName;

    /** 型号 */
    @Excel(name = "型号")
    private String productModel;

    /** 规格 */
    @Excel(name = "规格")
    private String productSpec;

    /** 单位 */
    @Excel(name = "单位")
    private String productUnit;

    /** 待产数量 */
    @Excel(name = "待产数量")
    private Integer pendingQuantity;

    /** 生产日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "生产日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date productionDate;

    /** 领取日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "领取日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date receiveDate;

    /** 申请人 */
    @Excel(name = "申请人")
    private String applicant;

    /** 申请日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "申请日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date applyDate;

    /** 申请状态：0未提交,1待审核,2已审核 */
    @Excel(name = "申请状态", readConverterExp = "0=未提交,1=待审核,2=已审核")
    private String applyStatus;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditor;

    /** 审核日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "审核日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date auditDate;

    /** 审核状态：0通过,1驳回 */
    @Excel(name = "审核状态", readConverterExp = "0=通过,1=驳回")
    private String auditStatus;

    /** 审核意见 */
    @Excel(name = "审核意见")
    private String auditOpinion;

    /** 子表：领料申请明细 */
    private List<MaterialApplyDetail> detailList;

    public Long getApplyId()
    {
        return applyId;
    }

    public void setApplyId(Long applyId)
    {
        this.applyId = applyId;
    }

    public String getApplyNo()
    {
        return applyNo;
    }

    public void setApplyNo(String applyNo)
    {
        this.applyNo = applyNo;
    }

    public String getProductionPlanCode()
    {
        return productionPlanCode;
    }

    public void setProductionPlanCode(String productionPlanCode)
    {
        this.productionPlanCode = productionPlanCode;
    }

    public String getSchedulingCode()
    {
        return schedulingCode;
    }

    public void setSchedulingCode(String schedulingCode)
    {
        this.schedulingCode = schedulingCode;
    }

    public String getProductName()
    {
        return productName;
    }

    public void setProductName(String productName)
    {
        this.productName = productName;
    }

    public String getProductModel()
    {
        return productModel;
    }

    public void setProductModel(String productModel)
    {
        this.productModel = productModel;
    }

    public String getProductSpec()
    {
        return productSpec;
    }

    public void setProductSpec(String productSpec)
    {
        this.productSpec = productSpec;
    }

    public String getProductUnit()
    {
        return productUnit;
    }

    public void setProductUnit(String productUnit)
    {
        this.productUnit = productUnit;
    }

    public Integer getPendingQuantity()
    {
        return pendingQuantity;
    }

    public void setPendingQuantity(Integer pendingQuantity)
    {
        this.pendingQuantity = pendingQuantity;
    }

    public Date getProductionDate()
    {
        return productionDate;
    }

    public void setProductionDate(Date productionDate)
    {
        this.productionDate = productionDate;
    }

    public Date getReceiveDate()
    {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate)
    {
        this.receiveDate = receiveDate;
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

    public List<MaterialApplyDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<MaterialApplyDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("applyId", getApplyId())
            .append("applyNo", getApplyNo())
            .append("productionPlanCode", getProductionPlanCode())
            .append("schedulingCode", getSchedulingCode())
            .append("productName", getProductName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("productUnit", getProductUnit())
            .append("pendingQuantity", getPendingQuantity())
            .append("productionDate", getProductionDate())
            .append("receiveDate", getReceiveDate())
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
