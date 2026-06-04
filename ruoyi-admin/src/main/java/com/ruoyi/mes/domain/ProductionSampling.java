
package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 生产采样对象 mes_production_sampling
 *
 * @author ruoyi
 */
public class ProductionSampling extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long samplingId;

    /** 流水号 */
    @Excel(name = "流水号")
    private String serialNo;

    /** 计划编号 */
    @Excel(name = "计划编号")
    private String planNo;

    /** 作业名称 */
    @Excel(name = "作业名称")
    private String homeworkName;

    /** 物料名称 */
    @Excel(name = "物料名称")
    private String materialName;

    /** 规格 */
    @Excel(name = "规格")
    private String productSpec;

    /** 型号 */
    @Excel(name = "型号")
    private String productModel;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 检验项 */
    @Excel(name = "检验项")
    private String inspectionItem;

    /** 生产数量 */
    @Excel(name = "生产数量")
    private Integer productionQuantity;

    /** 采样数量 */
    @Excel(name = "采样数量")
    private Integer samplingQuantity;

    /** 检验值 */
    @Excel(name = "检验值")
    private BigDecimal testValue;

    /** 阈值上限 */
    @Excel(name = "阈值上限")
    private BigDecimal thresholdUpper;

    /** 阈值下限 */
    @Excel(name = "阈值下限")
    private BigDecimal thresholdLower;

    /** 检验结果：0合格,1不合格 */
    @Excel(name = "检验结果", readConverterExp = "0=合格,1=不合格")
    private String testResult;

    /** 检验人 */
    @Excel(name = "检验人")
    private String inspector;

    /** 检验时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "检验时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date inspectionDate;

    public Long getSamplingId()
    {
        return samplingId;
    }

    public void setSamplingId(Long samplingId)
    {
        this.samplingId = samplingId;
    }

    public String getSerialNo()
    {
        return serialNo;
    }

    public void setSerialNo(String serialNo)
    {
        this.serialNo = serialNo;
    }

    public String getPlanNo()
    {
        return planNo;
    }

    public void setPlanNo(String planNo)
    {
        this.planNo = planNo;
    }

    public String getHomeworkName()
    {
        return homeworkName;
    }

    public void setHomeworkName(String homeworkName)
    {
        this.homeworkName = homeworkName;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    public String getProductSpec()
    {
        return productSpec;
    }

    public void setProductSpec(String productSpec)
    {
        this.productSpec = productSpec;
    }

    public String getProductModel()
    {
        return productModel;
    }

    public void setProductModel(String productModel)
    {
        this.productModel = productModel;
    }

    public String getUnit()
    {
        return unit;
    }

    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getInspectionItem()
    {
        return inspectionItem;
    }

    public void setInspectionItem(String inspectionItem)
    {
        this.inspectionItem = inspectionItem;
    }

    public Integer getProductionQuantity()
    {
        return productionQuantity;
    }

    public void setProductionQuantity(Integer productionQuantity)
    {
        this.productionQuantity = productionQuantity;
    }

    public Integer getSamplingQuantity()
    {
        return samplingQuantity;
    }

    public void setSamplingQuantity(Integer samplingQuantity)
    {
        this.samplingQuantity = samplingQuantity;
    }

    public BigDecimal getTestValue()
    {
        return testValue;
    }

    public void setTestValue(BigDecimal testValue)
    {
        this.testValue = testValue;
    }

    public BigDecimal getThresholdUpper()
    {
        return thresholdUpper;
    }

    public void setThresholdUpper(BigDecimal thresholdUpper)
    {
        this.thresholdUpper = thresholdUpper;
    }

    public BigDecimal getThresholdLower()
    {
        return thresholdLower;
    }

    public void setThresholdLower(BigDecimal thresholdLower)
    {
        this.thresholdLower = thresholdLower;
    }

    public String getTestResult()
    {
        return testResult;
    }

    public void setTestResult(String testResult)
    {
        this.testResult = testResult;
    }

    public String getInspector()
    {
        return inspector;
    }

    public void setInspector(String inspector)
    {
        this.inspector = inspector;
    }

    public Date getInspectionDate()
    {
        return inspectionDate;
    }

    public void setInspectionDate(Date inspectionDate)
    {
        this.inspectionDate = inspectionDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("samplingId", getSamplingId())
            .append("serialNo", getSerialNo())
            .append("planNo", getPlanNo())
            .append("homeworkName", getHomeworkName())
            .append("materialName", getMaterialName())
            .append("productSpec", getProductSpec())
            .append("productModel", getProductModel())
            .append("unit", getUnit())
            .append("inspectionItem", getInspectionItem())
            .append("productionQuantity", getProductionQuantity())
            .append("samplingQuantity", getSamplingQuantity())
            .append("testValue", getTestValue())
            .append("thresholdUpper", getThresholdUpper())
            .append("thresholdLower", getThresholdLower())
            .append("testResult", getTestResult())
            .append("inspector", getInspector())
            .append("inspectionDate", getInspectionDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
