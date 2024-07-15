package com.ruoyi.maintenance_record.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 维修工单对象 maintenance_record
 * 
 * @author incohua
 * @date 2024-07-15
 */
public class MaintenanceRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修编号 */
    private Long maintenanceId;

    /** 维修时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "维修时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date maintenanceTime;

    /** 维修问题 */
    @Excel(name = "维修问题")
    private String issue;

    /** 维修状态 */
    @Excel(name = "维修状态")
    private String status;

    public void setMaintenanceId(Long maintenanceId) 
    {
        this.maintenanceId = maintenanceId;
    }

    public Long getMaintenanceId() 
    {
        return maintenanceId;
    }

    public void setMaintenanceTime(Date maintenanceTime) 
    {
        this.maintenanceTime = maintenanceTime;
    }

    public Date getMaintenanceTime() 
    {
        return maintenanceTime;
    }

    public void setIssue(String issue) 
    {
        this.issue = issue;
    }

    public String getIssue() 
    {
        return issue;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("maintenanceId", getMaintenanceId())
            .append("maintenanceTime", getMaintenanceTime())
            .append("issue", getIssue())
            .append("status", getStatus())
            .toString();
    }
}
