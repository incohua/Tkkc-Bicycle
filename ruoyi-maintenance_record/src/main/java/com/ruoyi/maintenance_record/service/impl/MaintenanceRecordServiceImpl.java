package com.ruoyi.maintenance_record.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.maintenance_record.mapper.MaintenanceRecordMapper;
import com.ruoyi.maintenance_record.domain.MaintenanceRecord;
import com.ruoyi.maintenance_record.service.IMaintenanceRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 维修工单Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Service
public class MaintenanceRecordServiceImpl implements IMaintenanceRecordService 
{
    @Autowired
    private MaintenanceRecordMapper maintenanceRecordMapper;

    /**
     * 查询维修工单
     * 
     * @param maintenanceId 维修工单主键
     * @return 维修工单
     */
    @Override
    public MaintenanceRecord selectMaintenanceRecordByMaintenanceId(Long maintenanceId)
    {
        return maintenanceRecordMapper.selectMaintenanceRecordByMaintenanceId(maintenanceId);
    }

    /**
     * 查询维修工单列表
     * 
     * @param maintenanceRecord 维修工单
     * @return 维修工单
     */
    @Override
    public List<MaintenanceRecord> selectMaintenanceRecordList(MaintenanceRecord maintenanceRecord)
    {
        return maintenanceRecordMapper.selectMaintenanceRecordList(maintenanceRecord);
    }

    /**
     * 新增维修工单
     * 
     * @param maintenanceRecord 维修工单
     * @return 结果
     */
    @Override
    public int insertMaintenanceRecord(MaintenanceRecord maintenanceRecord)
    {
        return maintenanceRecordMapper.insertMaintenanceRecord(maintenanceRecord);
    }

    /**
     * 修改维修工单
     * 
     * @param maintenanceRecord 维修工单
     * @return 结果
     */
    @Override
    public int updateMaintenanceRecord(MaintenanceRecord maintenanceRecord)
    {
        return maintenanceRecordMapper.updateMaintenanceRecord(maintenanceRecord);
    }

    /**
     * 批量删除维修工单
     * 
     * @param maintenanceIds 需要删除的维修工单主键
     * @return 结果
     */
    @Override
    public int deleteMaintenanceRecordByMaintenanceIds(String maintenanceIds)
    {
        return maintenanceRecordMapper.deleteMaintenanceRecordByMaintenanceIds(Convert.toStrArray(maintenanceIds));
    }

    /**
     * 删除维修工单信息
     * 
     * @param maintenanceId 维修工单主键
     * @return 结果
     */
    @Override
    public int deleteMaintenanceRecordByMaintenanceId(Long maintenanceId)
    {
        return maintenanceRecordMapper.deleteMaintenanceRecordByMaintenanceId(maintenanceId);
    }
}
