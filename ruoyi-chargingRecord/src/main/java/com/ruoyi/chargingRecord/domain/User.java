package com.ruoyi.chargingRecord.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户个人信息对象 user
 * 
 * @author incohua
 * @date 2024-07-18
 */
public class User extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户的唯一编号 */
    private Long userId;

    /** 用户自定义昵称 */
    @Excel(name = "用户自定义昵称")
    private String username;

    /** 用户设置的密码 */
    @Excel(name = "用户设置的密码")
    private String password;

    /** 用户的账号剩余金额 */
    @Excel(name = "用户的账号剩余金额")
    private BigDecimal balance;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setBalance(BigDecimal balance) 
    {
        this.balance = balance;
    }

    public BigDecimal getBalance() 
    {
        return balance;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("balance", getBalance())
            .toString();
    }
}
