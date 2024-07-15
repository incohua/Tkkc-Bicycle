package com.ruoyi.socket.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 插座管理对象 socket
 * 
 * @author incohua
 * @date 2024-07-15
 */
public class Socket extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 插座唯一编号 */
    private Long socketId;

    /** 插座归属充电桩编号 */
    @Excel(name = "插座归属充电桩编号")
    private Long chargerId;

    /** 插座状态 */
    @Excel(name = "插座状态")
    private String status;

    public void setSocketId(Long socketId) 
    {
        this.socketId = socketId;
    }

    public Long getSocketId() 
    {
        return socketId;
    }

    public void setChargerId(Long chargerId) 
    {
        this.chargerId = chargerId;
    }

    public Long getChargerId() 
    {
        return chargerId;
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
            .append("socketId", getSocketId())
            .append("chargerId", getChargerId())
            .append("status", getStatus())
            .toString();
    }
}
