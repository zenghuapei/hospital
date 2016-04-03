package com.zq.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.DoctorInfoDao;
import com.zq.system.dao.MenuDao;
import com.zq.system.entity.DoctorInfo;
import com.zq.system.entity.Menu;
import com.zq.system.service.DoctorInfoService;
import com.zq.system.service.MenuService;
@Service("doctorInfoService")
public class DoctorInfoServiceImpl implements DoctorInfoService {
	@Autowired
	private DoctorInfoDao doctorInfoDao;

	public List<DoctorInfo> getDoctorInfoList(DoctorInfo doctorInfo) {
		
		return doctorInfoDao.getDoctorInfoList(doctorInfo);
	}

	public Integer addDoctorInfo(DoctorInfo doctorInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateDoctorInfo(DoctorInfo doctorInfo) {
		// TODO Auto-generated method stub
		
	}

	public void deleteDoctorInfo(DoctorInfo doctorInfo) {
		// TODO Auto-generated method stub
		
	}

	
	
}
