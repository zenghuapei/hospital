package com.zq.system.entity;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zq.common.date.DateSerializer;



/**
 * @author zenghuapei
 *值班信息
 */
public class DutyInfo {
	/**
	 * 值班信息id
	 */
	private Integer dutyId;
	/**
	 * 值班时间
	 */
	private String dutyTime;
	/**
	 * 值班时间段
	 */
	private String dutyInterval;
	/**
	 * 医生ID
	 */
	private Integer doctorId;
	/**
	 * 最大预约数
	 */
	private Integer maxBookNum;
	/**
	 * 科室ID
	 */
	private Integer subjectId;
	/**
	 * 
	 */
	private Integer subjectPrentId;
	/**
	 * 出诊时间
	 */
	private Date dutyDate;
	/**
	 * string
	 */
	private String dutyDateStr;
	/**
	 * 医生信息
	 */
	private DoctorInfo doctorInfo;
	public Integer getDutyId() {
		return dutyId;
	}
	public void setDutyId(Integer dutyId) {
		this.dutyId = dutyId;
	}
	public String getDutyTime() {
		return dutyTime;
	}
	public void setDutyTime(String dutyTime) {
		this.dutyTime = dutyTime;
	}
	public String getDutyInterval() {
		return dutyInterval;
	}
	public void setDutyInterval(String dutyInterval) {
		this.dutyInterval = dutyInterval;
	}
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public Integer getMaxBookNum() {
		return maxBookNum;
	}
	public void setMaxBookNum(Integer maxBookNum) {
		this.maxBookNum = maxBookNum;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	@JsonSerialize(using = DateSerializer.class)
	public Date getDutyDate() {
		return dutyDate;
	}
	@JsonSerialize(using = DateSerializer.class)
	public void setDutyDate(Date dutyDate) {
		this.dutyDate = dutyDate;
	}
	public DoctorInfo getDoctorInfo() {
		return doctorInfo;
	}
	public void setDoctorInfo(DoctorInfo doctorInfo) {
		this.doctorInfo = doctorInfo;
	}
	public String getDutyDateStr() {
		return dutyDateStr;
	}
	public void setDutyDateStr(String dutyDateStr) {
		this.dutyDateStr = dutyDateStr;
	}
	public Integer getSubjectPrentId() {
		return subjectPrentId;
	}
	public void setSubjectPrentId(Integer subjectPrentId) {
		this.subjectPrentId = subjectPrentId;
	}
	
	
	
}
