package com.ruoyi.socket.mapper;

import java.util.List;
import com.ruoyi.socket.domain.Socket;

/**
 * 插座管理Mapper接口
 * 
 * @author incohua
 * @date 2024-07-15
 */
public interface SocketMapper 
{
    /**
     * 查询插座管理
     * 
     * @param socketId 插座管理主键
     * @return 插座管理
     */
    public Socket selectSocketBySocketId(Long socketId);

    /**
     * 查询插座管理列表
     * 
     * @param socket 插座管理
     * @return 插座管理集合
     */
    public List<Socket> selectSocketList(Socket socket);

    /**
     * 新增插座管理
     * 
     * @param socket 插座管理
     * @return 结果
     */
    public int insertSocket(Socket socket);

    /**
     * 修改插座管理
     * 
     * @param socket 插座管理
     * @return 结果
     */
    public int updateSocket(Socket socket);

    /**
     * 删除插座管理
     * 
     * @param socketId 插座管理主键
     * @return 结果
     */
    public int deleteSocketBySocketId(Long socketId);

    /**
     * 批量删除插座管理
     * 
     * @param socketIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSocketBySocketIds(String[] socketIds);
}
