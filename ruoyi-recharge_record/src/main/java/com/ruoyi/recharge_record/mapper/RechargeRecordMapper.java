package com.ruoyi.recharge_record.mapper;

import java.util.List;
import com.ruoyi.recharge_record.domain.RechargeRecord;

/**
 * 充值记录Mapper接口
 * 
 * @author incohua
 * @date 2024-07-16
 */
public interface RechargeRecordMapper 
{
    /**
     * 查询充值记录
     * 
     * @param rechargeId 充值记录主键
     * @return 充值记录
     */
    public RechargeRecord selectRechargeRecordByRechargeId(Long rechargeId);

    /**
     * 查询充值记录列表
     * 
     * @param rechargeRecord 充值记录
     * @return 充值记录集合
     */
    public List<RechargeRecord> selectRechargeRecordList(RechargeRecord rechargeRecord);

    /**
     * 新增充值记录
     * 
     * @param rechargeRecord 充值记录
     * @return 结果
     */
    public int insertRechargeRecord(RechargeRecord rechargeRecord);

    /**
     * 修改充值记录
     * 
     * @param rechargeRecord 充值记录
     * @return 结果
     */
    public int updateRechargeRecord(RechargeRecord rechargeRecord);

    /**
     * 删除充值记录
     * 
     * @param rechargeId 充值记录主键
     * @return 结果
     */
    public int deleteRechargeRecordByRechargeId(Long rechargeId);

    /**
     * 批量删除充值记录
     * 
     * @param rechargeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRechargeRecordByRechargeIds(String[] rechargeIds);
}
