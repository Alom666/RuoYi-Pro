
package com.ruoyi.wms.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 盘点信息对象 wms_inventory_count
 *
 * @author ruoyi
 */
public class InventoryCount extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long countId;

    /** 单据号 */
    private String countNo;

    /** 物料ID */
    private Long materialId;

    /** 物料 */
    private String materialName;

    /** 仓库 */
    private String warehouseName;

    /** 库区 */
    private String locationArea;

    /** 库位 */
    private String locationNo;

    /** 批号 */
    private String batchNo;

    /** 盘点类型（0月盘,1季盘） */
    private String countType;

    /** 库存月份（YYYY-MM） */
    private String inventoryMonth;

    /** 盘点日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date countDate;

    /** 负责人 */
    private String responsiblePerson;

    /** 现库存 */
    private Integer currentStock;

    /** 实际库存 */
    private Integer actualStock;

    /** 原因 */
    private String reason;

    public Long getCountId()
    {
        return countId;
    }

    public void setCountId(Long countId)
    {
        this.countId = countId;
    }

    @NotBlank(message = "单据号不能为空")
    @Size(min = 0, max = 50, message = "单据号长度不能超过50个字符")
    public String getCountNo()
    {
        return countNo;
    }

    public void setCountNo(String countNo)
    {
        this.countNo = countNo;
    }

    @NotNull(message = "物料ID不能为空")
    public Long getMaterialId()
    {
        return materialId;
    }

    public void setMaterialId(Long materialId)
    {
        this.materialId = materialId;
    }

    @Size(min = 0, max = 100, message = "物料名称长度不能超过100个字符")
    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    @Size(min = 0, max = 100, message = "仓库名称长度不能超过100个字符")
    public String getWarehouseName()
    {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName)
    {
        this.warehouseName = warehouseName;
    }

    @Size(min = 0, max = 100, message = "库区长度不能超过100个字符")
    public String getLocationArea()
    {
        return locationArea;
    }

    public void setLocationArea(String locationArea)
    {
        this.locationArea = locationArea;
    }

    @Size(min = 0, max = 100, message = "库位长度不能超过100个字符")
    public String getLocationNo()
    {
        return locationNo;
    }

    public void setLocationNo(String locationNo)
    {
        this.locationNo = locationNo;
    }

    @Size(min = 0, max = 50, message = "批号长度不能超过50个字符")
    public String getBatchNo()
    {
        return batchNo;
    }

    public void setBatchNo(String batchNo)
    {
        this.batchNo = batchNo;
    }

    public String getCountType()
    {
        return countType;
    }

    public void setCountType(String countType)
    {
        this.countType = countType;
    }

    @Size(min = 0, max = 10, message = "库存月份长度不能超过10个字符")
    public String getInventoryMonth()
    {
        return inventoryMonth;
    }

    public void setInventoryMonth(String inventoryMonth)
    {
        this.inventoryMonth = inventoryMonth;
    }

    public Date getCountDate()
    {
        return countDate;
    }

    public void setCountDate(Date countDate)
    {
        this.countDate = countDate;
    }

    @Size(min = 0, max = 50, message = "负责人长度不能超过50个字符")
    public String getResponsiblePerson()
    {
        return responsiblePerson;
    }

    public void setResponsiblePerson(String responsiblePerson)
    {
        this.responsiblePerson = responsiblePerson;
    }

    public Integer getCurrentStock()
    {
        return currentStock;
    }

    public void setCurrentStock(Integer currentStock)
    {
        this.currentStock = currentStock;
    }

    @NotNull(message = "实际库存不能为空")
    public Integer getActualStock()
    {
        return actualStock;
    }

    public void setActualStock(Integer actualStock)
    {
        this.actualStock = actualStock;
    }

    @Size(min = 0, max = 255, message = "原因长度不能超过255个字符")
    public String getReason()
    {
        return reason;
    }

    public void setReason(String reason)
    {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("countId", getCountId())
            .append("countNo", getCountNo())
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("warehouseName", getWarehouseName())
            .append("locationArea", getLocationArea())
            .append("locationNo", getLocationNo())
            .append("batchNo", getBatchNo())
            .append("countType", getCountType())
            .append("inventoryMonth", getInventoryMonth())
            .append("countDate", getCountDate())
            .append("responsiblePerson", getResponsiblePerson())
            .append("currentStock", getCurrentStock())
            .append("actualStock", getActualStock())
            .append("reason", getReason())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
