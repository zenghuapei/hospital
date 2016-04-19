package com.zq.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.DoctorInfoDao;
import com.zq.system.dao.SubjectDao;
import com.zq.system.entity.DoctorInfo;
import com.zq.system.entity.Subject;
import com.zq.system.service.DoctorInfoService;
@Service("doctorInfoService")
public class DoctorInfoServiceImpl implements DoctorInfoService {
	@Autowired
	private DoctorInfoDao doctorInfoDao;
	@Autowired
	private SubjectDao subjectDao;

	public List<DoctorInfo> getDoctorInfoList(DoctorInfo doctorInfo) {
		
		return doctorInfoDao.getDoctorInfoList(doctorInfo);
	}

	public Integer addDoctorInfo(DoctorInfo doctorInfo) {
		
		return doctorInfoDao.addDoctorInfo(doctorInfo);
	}

	public void updateDoctorInfo(DoctorInfo doctorInfo) {
		doctorInfoDao.updateDoctorInfo(doctorInfo);
		
	}

	public void deleteDoctorInfo(DoctorInfo doctorInfo) {
		doctorInfoDao.deleteDoctorInfo(doctorInfo);
		
	}

	public List<DoctorInfo> getPageDoctorInfo(Page page) {
		
		return doctorInfoDao.getPageDoctorInfo(page);
	}

	public DoctorInfo getDoctorInfo(DoctorInfo doctorInfo) {
		DoctorInfo doctor =doctorInfoDao.getDoctorInfo(doctorInfo);
		Subject subject = new Subject();
		subject.setSubjectId(doctor.getSubjectId());
		Subject subj = subjectDao.getSubject(subject);
		doctor.setSubjectPrentId(subj.getParentId());
		return doctor;
	}

	
	
}
