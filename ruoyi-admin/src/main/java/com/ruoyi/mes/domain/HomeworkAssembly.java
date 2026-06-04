
package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作业装配对象 mes_homework_assembly
 *
 * @author ruoyi
 */
public class HomeworkAssembly extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 作业装配ID（编号） */
    private Long assemblyId;

    /** 作业名称 */
    @Excel(name = "作业名称")
    private String homeworkName;

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

    /** 生产数量 */
    @Excel(name = "生产数量")
    private Integer productionQuantity;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 作业状态：0未执行,1执行中,2已完成,3异常 */
    @Excel(name = "作业状态", readConverterExp = "0=未执行,1=执行中,2=已完成,3=异常")
    private String homeworkStatus;

    /** 生产作业物料信息备注 */
    @Excel(name = "生产作业物料信息备注")
    private String materialRemark;

    public Long getAssemblyId()
    {
        return assemblyId;
    }

    public void setAssemblyId(Long assemblyId)
    {
        this.assemblyId = assemblyId;
    }

    public String getHomeworkName()
    {
        return homeworkName;
    }

    public void setHomeworkName(String homeworkName)
    {
        this.homeworkName = homeworkName;
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

    public Integer getProductionQuantity()
    {
        return productionQuantity;
    }

    public void setProductionQuantity(Integer productionQuantity)
    {
        this.productionQuantity = productionQuantity;
    }

    public Date getStartTime()
    {
        return startTime;
    }

    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }

    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public String getHomeworkStatus()
    {
        return homeworkStatus;
    }

    public void setHomeworkStatus(String homeworkStatus)
    {
        this.homeworkStatus = homeworkStatus;
    }

    public String getMaterialRemark()
    {
        return materialRemark;
    }

    public void setMaterialRemark(String materialRemark)
    {
        this.materialRemark = materialRemark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("assemblyId", getAssemblyId())
            .append("homeworkName", getHomeworkName())
            .append("productionPlanCode", getProductionPlanCode())
            .append("schedulingCode", getSchedulingCode())
            .append("productName", getProductName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("productUnit", getProductUnit())
            .append("productionQuantity", getProductionQuantity())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("homeworkStatus", getHomeworkStatus())
            .append("materialRemark", getMaterialRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
