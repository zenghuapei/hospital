package com.zq.system.entity;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zq.common.date.DateSerializer;

/**
 * @author Administrator
 *预约信息表
 */
public class Booking {
	/**
	 * 预约信息ID
	 */
	private Integer bookingId;
	/**
	 * 预约状态
	 */
	private String bookingState;
	/**
	 * 出诊时间
	 */
	private Date bookingTime;
	/**
	 * 挂号时间
	 */
	private Date booknow;
	/**
	 * 医生ID
	 */
	private Integer doctorId;
	/**
	 * 用户ID
	 */
	private Integer userId;
	public Integer getBookingId() {
		return bookingId;
	}
	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}
	public String getBookingState() {
		return bookingState;
	}
	public void setBookingState(String bookingState) {
		this.bookingState = bookingState;
	}
	@JsonSerialize(using = DateSerializer.class)
	public Date getBookingTime() {
		return bookingTime;
	}
	@JsonSerialize(using = DateSerializer.class)
	public void setBookingTime(Date bookingTime) {
		this.bookingTime = bookingTime;
	}
	@JsonSerialize(using = DateSerializer.class)
	public Date getBooknow() {
		return booknow;
	}
	@JsonSerialize(using = DateSerializer.class)
	public void setBooknow(Date booknow) {
		this.booknow = booknow;
	}
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
}
