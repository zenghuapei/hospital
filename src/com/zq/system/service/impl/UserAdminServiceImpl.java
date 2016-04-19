package com.zq.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.common.page.Page;
import com.zq.system.dao.UserAdminDao;
import com.zq.system.entity.UserAdmin;
import com.zq.system.service.UserAdminService;

@Service("userAdminService")
public class UserAdminServiceImpl implements UserAdminService{
	@Autowired
	private UserAdminDao userAdminDao;

	public UserAdmin getUserAdmin(UserAdmin userAdmin) {
		return userAdminDao.getUserAdmin(userAdmin);
	}

	public Integer addUserAdmin(UserAdmin userAdmin) {
		return userAdminDao.addUserAdmin(userAdmin);
	}

	public Integer updateUserAdmin(UserAdmin userAdmin) {
		return userAdminDao.updateUserAdmin(userAdmin);
	}

	public Integer deleteUserAdmin(UserAdmin userAdmin) {
		return userAdminDao.deleteUserAdmin(userAdmin);
	}

	public List<UserAdmin> getPageUserAdmin(Page page) {
		return userAdminDao.getPageUserAdmin(page);
	}

	
	
}
