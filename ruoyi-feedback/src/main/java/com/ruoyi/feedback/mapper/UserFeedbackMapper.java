package com.ruoyi.feedback.mapper;

import java.util.List;
import com.ruoyi.feedback.domain.UserFeedback;

/**
 * 反馈信息Mapper接口
 * 
 * @author incohua
 * @date 2024-07-18
 */
public interface UserFeedbackMapper 
{
    /**
     * 查询反馈信息
     * 
     * @param userId 反馈信息主键
     * @return 反馈信息
     */
    public UserFeedback selectUserFeedbackByUserId(Long userId);

    /**
     * 查询反馈信息列表
     * 
     * @param userFeedback 反馈信息
     * @return 反馈信息集合
     */
    public List<UserFeedback> selectUserFeedbackList(UserFeedback userFeedback);

    /**
     * 新增反馈信息
     * 
     * @param userFeedback 反馈信息
     * @return 结果
     */
    public int insertUserFeedback(UserFeedback userFeedback);

    /**
     * 修改反馈信息
     * 
     * @param userFeedback 反馈信息
     * @return 结果
     */
    public int updateUserFeedback(UserFeedback userFeedback);

    /**
     * 删除反馈信息
     * 
     * @param userId 反馈信息主键
     * @return 结果
     */
    public int deleteUserFeedbackByUserId(Long userId);

    /**
     * 批量删除反馈信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserFeedbackByUserIds(String[] userIds);
}
