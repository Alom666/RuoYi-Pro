
package com.ruoyi.mes.domain;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 生产完工单对象 mes_completion_order
 *
 * @author ruoyi
 */
public class CompletionOrder extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long completionId;

    /** 单号 */
    @Excel(name = "单号")
    private String orderNo;

    /** 生产计划编号 */
    @Excel(name = "生产计划编号")
    private String productionPlanCode;

    /** 生产作业名称 */
    @Excel(name = "生产作业名称")
    private String homeworkName;

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

    /** 完工日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "完工日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date completionDate;

    /** 生产数量 */
    @Excel(name = "生产数量")
    private Integer productionQuantity;

    /** 生产批号 */
    @Excel(name = "生产批号")
    private String batchNo;

    /** 状态：0未入库,1入库中,2已入库,3检验合格,4检验未合格 */
    @Excel(name = "状态", readConverterExp = "0=未入库,1=入库中,2=已入库,3=检验合格,4=检验未合格")
    private String status;

    public Long getCompletionId()
    {
        return completionId;
    }

    public void setCompletionId(Long completionId)
    {
        this.completionId = completionId;
    }

    public String getOrderNo()
    {
        return orderNo;
    }

    public void setOrderNo(String orderNo)
    {
        this.orderNo = orderNo;
    }

    public String getProductionPlanCode()
    {
        return productionPlanCode;
    }

    public void setProductionPlanCode(String productionPlanCode)
    {
        this.productionPlanCode = productionPlanCode;
    }

    public String getHomeworkName()
    {
        return homeworkName;
    }

    public void setHomeworkName(String homeworkName)
    {
        this.homeworkName = homeworkName;
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

    public Date getCompletionDate()
    {
        return completionDate;
    }

    public void setCompletionDate(Date completionDate)
    {
        this.completionDate = completionDate;
    }

    public Integer getProductionQuantity()
    {
        return productionQuantity;
    }

    public void setProductionQuantity(Integer productionQuantity)
    {
        this.productionQuantity = productionQuantity;
    }

    public String getBatchNo()
    {
        return batchNo;
    }

    public void setBatchNo(String batchNo)
    {
        this.batchNo = batchNo;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("completionId", getCompletionId())
            .append("orderNo", getOrderNo())
            .append("productionPlanCode", getProductionPlanCode())
            .append("homeworkName", getHomeworkName())
            .append("productName", getProductName())
            .append("productModel", getProductModel())
            .append("productSpec", getProductSpec())
            .append("productUnit", getProductUnit())
            .append("completionDate", getCompletionDate())
            .append("productionQuantity", getProductionQuantity())
            .append("batchNo", getBatchNo())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
