package com.ruoyi.socket.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.socket.domain.Socket;
import com.ruoyi.socket.service.ISocketService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 插座管理Controller
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Controller
@RequestMapping("/socket/socketinfo")
public class SocketController extends BaseController
{
    private String prefix = "socket/socketinfo";

    @Autowired
    private ISocketService socketService;

    @RequiresPermissions("socket:socketinfo:view")
    @GetMapping()
    public String socketinfo()
    {
        return prefix + "/socketinfo";
    }

    /**
     * 查询插座管理列表
     */
    @RequiresPermissions("socket:socketinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Socket socket)
    {
        startPage();
        List<Socket> list = socketService.selectSocketList(socket);
        return getDataTable(list);
    }

    /**
     * 导出插座管理列表
     */
    @RequiresPermissions("socket:socketinfo:export")
    @Log(title = "插座管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Socket socket)
    {
        List<Socket> list = socketService.selectSocketList(socket);
        ExcelUtil<Socket> util = new ExcelUtil<Socket>(Socket.class);
        return util.exportExcel(list, "插座管理数据");
    }

    /**
     * 新增插座管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存插座管理
     */
    @RequiresPermissions("socket:socketinfo:add")
    @Log(title = "插座管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Socket socket)
    {
        return toAjax(socketService.insertSocket(socket));
    }

    /**
     * 修改插座管理
     */
    @RequiresPermissions("socket:socketinfo:edit")
    @GetMapping("/edit/{socketId}")
    public String edit(@PathVariable("socketId") Long socketId, ModelMap mmap)
    {
        Socket socket = socketService.selectSocketBySocketId(socketId);
        mmap.put("socket", socket);
        return prefix + "/edit";
    }

    /**
     * 修改保存插座管理
     */
    @RequiresPermissions("socket:socketinfo:edit")
    @Log(title = "插座管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Socket socket)
    {
        return toAjax(socketService.updateSocket(socket));
    }

    /**
     * 删除插座管理
     */
    @RequiresPermissions("socket:socketinfo:remove")
    @Log(title = "插座管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(socketService.deleteSocketBySocketIds(ids));
    }
}
