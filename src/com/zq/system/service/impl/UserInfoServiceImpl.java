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

	public void deleteUserInfo(Long uid) {
		// TODO Auto-generated method stub
		
	}

	public void updateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		
	}

	public List<UserInfo> getPageUserInfo(Page page) {
		
		return userInfoDao.getPageUserInfo(page);
	}

	public List<UserInfo> getUserNeeded(Map<String, Object> likeCondition) {
		userInfoDao.getAllUserInfo(likeCondition);
		return null;
	}
	public UserInfo getOneUserInfo(String account) {
		
		return userInfoDao.getUserInfo(account);
	}
	
	
}
