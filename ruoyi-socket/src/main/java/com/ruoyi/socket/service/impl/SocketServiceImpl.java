package com.ruoyi.socket.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.socket.mapper.SocketMapper;
import com.ruoyi.socket.domain.Socket;
import com.ruoyi.socket.service.ISocketService;
import com.ruoyi.common.core.text.Convert;

/**
 * 插座管理Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Service
public class SocketServiceImpl implements ISocketService 
{
    @Autowired
    private SocketMapper socketMapper;

    /**
     * 查询插座管理
     * 
     * @param socketId 插座管理主键
     * @return 插座管理
     */
    @Override
    public Socket selectSocketBySocketId(Long socketId)
    {
        return socketMapper.selectSocketBySocketId(socketId);
    }

    /**
     * 查询插座管理列表
     * 
     * @param socket 插座管理
     * @return 插座管理
     */
    @Override
    public List<Socket> selectSocketList(Socket socket)
    {
        return socketMapper.selectSocketList(socket);
    }

    /**
     * 新增插座管理
     * 
     * @param socket 插座管理
     * @return 结果
     */
    @Override
    public int insertSocket(Socket socket)
    {
        return socketMapper.insertSocket(socket);
    }

    /**
     * 修改插座管理
     * 
     * @param socket 插座管理
     * @return 结果
     */
    @Override
    public int updateSocket(Socket socket)
    {
        return socketMapper.updateSocket(socket);
    }

    /**
     * 批量删除插座管理
     * 
     * @param socketIds 需要删除的插座管理主键
     * @return 结果
     */
    @Override
    public int deleteSocketBySocketIds(String socketIds)
    {
        return socketMapper.deleteSocketBySocketIds(Convert.toStrArray(socketIds));
    }

    /**
     * 删除插座管理信息
     * 
     * @param socketId 插座管理主键
     * @return 结果
     */
    @Override
    public int deleteSocketBySocketId(Long socketId)
    {
        return socketMapper.deleteSocketBySocketId(socketId);
    }
}
