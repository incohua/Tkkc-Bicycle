package com.ruoyi.charger.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 充电桩管理对象 charger
 * 
 * @author incohua
 * @date 2024-07-15
 */
public class Charger extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 充电桩的唯一编号 */
    private Long chargerId;

    /** 充电桩所属区域 */
    @Excel(name = "充电桩所属区域")
    private String region;

    /** 充电桩运行状态 */
    @Excel(name = "充电桩运行状态")
    private String status;

    /** 充电桩上插座数量 */
    @Excel(name = "充电桩上插座数量")
    private BigDecimal socketCount;

    public void setChargerId(Long chargerId) 
    {
        this.chargerId = chargerId;
    }

    public Long getChargerId() 
    {
        return chargerId;
    }

    public void setRegion(String region) 
    {
        this.region = region;
    }

    public String getRegion() 
    {
        return region;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setSocketCount(BigDecimal socketCount) 
    {
        this.socketCount = socketCount;
    }

    public BigDecimal getSocketCount() 
    {
        return socketCount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("chargerId", getChargerId())
            .append("region", getRegion())
            .append("status", getStatus())
            .append("socketCount", getSocketCount())
            .toString();
    }
}
