package com.ruoyi.maintenance_record.mapper;

import java.util.List;
import com.ruoyi.maintenance_record.domain.MaintenanceRecord;

/**
 * 维修工单Mapper接口
 * 
 * @author incohua
 * @date 2024-07-15
 */
public interface MaintenanceRecordMapper 
{
    /**
     * 查询维修工单
     * 
     * @param maintenanceId 维修工单主键
     * @return 维修工单
     */
    public MaintenanceRecord selectMaintenanceRecordByMaintenanceId(Long maintenanceId);

    /**
     * 查询维修工单列表
     * 
     * @param maintenanceRecord 维修工单
     * @return 维修工单集合
     */
    public List<MaintenanceRecord> selectMaintenanceRecordList(MaintenanceRecord maintenanceRecord);

    /**
     * 新增维修工单
     * 
     * @param maintenanceRecord 维修工单
     * @return 结果
     */
    public int insertMaintenanceRecord(MaintenanceRecord maintenanceRecord);

    /**
     * 修改维修工单
     * 
     * @param maintenanceRecord 维修工单
     * @return 结果
     */
    public int updateMaintenanceRecord(MaintenanceRecord maintenanceRecord);

    /**
     * 删除维修工单
     * 
     * @param maintenanceId 维修工单主键
     * @return 结果
     */
    public int deleteMaintenanceRecordByMaintenanceId(Long maintenanceId);

    /**
     * 批量删除维修工单
     * 
     * @param maintenanceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaintenanceRecordByMaintenanceIds(String[] maintenanceIds);
}
