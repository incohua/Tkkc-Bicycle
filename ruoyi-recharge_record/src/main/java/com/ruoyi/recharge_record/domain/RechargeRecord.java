package com.ruoyi.recharge_record.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 充值记录对象 recharge_record
 * 
 * @author incohua
 * @date 2024-07-15
 */
public class RechargeRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 充值序号 */
    private Long rechargeId;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 充值金额 */
    @Excel(name = "充值金额")
    private BigDecimal amount;

    /** 充值方式 */
    @Excel(name = "充值方式")
    private String method;

    /** 充值时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "充值时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date rechargeTime;

    public void setRechargeId(Long rechargeId) 
    {
        this.rechargeId = rechargeId;
    }

    public Long getRechargeId() 
    {
        return rechargeId;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    public void setMethod(String method) 
    {
        this.method = method;
    }

    public String getMethod() 
    {
        return method;
    }

    public void setRechargeTime(Date rechargeTime) 
    {
        this.rechargeTime = rechargeTime;
    }

    public Date getRechargeTime() 
    {
        return rechargeTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rechargeId", getRechargeId())
            .append("userId", getUserId())
            .append("amount", getAmount())
            .append("method", getMethod())
            .append("rechargeTime", getRechargeTime())
            .toString();
    }
}
