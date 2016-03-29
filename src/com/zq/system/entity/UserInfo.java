package com.zq.system.entity;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.zq.common.date.DateSerializer;

/**
 * @author Administrator
 *用户信息
 */
public class UserInfo {
	/**
	 * 用户ID
	 */
	private Integer userId;
	/**
	 * 用户姓名
	 */
	private String userName;
	/**
	 * 用户名
	 */
	private String account;
	/**
	 * 生日
	 */
	private Date birthday;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 用户性别
	 */
	private String sex;
	/**
	 * 身份证号
	 */
	private String idCard;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 注册时间
	 */
	private Date userRegister;
	/**
	 * 联系电话
	 */
	private String relationway;
	/**
	 * 用户类型
	 */
	private Integer userType;
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@JsonSerialize(using = DateSerializer.class)
	public Date getUserRegister() {
		return userRegister;
	}
	@JsonSerialize(using = DateSerializer.class)
	public void setUserRegister(Date userRegister) {
		this.userRegister = userRegister;
	}
	@JsonSerialize(using = DateSerializer.class)
	public Date getBirthday() {
		return birthday;
	}
	@JsonSerialize(using = DateSerializer.class)
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getRelationway() {
		return relationway;
	}
	public void setRelationway(String relationway) {
		this.relationway = relationway;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
}
