package com.zq.system.entity;

import java.util.List;

/**
 * @author Administrator
 *科室信息
 */
public class Subject {
	/**
	 * 科室ID
	 */
	private Integer subjectId;
	/**
	 * 科室描述
	 */
	private String subjectDescribe;
	/**
	 * 科室名称
	 */
	private String subjectName;
	/**
	 * 父级id
	 */
	private Integer parentId;
	
	
	/**
	 * 级别
	 */
	private Integer subjectLevel;

	private List<Subject> subjectList;
	
	public Integer getSubjectId() {
		return subjectId;
	}


	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}


	public String getSubjectDescribe() {
		return subjectDescribe;
	}


	public void setSubjectDescribe(String subjectDescribe) {
		this.subjectDescribe = subjectDescribe;
	}


	public String getSubjectName() {
		return subjectName;
	}


	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}


	public Integer getParentId() {
		return parentId;
	}


	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}


	public Integer getSubjectLevel() {
		return subjectLevel;
	}


	public void setSubjectLevel(Integer subjectLevel) {
		this.subjectLevel = subjectLevel;
	}


	public List<Subject> getSubjectList() {
		return subjectList;
	}


	public void setSubjectList(List<Subject> subjectList) {
		this.subjectList = subjectList;
	}
	
	
	
}
