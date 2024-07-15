package com.ruoyi.charger.service;

import java.util.List;
import com.ruoyi.charger.domain.Charger;

/**
 * 充电桩管理Service接口
 * 
 * @author incohua
 * @date 2024-07-15
 */
public interface IChargerService 
{
    /**
     * 查询充电桩管理
     * 
     * @param chargerId 充电桩管理主键
     * @return 充电桩管理
     */
    public Charger selectChargerByChargerId(Long chargerId);

    /**
     * 查询充电桩管理列表
     * 
     * @param charger 充电桩管理
     * @return 充电桩管理集合
     */
    public List<Charger> selectChargerList(Charger charger);

    /**
     * 新增充电桩管理
     * 
     * @param charger 充电桩管理
     * @return 结果
     */
    public int insertCharger(Charger charger);

    /**
     * 修改充电桩管理
     * 
     * @param charger 充电桩管理
     * @return 结果
     */
    public int updateCharger(Charger charger);

    /**
     * 批量删除充电桩管理
     * 
     * @param chargerIds 需要删除的充电桩管理主键集合
     * @return 结果
     */
    public int deleteChargerByChargerIds(String chargerIds);

    /**
     * 删除充电桩管理信息
     * 
     * @param chargerId 充电桩管理主键
     * @return 结果
     */
    public int deleteChargerByChargerId(Long chargerId);
}
