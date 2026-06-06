
package com.ruoyi.wms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 出库申请明细对象 wms_outbound_apply_detail
 *
 * @author ruoyi
 */
public class OutboundApplyDetail
{
    private static final long serialVersionUID = 1L;

    /** 明细ID */
    private Long detailId;

    /** 申请ID */
    private Long applyId;

    /** 序号 */
    private Integer seqNo;

    /** 物料ID */
    private Long materialId;

    /** 物料名称 */
    private String materialName;

    /** 产品型号 */
    private String productModel;

    /** 产品规格 */
    private String productSpec;

    /** 单位 */
    private String unit;

    /** 出库数量 */
    private Integer outboundQuantity;

    /** 备注 */
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

    public Integer getSeqNo()
    {
        return seqNo;
    }

    public void setSeqNo(Integer seqNo)
    {
        this.seqNo = seqNo;
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

    public Integer getOutboundQuantity()
    {
        return outboundQuantity;
    }

    public void setOutboundQuantity(Integer outboundQuantity)
    {
        this.outboundQuantity = outboundQuantity;
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
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("detailId", getDetailId())
            .append("applyId", getApplyId())
            .append("seqNo", getSeqNo())
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("unit", getUnit())
            .append("outboundQuantity", getOutboundQuantity())
            .append("remark", getRemark())
            .toString();
    }
}
