package com.ruoyi.recharge_record.controller;

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
import com.ruoyi.recharge_record.domain.RechargeRecord;
import com.ruoyi.recharge_record.service.IRechargeRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 充值记录Controller
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Controller
@RequestMapping("/recharge_record/rechargerecord")
public class RechargeRecordController extends BaseController
{
    private String prefix = "recharge_record/rechargerecord";

    @Autowired
    private IRechargeRecordService rechargeRecordService;

    @RequiresPermissions("recharge_record:rechargerecord:view")
    @GetMapping()
    public String rechargerecord()
    {
        return prefix + "/rechargerecord";
    }

    /**
     * 查询充值记录列表
     */
    @RequiresPermissions("recharge_record:rechargerecord:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(RechargeRecord rechargeRecord)
    {
        startPage();
        List<RechargeRecord> list = rechargeRecordService.selectRechargeRecordList(rechargeRecord);
        return getDataTable(list);
    }

    /**
     * 导出充值记录列表
     */
    @RequiresPermissions("recharge_record:rechargerecord:export")
    @Log(title = "充值记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RechargeRecord rechargeRecord)
    {
        List<RechargeRecord> list = rechargeRecordService.selectRechargeRecordList(rechargeRecord);
        ExcelUtil<RechargeRecord> util = new ExcelUtil<RechargeRecord>(RechargeRecord.class);
        return util.exportExcel(list, "充值记录数据");
    }

    /**
     * 新增充值记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存充值记录
     */
    @RequiresPermissions("recharge_record:rechargerecord:add")
    @Log(title = "充值记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(RechargeRecord rechargeRecord)
    {
        return toAjax(rechargeRecordService.insertRechargeRecord(rechargeRecord));
    }

    /**
     * 修改充值记录
     */
    @RequiresPermissions("recharge_record:rechargerecord:edit")
    @GetMapping("/edit/{rechargeId}")
    public String edit(@PathVariable("rechargeId") Long rechargeId, ModelMap mmap)
    {
        RechargeRecord rechargeRecord = rechargeRecordService.selectRechargeRecordByRechargeId(rechargeId);
        mmap.put("rechargeRecord", rechargeRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存充值记录
     */
    @RequiresPermissions("recharge_record:rechargerecord:edit")
    @Log(title = "充值记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(RechargeRecord rechargeRecord)
    {
        return toAjax(rechargeRecordService.updateRechargeRecord(rechargeRecord));
    }

    /**
     * 删除充值记录
     */
    @RequiresPermissions("recharge_record:rechargerecord:remove")
    @Log(title = "充值记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(rechargeRecordService.deleteRechargeRecordByRechargeIds(ids));
    }
}
