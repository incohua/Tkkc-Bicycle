package com.ruoyi.chargingRecord.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
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
        chargingRecord.setChargeAmount(new BigDecimal(0));

        Date date = new Date();  // 当前时间
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR, chargingRecord.getHours());  // 加1小时
        Date newDate = calendar.getTime();
        chargingRecord.setEndTime(newDate);
        chargingRecord.setStartTime(date);

        chargingRecord.setChargeDuration(new Date());
        chargingRecord.setChargeStatus("2");
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
