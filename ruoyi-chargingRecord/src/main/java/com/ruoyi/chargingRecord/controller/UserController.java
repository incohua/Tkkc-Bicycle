package com.ruoyi.chargingRecord.controller;

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
import com.ruoyi.chargingRecord.domain.User;
import com.ruoyi.chargingRecord.service.IUserService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户个人信息Controller
 * 
 * @author incohua
 * @date 2024-07-18
 */
@Controller
@RequestMapping("/chargingRecord/user")
public class UserController extends BaseController
{
    private String prefix = "chargingRecord/user";

    @Autowired
    private IUserService userService;

    @RequiresPermissions("chargingRecord:user:view")
    @GetMapping()
    public String user()
    {
        return prefix + "/user";
    }

    /**
     * 查询用户个人信息列表
     */
    @RequiresPermissions("chargingRecord:user:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(User user)
    {
        startPage();
        List<User> list = userService.selectUserList(user);
        return getDataTable(list);
    }

    /**
     * 导出用户个人信息列表
     */
    @RequiresPermissions("chargingRecord:user:export")
    @Log(title = "用户个人信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(User user)
    {
        List<User> list = userService.selectUserList(user);
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.exportExcel(list, "用户个人信息数据");
    }

    /**
     * 新增用户个人信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户个人信息
     */
    @RequiresPermissions("chargingRecord:user:add")
    @Log(title = "用户个人信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(User user)
    {
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改用户个人信息
     */
    @RequiresPermissions("chargingRecord:user:edit")
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap)
    {
        User user = userService.selectUserByUserId(userId);
        mmap.put("user", user);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户个人信息
     */
    @RequiresPermissions("chargingRecord:user:edit")
    @Log(title = "用户个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(User user)
    {
        return toAjax(userService.updateUser(user));
    }

    /**
     * 删除用户个人信息
     */
    @RequiresPermissions("chargingRecord:user:remove")
    @Log(title = "用户个人信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userService.deleteUserByUserIds(ids));
    }
}
