package com.ruoyi.chargingRecord.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.chargingRecord.mapper.UserMapper;
import com.ruoyi.chargingRecord.domain.User;
import com.ruoyi.chargingRecord.service.IUserService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户个人信息Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-18
 */
@Service
public class UserServiceImpl implements IUserService 
{
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询用户个人信息
     * 
     * @param userId 用户个人信息主键
     * @return 用户个人信息
     */
    @Override
    public User selectUserByUserId(Long userId)
    {
        return userMapper.selectUserByUserId(userId);
    }

    /**
     * 查询用户个人信息列表
     * 
     * @param user 用户个人信息
     * @return 用户个人信息
     */
    @Override
    public List<User> selectUserList(User user)
    {
        return userMapper.selectUserList(user);
    }

    /**
     * 新增用户个人信息
     * 
     * @param user 用户个人信息
     * @return 结果
     */
    @Override
    public int insertUser(User user)
    {
        return userMapper.insertUser(user);
    }

    /**
     * 修改用户个人信息
     * 
     * @param user 用户个人信息
     * @return 结果
     */
    @Override
    public int updateUser(User user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 批量删除用户个人信息
     * 
     * @param userIds 需要删除的用户个人信息主键
     * @return 结果
     */
    @Override
    public int deleteUserByUserIds(String userIds)
    {
        return userMapper.deleteUserByUserIds(Convert.toStrArray(userIds));
    }

    /**
     * 删除用户个人信息信息
     * 
     * @param userId 用户个人信息主键
     * @return 结果
     */
    @Override
    public int deleteUserByUserId(Long userId)
    {
        return userMapper.deleteUserByUserId(userId);
    }
}
