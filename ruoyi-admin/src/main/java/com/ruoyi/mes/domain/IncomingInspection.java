
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
 * 来料检验对象 mes_incoming_inspection
 *
 * @author ruoyi
 */
public class IncomingInspection extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long inspectionId;

    /** 流水号 */
    @Excel(name = "流水号")
    private String serialNo;

    /** 领料单号 */
    @Excel(name = "领料单号")
    private String materialApplyNo;

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

    /** 需求数量 */
    @Excel(name = "需求数量")
    private Integer requiredQuantity;

    /** 已领数量 */
    @Excel(name = "已领数量")
    private Integer receivedQuantity;

    /** 抽检数量 */
    @Excel(name = "抽检数量")
    private Integer sampleQuantity;

    /** 检验项 */
    @Excel(name = "检验项")
    private String inspectionItem;

    /** 标准值上限 */
    @Excel(name = "标准值上限")
    private BigDecimal standardUpper;

    /** 标准值下限 */
    @Excel(name = "标准值下限")
    private BigDecimal standardLower;

    /** 检验值 */
    @Excel(name = "检验值")
    private BigDecimal testValue;

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

    public Long getInspectionId()
    {
        return inspectionId;
    }

    public void setInspectionId(Long inspectionId)
    {
        this.inspectionId = inspectionId;
    }

    public String getSerialNo()
    {
        return serialNo;
    }

    public void setSerialNo(String serialNo)
    {
        this.serialNo = serialNo;
    }

    public String getMaterialApplyNo()
    {
        return materialApplyNo;
    }

    public void setMaterialApplyNo(String materialApplyNo)
    {
        this.materialApplyNo = materialApplyNo;
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

    public Integer getRequiredQuantity()
    {
        return requiredQuantity;
    }

    public void setRequiredQuantity(Integer requiredQuantity)
    {
        this.requiredQuantity = requiredQuantity;
    }

    public Integer getReceivedQuantity()
    {
        return receivedQuantity;
    }

    public void setReceivedQuantity(Integer receivedQuantity)
    {
        this.receivedQuantity = receivedQuantity;
    }

    public Integer getSampleQuantity()
    {
        return sampleQuantity;
    }

    public void setSampleQuantity(Integer sampleQuantity)
    {
        this.sampleQuantity = sampleQuantity;
    }

    public String getInspectionItem()
    {
        return inspectionItem;
    }

    public void setInspectionItem(String inspectionItem)
    {
        this.inspectionItem = inspectionItem;
    }

    public BigDecimal getStandardUpper()
    {
        return standardUpper;
    }

    public void setStandardUpper(BigDecimal standardUpper)
    {
        this.standardUpper = standardUpper;
    }

    public BigDecimal getStandardLower()
    {
        return standardLower;
    }

    public void setStandardLower(BigDecimal standardLower)
    {
        this.standardLower = standardLower;
    }

    public BigDecimal getTestValue()
    {
        return testValue;
    }

    public void setTestValue(BigDecimal testValue)
    {
        this.testValue = testValue;
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
            .append("inspectionId", getInspectionId())
            .append("serialNo", getSerialNo())
            .append("materialApplyNo", getMaterialApplyNo())
            .append("materialName", getMaterialName())
            .append("productSpec", getProductSpec())
            .append("productModel", getProductModel())
            .append("unit", getUnit())
            .append("requiredQuantity", getRequiredQuantity())
            .append("receivedQuantity", getReceivedQuantity())
            .append("sampleQuantity", getSampleQuantity())
            .append("inspectionItem", getInspectionItem())
            .append("standardUpper", getStandardUpper())
            .append("standardLower", getStandardLower())
            .append("testValue", getTestValue())
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
