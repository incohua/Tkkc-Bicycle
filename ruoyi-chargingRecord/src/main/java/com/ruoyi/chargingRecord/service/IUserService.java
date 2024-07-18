package com.ruoyi.chargingRecord.service;

import java.util.List;
import com.ruoyi.chargingRecord.domain.User;

/**
 * 用户个人信息Service接口
 * 
 * @author incohua
 * @date 2024-07-18
 */
public interface IUserService 
{
    /**
     * 查询用户个人信息
     * 
     * @param userId 用户个人信息主键
     * @return 用户个人信息
     */
    public User selectUserByUserId(Long userId);

    /**
     * 查询用户个人信息列表
     * 
     * @param user 用户个人信息
     * @return 用户个人信息集合
     */
    public List<User> selectUserList(User user);

    /**
     * 新增用户个人信息
     * 
     * @param user 用户个人信息
     * @return 结果
     */
    public int insertUser(User user);

    /**
     * 修改用户个人信息
     * 
     * @param user 用户个人信息
     * @return 结果
     */
    public int updateUser(User user);

    /**
     * 批量删除用户个人信息
     * 
     * @param userIds 需要删除的用户个人信息主键集合
     * @return 结果
     */
    public int deleteUserByUserIds(String userIds);

    /**
     * 删除用户个人信息信息
     * 
     * @param userId 用户个人信息主键
     * @return 结果
     */
    public int deleteUserByUserId(Long userId);
}
