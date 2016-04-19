package com.zq.system.entity;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zq.common.date.DateSerializer;

public class UserAdmin {
	/**
	 * 管理员id
	 */
	private Integer adminId;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 账号
	 */
	private String account;
	/**
	 * 姓名
	 */
	private String adminName;
	/**
	 * 
	 */
	private String adminSex;
	/**
	 * 
	 */
	private Date adminRegister;
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminSex() {
		return adminSex;
	}
	public void setAdminSex(String adminSex) {
		this.adminSex = adminSex;
	}
	@JsonSerialize(using = DateSerializer.class)
	public Date getAdminRegister() {
		return adminRegister;
	}
	@JsonSerialize(using = DateSerializer.class)
	public void setAdminRegister(Date adminRegister) {
		this.adminRegister = adminRegister;
	}
	
	
}
