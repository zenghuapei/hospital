package com.zq.system.service;

import java.util.List;

import com.zq.common.page.Page;
import com.zq.system.entity.Menu;
import com.zq.system.entity.Subject;

public interface SubjectService {
	 /**
	  * 查询科室信息
	 * @param userId
	 * @return
	 */
	 public List<Subject> getSubjectList(Integer level);
	/**
	 * 添加科室
	 * @param menu
	 * @return
	 */
	public Integer addSubject(Subject subject);
	/**
	 * 修改科室
	 * @param menu
	 * @return
	 */
	public Integer updateSubject(Subject subject);
	/**
	 * 删除科室
	 * @param menu
	 * @return
	 */
	public Integer deleteSubject(Subject subject);
}
