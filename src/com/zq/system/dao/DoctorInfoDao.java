package com.zq.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zq.common.page.Page;
import com.zq.system.entity.DoctorInfo;
import com.zq.system.entity.Menu;

@Repository
public interface DoctorInfoDao {
	 /**
	  * 查询所有医生信息
	 * @param doctorInfo
	 * @return
	 */
	 public List<DoctorInfo> getDoctorInfoList(DoctorInfo doctorInfo);
	/**
	 * 添加医生
	 * @param doctorInfo
	 * @return
	 */
	public Integer addDoctorInfo(DoctorInfo doctorInfo);
	/**
	 * 修改
	 * @param doctorInfo
	 */
	public void updateDoctorInfo(DoctorInfo doctorInfo);
	/**
	 * 删除
	 * @param doctorInfo
	 */
	public void deleteDoctorInfo(DoctorInfo doctorInfo);
}
