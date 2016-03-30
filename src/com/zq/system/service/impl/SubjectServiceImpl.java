package com.zq.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.system.dao.SubjectDao;
import com.zq.system.entity.Subject;
import com.zq.system.service.SubjectService;
@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	private SubjectDao subjectDao;

	public List<Subject> getSubjectList(Subject subject) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer addSubject(Subject subject) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer updateSubject(Subject subject) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer deleteSubject(Subject subject) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
