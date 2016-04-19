package com.zq.system.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zq.common.page.Page;
import com.zq.system.entity.UserAdmin;

@Repository
public interface UserAdminService {
	 /**
	  * 查询管理员信息
	 * @param userId
	 * @return
	 */
	 public UserAdmin getUserAdmin(UserAdmin userAdmin);
	
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
	 /**
	  * 查询分页信息
	 * @param page
	 * @return
	 */
	public List<UserAdmin> getPageUserAdmin(Page page);
}
