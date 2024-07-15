package com.ruoyi.chargingRecord.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.chargingRecord.mapper.ChargingRecordMapper;
import com.ruoyi.chargingRecord.domain.ChargingRecord;
import com.ruoyi.chargingRecord.service.IChargingRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 充电记录Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-15
 */
@Service
public class ChargingRecordServiceImpl implements IChargingRecordService 
{
    @Autowired
    private ChargingRecordMapper chargingRecordMapper;

    /**
     * 查询充电记录
     * 
     * @param transactionId 充电记录主键
     * @return 充电记录
     */
    @Override
    public ChargingRecord selectChargingRecordByTransactionId(Long transactionId)
    {
        return chargingRecordMapper.selectChargingRecordByTransactionId(transactionId);
    }

    /**
     * 查询充电记录列表
     * 
     * @param chargingRecord 充电记录
     * @return 充电记录
     */
    @Override
    public List<ChargingRecord> selectChargingRecordList(ChargingRecord chargingRecord)
    {
        return chargingRecordMapper.selectChargingRecordList(chargingRecord);
    }

    /**
     * 新增充电记录
     * 
     * @param chargingRecord 充电记录
     * @return 结果
     */
    @Override
    public int insertChargingRecord(ChargingRecord chargingRecord)
    {
        return chargingRecordMapper.insertChargingRecord(chargingRecord);
    }

    /**
     * 修改充电记录
     * 
     * @param chargingRecord 充电记录
     * @return 结果
     */
    @Override
    public int updateChargingRecord(ChargingRecord chargingRecord)
    {
        return chargingRecordMapper.updateChargingRecord(chargingRecord);
    }

    /**
     * 批量删除充电记录
     * 
     * @param transactionIds 需要删除的充电记录主键
     * @return 结果
     */
    @Override
    public int deleteChargingRecordByTransactionIds(String transactionIds)
    {
        return chargingRecordMapper.deleteChargingRecordByTransactionIds(Convert.toStrArray(transactionIds));
    }

    /**
     * 删除充电记录信息
     * 
     * @param transactionId 充电记录主键
     * @return 结果
     */
    @Override
    public int deleteChargingRecordByTransactionId(Long transactionId)
    {
        return chargingRecordMapper.deleteChargingRecordByTransactionId(transactionId);
    }
}
