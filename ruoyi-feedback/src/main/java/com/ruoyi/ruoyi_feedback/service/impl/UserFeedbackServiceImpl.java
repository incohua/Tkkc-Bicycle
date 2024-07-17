package com.ruoyi.ruoyi_feedback.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ruoyi_feedback.mapper.UserFeedbackMapper;
import com.ruoyi.ruoyi_feedback.domain.UserFeedback;
import com.ruoyi.ruoyi_feedback.service.IUserFeedbackService;
import com.ruoyi.common.core.text.Convert;

/**
 * 反馈信息Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-17
 */
@Service
public class UserFeedbackServiceImpl implements IUserFeedbackService 
{
    @Autowired
    private UserFeedbackMapper userFeedbackMapper;

    /**
     * 查询反馈信息
     * 
     * @param userId 反馈信息主键
     * @return 反馈信息
     */
    @Override
    public UserFeedback selectUserFeedbackByUserId(Long userId)
    {
        return userFeedbackMapper.selectUserFeedbackByUserId(userId);
    }

    /**
     * 查询反馈信息列表
     * 
     * @param userFeedback 反馈信息
     * @return 反馈信息
     */
    @Override
    public List<UserFeedback> selectUserFeedbackList(UserFeedback userFeedback)
    {
        return userFeedbackMapper.selectUserFeedbackList(userFeedback);
    }

    /**
     * 新增反馈信息
     * 
     * @param userFeedback 反馈信息
     * @return 结果
     */
    @Override
    public int insertUserFeedback(UserFeedback userFeedback)
    {
        return userFeedbackMapper.insertUserFeedback(userFeedback);
    }

    /**
     * 修改反馈信息
     * 
     * @param userFeedback 反馈信息
     * @return 结果
     */
    @Override
    public int updateUserFeedback(UserFeedback userFeedback)
    {
        return userFeedbackMapper.updateUserFeedback(userFeedback);
    }

    /**
     * 批量删除反馈信息
     * 
     * @param userIds 需要删除的反馈信息主键
     * @return 结果
     */
    @Override
    public int deleteUserFeedbackByUserIds(String userIds)
    {
        return userFeedbackMapper.deleteUserFeedbackByUserIds(Convert.toStrArray(userIds));
    }

    /**
     * 删除反馈信息信息
     * 
     * @param userId 反馈信息主键
     * @return 结果
     */
    @Override
    public int deleteUserFeedbackByUserId(Long userId)
    {
        return userFeedbackMapper.deleteUserFeedbackByUserId(userId);
    }
}
