package com.ruoyi.chargingRecord.service.impl;

import com.ruoyi.chargingRecord.domain.ChargingRecord;
import com.ruoyi.chargingRecord.mapper.ChargingRecordMapper;
import com.ruoyi.chargingRecord.service.ChargingSimulatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Random;

@Service
public class ChargingSimulatorServiceImpl implements ChargingSimulatorService {

    @Autowired
    private ChargingRecordMapper chargingRecordMapper;

    private Random random = new Random();

    @Override
    public void generateAndSaveChargingRecord() {
        ChargingRecord record = new ChargingRecord();

        // 模拟一些数据
        record.setTransactionId(random.nextLong());
        record.setUserId(random.nextLong());
        record.setChargeDuration(random.nextInt(500)); // 假设最长充电时间为 500 分钟
        record.setChargeAmount(random.nextDouble() * 100); // 假设充电费用最高 100 元
        record.setStartTime(LocalDateTime.now());
        record.setEndTime(record.getStartTime().plusMinutes(record.getChargeDuration()));
        record.setSocketId("Socket_" + random.nextInt(10));
        record.setChargerId("Charger_" + random.nextInt(10));
        record.setChargeStatus("COMPLETED"); // 假设充电总是成功完成

        // 存入数据库
        chargingRecordMapper.insertChargingRecord(record);
    }
}