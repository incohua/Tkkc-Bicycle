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
import com.ruoyi.chargingRecord.domain.ChargingRecord;
import com.ruoyi.chargingRecord.service.IChargingRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 充电记录Controller
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Controller
@RequestMapping("/chargingRecord/charingRecordinfo")
public class ChargingRecordController extends BaseController
{
    private String prefix = "chargingRecord/charingRecordinfo";

    @Autowired
    private IChargingRecordService chargingRecordService;

    @RequiresPermissions("chargingRecord:charingRecordinfo:view")
    @GetMapping()
    public String charingRecordinfo()
    {
        return prefix + "/charingRecordinfo";
    }

    /**
     * 查询充电记录列表
     */
    @RequiresPermissions("chargingRecord:charingRecordinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ChargingRecord chargingRecord)
    {
        startPage();
        List<ChargingRecord> list = chargingRecordService.selectChargingRecordList(chargingRecord);
        return getDataTable(list);
    }

    /**
     * 导出充电记录列表
     */
    @RequiresPermissions("chargingRecord:charingRecordinfo:export")
    @Log(title = "充电记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ChargingRecord chargingRecord)
    {
        List<ChargingRecord> list = chargingRecordService.selectChargingRecordList(chargingRecord);
        ExcelUtil<ChargingRecord> util = new ExcelUtil<ChargingRecord>(ChargingRecord.class);
        return util.exportExcel(list, "充电记录数据");
    }

    /**
     * 新增充电记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存充电记录
     */
    @RequiresPermissions("chargingRecord:charingRecordinfo:add")
    @Log(title = "充电记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ChargingRecord chargingRecord)
    {
        return toAjax(chargingRecordService.insertChargingRecord(chargingRecord));
    }

    /**
     * 修改充电记录
     */
    @RequiresPermissions("chargingRecord:charingRecordinfo:edit")
    @GetMapping("/edit/{transactionId}")
    public String edit(@PathVariable("transactionId") Long transactionId, ModelMap mmap)
    {
        ChargingRecord chargingRecord = chargingRecordService.selectChargingRecordByTransactionId(transactionId);
        mmap.put("chargingRecord", chargingRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存充电记录
     */
    @RequiresPermissions("chargingRecord:charingRecordinfo:edit")
    @Log(title = "充电记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ChargingRecord chargingRecord)
    {
        return toAjax(chargingRecordService.updateChargingRecord(chargingRecord));
    }

    /**
     * 删除充电记录
     */
    @RequiresPermissions("chargingRecord:charingRecordinfo:remove")
    @Log(title = "充电记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(chargingRecordService.deleteChargingRecordByTransactionIds(ids));
    }
}
