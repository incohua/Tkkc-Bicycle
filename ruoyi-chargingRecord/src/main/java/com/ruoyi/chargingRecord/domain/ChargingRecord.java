package com.ruoyi.chargingRecord.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 充电记录对象 charging_record
 *
 * @author incohua
 * @date 2024-07-15
 */
public class ChargingRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 充电记录序号 */
    private Long transactionId;

    /** 用户的唯一编号 */
    private Long userId;

    /** 本次充电时长 */
    private Date chargeDuration;

    /** 本次充电的金额 */
    @Excel(name = "本次充电的金额")
    private BigDecimal chargeAmount;

    /** 充电开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "充电开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 充电结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "充电结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 使用的插座ID */
    @Excel(name = "使用的插座ID")
    private String socketId;

    /** 使用的充电桩ID */
    @Excel(name = "使用的充电桩ID")
    private String chargerId;

    /** 充电进度状态 */
    @Excel(name = "充电进度状态")
    private String chargeStatus;

    private int hours;

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public void setTransactionId(Long transactionId)
    {
        this.transactionId = transactionId;
    }

    public Long getTransactionId()
    {
        return transactionId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setChargeDuration(Date chargeDuration)
    {
        this.chargeDuration = chargeDuration;
    }

    public Date getChargeDuration()
    {
        return chargeDuration;
    }

    public void setChargeAmount(BigDecimal chargeAmount)
    {
        this.chargeAmount = chargeAmount;
    }

    public BigDecimal getChargeAmount()
    {
        return chargeAmount;
    }

    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }

    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }

    public void setSocketId(String socketId)
    {
        this.socketId = socketId;
    }

    public String getSocketId()
    {
        return socketId;
    }

    public void setChargerId(String chargerId)
    {
        this.chargerId = chargerId;
    }

    public String getChargerId()
    {
        return chargerId;
    }

    public void setChargeStatus(String chargeStatus)
    {
        this.chargeStatus = chargeStatus;
    }

    public String getChargeStatus()
    {
        return chargeStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("transactionId", getTransactionId())
            .append("userId", getUserId())
            .append("chargeDuration", getChargeDuration())
            .append("chargeAmount", getChargeAmount())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("socketId", getSocketId())
            .append("chargerId", getChargerId())
            .append("chargeStatus", getChargeStatus())
            .toString();
    }
}
