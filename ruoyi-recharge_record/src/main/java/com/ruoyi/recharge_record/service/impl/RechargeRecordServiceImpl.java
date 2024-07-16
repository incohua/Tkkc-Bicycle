package com.ruoyi.recharge_record.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.recharge_record.mapper.RechargeRecordMapper;
import com.ruoyi.recharge_record.domain.RechargeRecord;
import com.ruoyi.recharge_record.service.IRechargeRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 充值记录Service业务层处理
 * 
 * @author incohua
 * @date 2024-07-16
 */
@Service
public class RechargeRecordServiceImpl implements IRechargeRecordService 
{
    @Autowired
    private RechargeRecordMapper rechargeRecordMapper;

    /**
     * 查询充值记录
     * 
     * @param rechargeId 充值记录主键
     * @return 充值记录
     */
    @Override
    public RechargeRecord selectRechargeRecordByRechargeId(Long rechargeId)
    {
        return rechargeRecordMapper.selectRechargeRecordByRechargeId(rechargeId);
    }

    /**
     * 查询充值记录列表
     * 
     * @param rechargeRecord 充值记录
     * @return 充值记录
     */
    @Override
    public List<RechargeRecord> selectRechargeRecordList(RechargeRecord rechargeRecord)
    {
        return rechargeRecordMapper.selectRechargeRecordList(rechargeRecord);
    }

    /**
     * 新增充值记录
     * 
     * @param rechargeRecord 充值记录
     * @return 结果
     */
    @Override
    public int insertRechargeRecord(RechargeRecord rechargeRecord)
    {
        return rechargeRecordMapper.insertRechargeRecord(rechargeRecord);
    }

    /**
     * 修改充值记录
     * 
     * @param rechargeRecord 充值记录
     * @return 结果
     */
    @Override
    public int updateRechargeRecord(RechargeRecord rechargeRecord)
    {
        return rechargeRecordMapper.updateRechargeRecord(rechargeRecord);
    }

    /**
     * 批量删除充值记录
     * 
     * @param rechargeIds 需要删除的充值记录主键
     * @return 结果
     */
    @Override
    public int deleteRechargeRecordByRechargeIds(String rechargeIds)
    {
        return rechargeRecordMapper.deleteRechargeRecordByRechargeIds(Convert.toStrArray(rechargeIds));
    }

    /**
     * 删除充值记录信息
     * 
     * @param rechargeId 充值记录主键
     * @return 结果
     */
    @Override
    public int deleteRechargeRecordByRechargeId(Long rechargeId)
    {
        return rechargeRecordMapper.deleteRechargeRecordByRechargeId(rechargeId);
    }
}
