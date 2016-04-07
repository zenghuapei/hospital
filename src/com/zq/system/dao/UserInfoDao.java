package com.zq.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.zq.common.page.Page;
import com.zq.system.entity.UserInfo;

@Repository
public interface UserInfoDao {
	/**
	 * 添加用户
	 * @param userInfo
	 */
	public void insertUserInfo(UserInfo userInfo);
	/**
	 * 修改用户
	 * @param userInfo
	 */
	public void updateUserInfo(UserInfo userInfo);
	/**
	 * 删除用户
	 * @param userInfo
	 */
	public void deleteUserInfo(UserInfo userInfo);
	/**
	 * 
	 * 分页查询
	 * @param page
	 * @return
	 */
	public List<UserInfo> getPageUserInfo(Page page);
	/**
	 * 查询单个用户对象
	 * @param account
	 * @return
	 */
	public UserInfo getUserInfo(String account);
	
	/**
	 * 主键查询
	 * @param userInfo
	 * @return
	 */
	public UserInfo getUserId(UserInfo userInfo);
}
