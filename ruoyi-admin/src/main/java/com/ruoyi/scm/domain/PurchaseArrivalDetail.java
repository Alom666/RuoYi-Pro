
package com.ruoyi.scm.domain;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;

/**
 * 采购到货明细对象 scm_purchase_arrival_detail
 *
 * @author ruoyi
 */
public class PurchaseArrivalDetail implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 明细编号 */
    private Long detailId;

    /** 到货主表ID */
    private Long arrivalId;

    /** 序号 */
    private Integer seqNo;

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

    /** 合同订货数量 */
    @Excel(name = "合同订货数量")
    private Integer orderQuantity;

    /** 到货数量 */
    @Excel(name = "到货数量")
    private Integer arrivalQuantity;

    /** 生产批号 */
    @Excel(name = "生产批号")
    private String batchNo;

    /** 备注 */
    private String remark;

    public Long getDetailId() { return detailId; }
    public void setDetailId(Long detailId) { this.detailId = detailId; }

    public Long getArrivalId() { return arrivalId; }
    public void setArrivalId(Long arrivalId) { this.arrivalId = arrivalId; }

    public Integer getSeqNo() { return seqNo; }
    public void setSeqNo(Integer seqNo) { this.seqNo = seqNo; }

    public String getMaterialName() { return materialName; }
    public void setMaterialName(String materialName) { this.materialName = materialName; }

    public String getProductModel() { return productModel; }
    public void setProductModel(String productModel) { this.productModel = productModel; }

    public String getProductSpec() { return productSpec; }
    public void setProductSpec(String productSpec) { this.productSpec = productSpec; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public Integer getOrderQuantity() { return orderQuantity; }
    public void setOrderQuantity(Integer orderQuantity) { this.orderQuantity = orderQuantity; }

    public Integer getArrivalQuantity() { return arrivalQuantity; }
    public void setArrivalQuantity(Integer arrivalQuantity) { this.arrivalQuantity = arrivalQuantity; }

    public String getBatchNo() { return batchNo; }
    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }

    public String getRemark() { return remark; }
    public void setRemark(String remark) { this.remark = remark; }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("detailId", getDetailId())
            .append("arrivalId", getArrivalId())
            .append("seqNo", getSeqNo())
            .append("materialName", getMaterialName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("orderQuantity", getOrderQuantity())
            .append("arrivalQuantity", getArrivalQuantity())
            .append("batchNo", getBatchNo())
            .append("remark", getRemark())
            .toString();
    }
}
