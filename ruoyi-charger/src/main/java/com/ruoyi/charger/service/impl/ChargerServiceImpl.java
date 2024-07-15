package com.ruoyi.charger.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.charger.mapper.ChargerMapper;
import com.ruoyi.charger.domain.Charger;
import com.ruoyi.charger.service.IChargerService;
import com.ruoyi.common.core.text.Convert;

/**
 * 充电桩管理Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Service
public class ChargerServiceImpl implements IChargerService 
{
    @Autowired
    private ChargerMapper chargerMapper;

    /**
     * 查询充电桩管理
     * 
     * @param chargerId 充电桩管理主键
     * @return 充电桩管理
     */
    @Override
    public Charger selectChargerByChargerId(Long chargerId)
    {
        return chargerMapper.selectChargerByChargerId(chargerId);
    }

    /**
     * 查询充电桩管理列表
     * 
     * @param charger 充电桩管理
     * @return 充电桩管理
     */
    @Override
    public List<Charger> selectChargerList(Charger charger)
    {
        return chargerMapper.selectChargerList(charger);
    }

    /**
     * 新增充电桩管理
     * 
     * @param charger 充电桩管理
     * @return 结果
     */
    @Override
    public int insertCharger(Charger charger)
    {
        return chargerMapper.insertCharger(charger);
    }

    /**
     * 修改充电桩管理
     * 
     * @param charger 充电桩管理
     * @return 结果
     */
    @Override
    public int updateCharger(Charger charger)
    {
        return chargerMapper.updateCharger(charger);
    }

    /**
     * 批量删除充电桩管理
     * 
     * @param chargerIds 需要删除的充电桩管理主键
     * @return 结果
     */
    @Override
    public int deleteChargerByChargerIds(String chargerIds)
    {
        return chargerMapper.deleteChargerByChargerIds(Convert.toStrArray(chargerIds));
    }

    /**
     * 删除充电桩管理信息
     * 
     * @param chargerId 充电桩管理主键
     * @return 结果
     */
    @Override
    public int deleteChargerByChargerId(Long chargerId)
    {
        return chargerMapper.deleteChargerByChargerId(chargerId);
    }
}
