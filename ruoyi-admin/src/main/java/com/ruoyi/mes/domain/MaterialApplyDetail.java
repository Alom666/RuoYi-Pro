
package com.ruoyi.mes.domain;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;

/**
 * 领料申请明细对象 mes_material_apply_detail
 *
 * @author ruoyi
 */
public class MaterialApplyDetail implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 明细编号 */
    private Long detailId;

    /** 领料申请ID */
    @Excel(name = "领料申请ID")
    private Long applyId;

    /** 物料 */
    @Excel(name = "物料")
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

    /** 需求数量 */
    @Excel(name = "需求数量")
    private Integer requiredQuantity;

    /** 已领数量 */
    @Excel(name = "已领数量")
    private Integer receivedQuantity;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getDetailId()
    {
        return detailId;
    }

    public void setDetailId(Long detailId)
    {
        this.detailId = detailId;
    }

    public Long getApplyId()
    {
        return applyId;
    }

    public void setApplyId(Long applyId)
    {
        this.applyId = applyId;
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

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("detailId", getDetailId())
            .append("applyId", getApplyId())
            .append("materialName", getMaterialName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("requiredQuantity", getRequiredQuantity())
            .append("receivedQuantity", getReceivedQuantity())
            .append("remark", getRemark())
            .toString();
    }
}
