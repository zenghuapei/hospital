package com.zq.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zq.common.page.Page;
import com.zq.system.entity.Booking;
import com.zq.system.entity.DoctorInfo;
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
	  * 查询分页信息
	 * @param page
	 * @return
	 */
	public List<DutyInfo> getPageDutyInfo(Page page);
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
	
	
	/**
	 * 删除
	 * @param dutyInfo
	 */
	public void deleteDutyInfo(DutyInfo dutyInfo);
	/**
	 * 修改
	 * @param dutyInfo
	 */
	public void updateDutyInfo(DutyInfo dutyInfo);
}
