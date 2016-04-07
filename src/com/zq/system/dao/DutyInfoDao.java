package com.zq.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zq.system.entity.Booking;
import com.zq.system.entity.DutyInfo;

@Repository
public interface DutyInfoDao {
	 /**
	  * 查询所有预约信息
	 * @param userId
	 * @return
	 */
	 public List<DutyInfo> getDutyInfoList(DutyInfo dutyInfo);
	
	/**
	 * 添加预约挂号
	 * @param menu
	 * @return
	 */
	public Integer addDutyInfo(DutyInfo dutyInfo);
	
	/**
	 * 
	 * 查询预约信息
	 * @param dutyInfo
	 * @return
	 */
	public DutyInfo getDutyInfo(DutyInfo dutyInfo);
}
