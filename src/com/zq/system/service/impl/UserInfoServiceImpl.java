package com.zq.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.UserInfoDao;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.UserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	private UserInfoDao userInfoDao;

	public void insertUserInfo(UserInfo userInfo) {
		userInfoDao.insertUserInfo(userInfo);
	}

	public void deleteUserInfo(UserInfo userInfo) {
		userInfoDao.deleteUserInfo(userInfo);
		
	}

	public void updateUserInfo(UserInfo userInfo) {
		userInfoDao.updateUserInfo(userInfo);
		
	}

	public List<UserInfo> getPageUserInfo(Page page) {
		
		return userInfoDao.getPageUserInfo(page);
	}
	public UserInfo getOneUserInfo(String account) {
		
		return userInfoDao.getUserInfo(account);
	}

	public UserInfo getUserId(UserInfo userInfo) {
		
		return userInfoDao.getUserId(userInfo);
	}
	
	
}
