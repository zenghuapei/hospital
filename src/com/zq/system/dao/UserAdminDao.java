package com.zq.system.dao;

import org.springframework.stereotype.Repository;

import com.zq.system.entity.UserAdmin;

@Repository
public interface UserAdminDao {
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
