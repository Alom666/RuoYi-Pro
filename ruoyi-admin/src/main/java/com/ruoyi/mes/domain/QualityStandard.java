
package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 质检标准对象 mes_quality_standard
 *
 * @author ruoyi
 */
public class QualityStandard extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long standardId;

    /** 物料ID */
    @Excel(name = "物料ID")
    private Long materialId;

    /** 物料名称 */
    @Excel(name = "物料名称")
    private String materialName;

    /** 型号 */
    @Excel(name = "型号")
    private String productModel;

    /** 规格 */
    @Excel(name = "规格")
    private String productSpec;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 检验项目 */
    @Excel(name = "检验项目")
    private String inspectionItem;

    /** 检验类型 */
    @Excel(name = "检验类型")
    private String inspectionType;

    /** 标准值上限 */
    @Excel(name = "标准值上限")
    private BigDecimal standardUpper;

    /** 标准值下限 */
    @Excel(name = "标准值下限")
    private BigDecimal standardLower;

    public Long getStandardId()
    {
        return standardId;
    }

    public void setStandardId(Long standardId)
    {
        this.standardId = standardId;
    }

    public Long getMaterialId()
    {
        return materialId;
    }

    public void setMaterialId(Long materialId)
    {
        this.materialId = materialId;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
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

    public String getInspectionType()
    {
        return inspectionType;
    }

    public void setInspectionType(String inspectionType)
    {
        this.inspectionType = inspectionType;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("standardId", getStandardId())
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("inspectionItem", getInspectionItem())
            .append("inspectionType", getInspectionType())
            .append("standardUpper", getStandardUpper())
            .append("standardLower", getStandardLower())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
