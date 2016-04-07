package com.zq.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.UserAdminDao;
import com.zq.system.dao.UserInfoDao;
import com.zq.system.entity.UserAdmin;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.UserAdminService;
import com.zq.system.service.UserInfoService;

@Service("userAdminService")
public class UserAdminServiceImpl implements UserAdminService{
	@Autowired
	private UserAdminDao userAdminDao;

	public UserAdmin getUserAdmin(String account) {
		// TODO Auto-generated method stub
		return userAdminDao.getUserAdmin(account);
	}

	public Integer addUserAdmin(UserAdmin userAdmin) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer updateUserAdmin(UserAdmin userAdmin) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer deleteUserAdmin(UserAdmin userAdmin) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
