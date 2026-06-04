
package com.ruoyi.scm.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 销售计划主表对象 scm_sales_plan
 *
 * @author ruoyi
 */
public class SalesPlan extends BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long planId;

    /** 计划单号 */
    @Excel(name = "计划单号")
    private String planNo;

    /** 计划标题 */
    @Excel(name = "计划标题")
    private String planTitle;

    /** 计划类型：0年度计划,1季度计划,2月计划 */
    @Excel(name = "计划类型", readConverterExp = "0=年度计划,1=季度计划,2=月计划")
    private String planType;

    /** 起始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "起始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 子表：指标配置 */
    private List<SalesPlanDetail> detailList;

    public Long getPlanId()
    {
        return planId;
    }

    public void setPlanId(Long planId)
    {
        this.planId = planId;
    }

    public String getPlanNo()
    {
        return planNo;
    }

    public void setPlanNo(String planNo)
    {
        this.planNo = planNo;
    }

    public String getPlanTitle()
    {
        return planTitle;
    }

    public void setPlanTitle(String planTitle)
    {
        this.planTitle = planTitle;
    }

    public String getPlanType()
    {
        return planType;
    }

    public void setPlanType(String planType)
    {
        this.planType = planType;
    }

    public Date getStartDate()
    {
        return startDate;
    }

    public void setStartDate(Date startDate)
    {
        this.startDate = startDate;
    }

    public Date getEndDate()
    {
        return endDate;
    }

    public void setEndDate(Date endDate)
    {
        this.endDate = endDate;
    }

    public List<SalesPlanDetail> getDetailList()
    {
        return detailList;
    }

    public void setDetailList(List<SalesPlanDetail> detailList)
    {
        this.detailList = detailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("planId", getPlanId())
            .append("planNo", getPlanNo())
            .append("planTitle", getPlanTitle())
            .append("planType", getPlanType())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
