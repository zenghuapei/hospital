package com.zq.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.BookingDao;
import com.zq.system.dao.DoctorInfoDao;
import com.zq.system.dao.DutyInfoDao;
import com.zq.system.entity.Booking;
import com.zq.system.entity.DoctorInfo;
import com.zq.system.entity.DutyInfo;
import com.zq.system.service.BookingService;
import com.zq.system.service.DutyInfoService;
@Service("dutyInfoService")
public class DutyInfoServiceImpl implements DutyInfoService {
	@Autowired
	private DutyInfoDao dutyInfoDao;
	@Autowired
	private DoctorInfoDao doctorInfoDao;

	public DoctorInfo getDutyInfoList(DutyInfo dutyInfo) {
		DoctorInfo doctorInfo = doctorInfoDao.getDoctorDuty(dutyInfo.getDoctorId());
		List<DutyInfo> dutyInfoList = dutyInfoDao.getDutyInfoList(dutyInfo);
		doctorInfo.setDutyInfoList(dutyInfoList);
		return doctorInfo;
	}

	public Integer addDutyInfo(DutyInfo dutyInfo) {
		return dutyInfoDao.addDutyInfo(dutyInfo);
	}

	public DutyInfo getDutyInfo(DutyInfo dutyInfo) {
		return dutyInfoDao.getDutyInfo(dutyInfo);
	}

	public List<DutyInfo> getDutyInfoListAjax(DutyInfo dutyInfo) {
		return dutyInfoDao.getDutyInfoList(dutyInfo);
	}

	public List<DutyInfo> getPageDutyInfo(Page page) {
		return dutyInfoDao.getPageDutyInfo(page);
	}

	public void deleteDutyInfo(DutyInfo dutyInfo) {
		dutyInfoDao.deleteDutyInfo(dutyInfo);
		
	}

	public void updateDutyInfo(DutyInfo dutyInfo) {
		dutyInfoDao.updateDutyInfo(dutyInfo);
	}

}
