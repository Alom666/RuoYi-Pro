
package com.ruoyi.scm.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;

/**
 * 采购合同明细对象 scm_purchase_contract_detail
 *
 * @author ruoyi
 */
public class PurchaseContractDetail implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 明细编号 */
    private Long detailId;

    /** 合同ID */
    private Long contractId;

    /** 序号 */
    private Integer seqNo;

    /** 物料ID */
    private Long materialId;

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
    private String unit;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal price;

    /** 订货数量 */
    @Excel(name = "订货数量")
    private Integer orderQuantity;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal amount;

    /** 备注 */
    private String remark;

    public Long getDetailId() { return detailId; }
    public void setDetailId(Long detailId) { this.detailId = detailId; }

    public Long getContractId() { return contractId; }
    public void setContractId(Long contractId) { this.contractId = contractId; }

    public Integer getSeqNo() { return seqNo; }
    public void setSeqNo(Integer seqNo) { this.seqNo = seqNo; }

    public Long getMaterialId() { return materialId; }
    public void setMaterialId(Long materialId) { this.materialId = materialId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getProductModel() { return productModel; }
    public void setProductModel(String productModel) { this.productModel = productModel; }

    public String getProductSpec() { return productSpec; }
    public void setProductSpec(String productSpec) { this.productSpec = productSpec; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public Integer getOrderQuantity() { return orderQuantity; }
    public void setOrderQuantity(Integer orderQuantity) { this.orderQuantity = orderQuantity; }

    public BigDecimal getAmount() { return amount; }
    public void setAmount(BigDecimal amount) { this.amount = amount; }

    public String getRemark() { return remark; }
    public void setRemark(String remark) { this.remark = remark; }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("detailId", getDetailId())
            .append("contractId", getContractId())
            .append("seqNo", getSeqNo())
            .append("materialId", getMaterialId())
            .append("productName", getProductName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("price", getPrice())
            .append("orderQuantity", getOrderQuantity())
            .append("amount", getAmount())
            .append("remark", getRemark())
            .toString();
    }
}
