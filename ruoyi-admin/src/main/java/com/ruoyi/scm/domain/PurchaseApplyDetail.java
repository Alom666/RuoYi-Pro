
package com.ruoyi.scm.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;

/**
 * 采购申请明细对象 scm_purchase_apply_detail
 *
 * @author ruoyi
 */
public class PurchaseApplyDetail implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 明细编号 */
    private Long detailId;

    /** 采购申请ID */
    private Long applyId;

    /** 序号 */
    private Integer seqNo;

    /** 物料ID */
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

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal price;

    /** 采购数量 */
    @Excel(name = "采购数量")
    private Integer purchaseQuantity;

    /** 需求数量 */
    @Excel(name = "需求数量")
    private Integer requiredQuantity;

    /** 需求日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "需求日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date requiredDate;

    /** 备注 */
    private String remark;

    public Long getDetailId() { return detailId; }
    public void setDetailId(Long detailId) { this.detailId = detailId; }

    public Long getApplyId() { return applyId; }
    public void setApplyId(Long applyId) { this.applyId = applyId; }

    public Integer getSeqNo() { return seqNo; }
    public void setSeqNo(Integer seqNo) { this.seqNo = seqNo; }

    public Long getMaterialId() { return materialId; }
    public void setMaterialId(Long materialId) { this.materialId = materialId; }

    public String getMaterialName() { return materialName; }
    public void setMaterialName(String materialName) { this.materialName = materialName; }

    public String getProductModel() { return productModel; }
    public void setProductModel(String productModel) { this.productModel = productModel; }

    public String getProductSpec() { return productSpec; }
    public void setProductSpec(String productSpec) { this.productSpec = productSpec; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public Integer getPurchaseQuantity() { return purchaseQuantity; }
    public void setPurchaseQuantity(Integer purchaseQuantity) { this.purchaseQuantity = purchaseQuantity; }

    public Integer getRequiredQuantity() { return requiredQuantity; }
    public void setRequiredQuantity(Integer requiredQuantity) { this.requiredQuantity = requiredQuantity; }

    public Date getRequiredDate() { return requiredDate; }
    public void setRequiredDate(Date requiredDate) { this.requiredDate = requiredDate; }

    public String getRemark() { return remark; }
    public void setRemark(String remark) { this.remark = remark; }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("detailId", getDetailId())
            .append("applyId", getApplyId())
            .append("seqNo", getSeqNo())
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("price", getPrice())
            .append("purchaseQuantity", getPurchaseQuantity())
            .append("requiredQuantity", getRequiredQuantity())
            .append("requiredDate", getRequiredDate())
            .append("remark", getRemark())
            .toString();
    }
}
