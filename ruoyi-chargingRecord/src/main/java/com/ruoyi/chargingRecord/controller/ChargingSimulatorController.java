package com.ruoyi.chargingRecord.controller;

import com.ruoyi.chargingRecord.service.ChargingSimulatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/simulateCharging")
public class ChargingSimulatorController {

    @Autowired
    private ChargingSimulatorService chargingSimulatorService;

    @GetMapping("/generate")
    public String generateChargingRecord() {
        chargingSimulatorService.generateAndSaveChargingRecord();
        return "Generated and saved a charging record";
    }
}