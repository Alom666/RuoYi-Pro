
package com.ruoyi.scm.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;

/**
 * 销售退货明细对象 scm_sales_return_detail
 *
 * @author ruoyi
 */
public class SalesReturnDetail implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 明细编号 */
    private Long detailId;

    /** 退货主表ID */
    @Excel(name = "退货主表ID")
    private Long returnId;

    /** 序号 */
    @Excel(name = "序号")
    private Integer seqNo;

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

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 订货数量 */
    @Excel(name = "订货数量")
    private Integer orderQuantity;

    /** 发货数量 */
    @Excel(name = "发货数量")
    private Integer deliveryQuantity;

    /** 退货数量 */
    @Excel(name = "退货数量")
    private Integer returnQuantity;

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

    public Long getReturnId()
    {
        return returnId;
    }

    public void setReturnId(Long returnId)
    {
        this.returnId = returnId;
    }

    public Integer getSeqNo()
    {
        return seqNo;
    }

    public void setSeqNo(Integer seqNo)
    {
        this.seqNo = seqNo;
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

    public BigDecimal getPrice()
    {
        return price;
    }

    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public Integer getOrderQuantity()
    {
        return orderQuantity;
    }

    public void setOrderQuantity(Integer orderQuantity)
    {
        this.orderQuantity = orderQuantity;
    }

    public Integer getDeliveryQuantity()
    {
        return deliveryQuantity;
    }

    public void setDeliveryQuantity(Integer deliveryQuantity)
    {
        this.deliveryQuantity = deliveryQuantity;
    }

    public Integer getReturnQuantity()
    {
        return returnQuantity;
    }

    public void setReturnQuantity(Integer returnQuantity)
    {
        this.returnQuantity = returnQuantity;
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
            .append("returnId", getReturnId())
            .append("seqNo", getSeqNo())
            .append("materialName", getMaterialName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("price", getPrice())
            .append("orderQuantity", getOrderQuantity())
            .append("deliveryQuantity", getDeliveryQuantity())
            .append("returnQuantity", getReturnQuantity())
            .append("remark", getRemark())
            .toString();
    }
}
