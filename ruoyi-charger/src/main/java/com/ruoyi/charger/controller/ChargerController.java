package com.ruoyi.charger.controller;

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
import com.ruoyi.charger.domain.Charger;
import com.ruoyi.charger.service.IChargerService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 充电桩管理Controller
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Controller
@RequestMapping("/charger/chargerinfo")
public class ChargerController extends BaseController
{
    private String prefix = "charger/chargerinfo";

    @Autowired
    private IChargerService chargerService;

    @RequiresPermissions("charger:chargerinfo:view")
    @GetMapping()
    public String chargerinfo()
    {
        return prefix + "/chargerinfo";
    }

    /**
     * 查询充电桩管理列表
     */
    @RequiresPermissions("charger:chargerinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Charger charger)
    {
        startPage();
        List<Charger> list = chargerService.selectChargerList(charger);
        return getDataTable(list);
    }

    /**
     * 导出充电桩管理列表
     */
    @RequiresPermissions("charger:chargerinfo:export")
    @Log(title = "充电桩管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Charger charger)
    {
        List<Charger> list = chargerService.selectChargerList(charger);
        ExcelUtil<Charger> util = new ExcelUtil<Charger>(Charger.class);
        return util.exportExcel(list, "充电桩管理数据");
    }

    /**
     * 新增充电桩管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存充电桩管理
     */
    @RequiresPermissions("charger:chargerinfo:add")
    @Log(title = "充电桩管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Charger charger)
    {
        return toAjax(chargerService.insertCharger(charger));
    }

    /**
     * 修改充电桩管理
     */
    @RequiresPermissions("charger:chargerinfo:edit")
    @GetMapping("/edit/{chargerId}")
    public String edit(@PathVariable("chargerId") Long chargerId, ModelMap mmap)
    {
        Charger charger = chargerService.selectChargerByChargerId(chargerId);
        mmap.put("charger", charger);
        return prefix + "/edit";
    }

    /**
     * 修改保存充电桩管理
     */
    @RequiresPermissions("charger:chargerinfo:edit")
    @Log(title = "充电桩管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Charger charger)
    {
        return toAjax(chargerService.updateCharger(charger));
    }

    /**
     * 删除充电桩管理
     */
    @RequiresPermissions("charger:chargerinfo:remove")
    @Log(title = "充电桩管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(chargerService.deleteChargerByChargerIds(ids));
    }
}
