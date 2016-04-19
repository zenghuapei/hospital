package com.zq.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.SubjectDao;
import com.zq.system.entity.Subject;
import com.zq.system.service.SubjectService;
@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	private SubjectDao subjectDao;

	public List<Subject> getSubjectList(Integer level) {
		List<Subject> subjectlevel = subjectDao.getSubjectList();
		List<Subject> returnList = new ArrayList<Subject>();
		for (Subject subject : subjectlevel) {
			List<Subject> pSubject = subjectDao.getParentSubjectList(subject.getSubjectId());
			subject.setSubjectList(pSubject);
			returnList.add(subject);
		}
		return returnList;
	}

	public Integer addSubject(Subject subject) {
		return subjectDao.addSubject(subject);
	}

	public Integer updateSubject(Subject subject) {
		return subjectDao.updateSubject(subject);
	}

	public Integer deleteSubject(Subject subject) {
		return subjectDao.deleteSubject(subject);
	}

	public List<Subject> getSubjectList() {
		List<Subject> subjectlevel = subjectDao.getSubjectList();
		return subjectlevel;
	}

	public List<Subject> getParentSubjectList(Integer parentId) {
		List<Subject> pSubject = subjectDao.getParentSubjectList(parentId);
		return pSubject;
	}

	public List<Subject> getPageSubject(Page page) {
		return subjectDao.getPageSubject(page);
	}

	public Subject getSubject(Subject subject) {
		return subjectDao.getSubject(subject);
	}

	
	
}
