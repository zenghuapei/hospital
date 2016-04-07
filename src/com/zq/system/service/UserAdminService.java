package com.zq.system.service;

import org.springframework.stereotype.Repository;

import com.zq.system.entity.UserAdmin;

@Repository
public interface UserAdminService {
	 /**
	  * 查询管理员信息
	 * @param userId
	 * @return
	 */
	 public UserAdmin getUserAdmin(String account);
	
	/**
	 * 添加管理员
	 * @param menu
	 * @return
	 */
	public Integer addUserAdmin(UserAdmin userAdmin);
	/**
	 * 修改管理员
	 * @param menu
	 * @return
	 */
	public Integer updateUserAdmin(UserAdmin userAdmin);
	/**
	 * 删除管理员
	 * @param menu
	 * @return
	 */
	public Integer deleteUserAdmin(UserAdmin userAdmin);
}
