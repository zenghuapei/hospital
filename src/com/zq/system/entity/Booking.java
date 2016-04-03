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
	
	/**
	 * 预约姓名
	 */
	private String bookName;
	/**
	 * 身份证号
	 */
	private String bookIdCard;
	/**
	 * 手机
	 */
	private String bookNum;
	/**
	 * 地址
	 */
	private String bookAddress;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookIdCard() {
		return bookIdCard;
	}
	public void setBookIdCard(String bookIdCard) {
		this.bookIdCard = bookIdCard;
	}
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getBookAddress() {
		return bookAddress;
	}
	public void setBookAddress(String bookAddress) {
		this.bookAddress = bookAddress;
	}
	
}
