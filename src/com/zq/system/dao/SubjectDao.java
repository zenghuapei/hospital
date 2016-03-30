package com.zq.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zq.common.page.Page;
import com.zq.system.entity.Menu;
import com.zq.system.entity.Subject;

@Repository
public interface SubjectDao {
	 /**
	  * 查询科室信息
	 * @param userId
	 * @return
	 */
	 public List<Subject> getSubjectList(Subject subject);
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
