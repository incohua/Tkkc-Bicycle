package com.ruoyi.feedback.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 反馈信息对象 user_feedback
 * 
 * @author incohua
 * @date 2024-07-18
 */
public class UserFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户的唯一编号 */
    private Long userId;

    /** 需要维修的问题 */
    @Excel(name = "需要维修的问题")
    private String issue;

    /** 用户提供平台优化建议 */
    @Excel(name = "用户提供平台优化建议")
    private String suggestion;

    /** 反馈状态显示 */
    @Excel(name = "反馈状态显示")
    private String status;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setIssue(String issue) 
    {
        this.issue = issue;
    }

    public String getIssue() 
    {
        return issue;
    }

    public void setSuggestion(String suggestion) 
    {
        this.suggestion = suggestion;
    }

    public String getSuggestion() 
    {
        return suggestion;
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
            .append("userId", getUserId())
            .append("issue", getIssue())
            .append("suggestion", getSuggestion())
            .append("status", getStatus())
            .toString();
    }
}
