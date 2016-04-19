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
	 public List<Subject> getSubjectList();
	 /**
	  * 父级节点查询子集
	 * @param parentId
	 * @return
	 */
	public List<Subject> getParentSubjectList(Integer parentId);
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
	
	/**
	 * 查询单条
	 * @param subject
	 * @return
	 */
	public Subject getSubject(Subject subject);
	 /**
	  * 查询分页信息
	 * @param page
	 * @return
	 */
	public List<Subject> getPageSubject(Page page);
}
