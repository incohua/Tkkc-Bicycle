package com.ruoyi.maintenance_record.controller;

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
import com.ruoyi.maintenance_record.domain.MaintenanceRecord;
import com.ruoyi.maintenance_record.service.IMaintenanceRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 维修工单Controller
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Controller
@RequestMapping("/maintenance_record/maintenancerecord")
public class MaintenanceRecordController extends BaseController
{
    private String prefix = "maintenance_record/maintenancerecord";

    @Autowired
    private IMaintenanceRecordService maintenanceRecordService;

    @RequiresPermissions("maintenance_record:maintenancerecord:view")
    @GetMapping()
    public String maintenancerecord()
    {
        return prefix + "/maintenancerecord";
    }

    /**
     * 查询维修工单列表
     */
    @RequiresPermissions("maintenance_record:maintenancerecord:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MaintenanceRecord maintenanceRecord)
    {
        startPage();
        List<MaintenanceRecord> list = maintenanceRecordService.selectMaintenanceRecordList(maintenanceRecord);
        return getDataTable(list);
    }

    /**
     * 导出维修工单列表
     */
    @RequiresPermissions("maintenance_record:maintenancerecord:export")
    @Log(title = "维修工单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MaintenanceRecord maintenanceRecord)
    {
        List<MaintenanceRecord> list = maintenanceRecordService.selectMaintenanceRecordList(maintenanceRecord);
        ExcelUtil<MaintenanceRecord> util = new ExcelUtil<MaintenanceRecord>(MaintenanceRecord.class);
        return util.exportExcel(list, "维修工单数据");
    }

    /**
     * 新增维修工单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存维修工单
     */
    @RequiresPermissions("maintenance_record:maintenancerecord:add")
    @Log(title = "维修工单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MaintenanceRecord maintenanceRecord)
    {
        return toAjax(maintenanceRecordService.insertMaintenanceRecord(maintenanceRecord));
    }

    /**
     * 修改维修工单
     */
    @RequiresPermissions("maintenance_record:maintenancerecord:edit")
    @GetMapping("/edit/{maintenanceId}")
    public String edit(@PathVariable("maintenanceId") Long maintenanceId, ModelMap mmap)
    {
        MaintenanceRecord maintenanceRecord = maintenanceRecordService.selectMaintenanceRecordByMaintenanceId(maintenanceId);
        mmap.put("maintenanceRecord", maintenanceRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修工单
     */
    @RequiresPermissions("maintenance_record:maintenancerecord:edit")
    @Log(title = "维修工单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MaintenanceRecord maintenanceRecord)
    {
        return toAjax(maintenanceRecordService.updateMaintenanceRecord(maintenanceRecord));
    }

    /**
     * 删除维修工单
     */
    @RequiresPermissions("maintenance_record:maintenancerecord:remove")
    @Log(title = "维修工单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(maintenanceRecordService.deleteMaintenanceRecordByMaintenanceIds(ids));
    }
}
