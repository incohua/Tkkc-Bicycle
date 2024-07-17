package com.ruoyi.ruoyi_feedback.controller;

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
import com.ruoyi.ruoyi_feedback.domain.UserFeedback;
import com.ruoyi.ruoyi_feedback.service.IUserFeedbackService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 反馈信息Controller
 * 
 * @author incohua
 * @date 2024-07-17
 */
@Controller
@RequestMapping("/userfeedback/feedback")
public class UserFeedbackController extends BaseController
{
    private String prefix = "userfeedback/feedback";

    @Autowired
    private IUserFeedbackService userFeedbackService;

    @RequiresPermissions("userfeedback:feedback:view")
    @GetMapping()
    public String feedback()
    {
        return prefix + "/feedback";
    }

    /**
     * 查询反馈信息列表
     */
    @RequiresPermissions("userfeedback:feedback:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserFeedback userFeedback)
    {
        startPage();
        List<UserFeedback> list = userFeedbackService.selectUserFeedbackList(userFeedback);
        return getDataTable(list);
    }

    /**
     * 导出反馈信息列表
     */
    @RequiresPermissions("userfeedback:feedback:export")
    @Log(title = "反馈信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserFeedback userFeedback)
    {
        List<UserFeedback> list = userFeedbackService.selectUserFeedbackList(userFeedback);
        ExcelUtil<UserFeedback> util = new ExcelUtil<UserFeedback>(UserFeedback.class);
        return util.exportExcel(list, "反馈信息数据");
    }

    /**
     * 新增反馈信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存反馈信息
     */
    @RequiresPermissions("userfeedback:feedback:add")
    @Log(title = "反馈信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserFeedback userFeedback)
    {
        return toAjax(userFeedbackService.insertUserFeedback(userFeedback));
    }

    /**
     * 修改反馈信息
     */
    @RequiresPermissions("userfeedback:feedback:edit")
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap)
    {
        UserFeedback userFeedback = userFeedbackService.selectUserFeedbackByUserId(userId);
        mmap.put("userFeedback", userFeedback);
        return prefix + "/edit";
    }

    /**
     * 修改保存反馈信息
     */
    @RequiresPermissions("userfeedback:feedback:edit")
    @Log(title = "反馈信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserFeedback userFeedback)
    {
        return toAjax(userFeedbackService.updateUserFeedback(userFeedback));
    }

    /**
     * 删除反馈信息
     */
    @RequiresPermissions("userfeedback:feedback:remove")
    @Log(title = "反馈信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userFeedbackService.deleteUserFeedbackByUserIds(ids));
    }
}
