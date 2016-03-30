package com.zq.system.service;

import java.util.List;
import java.util.Map;

import com.zq.common.page.Page;
import com.zq.system.entity.UserInfo;

public interface UserInfoService {
	/**
	 * 添加用户
	 * @param userInfo
	 */
	public void insertUserInfo(UserInfo userInfo);
	/**
	 * 删除用户
	 * @param uid
	 */
	public void deleteUserInfo(Long uid);
	/**
	 * 修改用户
	 * @param userInfo
	 */
	public void updateUserInfo(UserInfo userInfo);
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	public List<UserInfo> getPageUserInfo(Page page);
	/**
	 * @param likeCondition
	 * @return
	 */
	public List<UserInfo> getUserNeeded(Map<String, Object> likeCondition);
	/**
	 * 根据账号查询用户
	 * @param account
	 * @return
	 */
	public UserInfo getOneUserInfo(String account);
}
