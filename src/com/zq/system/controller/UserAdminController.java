package com.zq.system.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zq.common.controller.BaseController;
import com.zq.common.dto.Dto;
import com.zq.common.page.Page;
import com.zq.common.util.WebUtil;
import com.zq.system.entity.UserAdmin;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.UserAdminService;
import com.zq.system.service.UserInfoService;
import com.zq.system.util.CommonConstants;

@Controller("UserAdminController")
@RequestMapping("userAdmin")
public class UserAdminController  extends BaseController{

	
	@Autowired
	private UserAdminService userAdminService;
	
	/**
	 * 
	 * 根据Id查询用户信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/queryUserAdmin", method=RequestMethod.GET)
	@ResponseBody
	public Object queryUserAdmin(HttpServletRequest request,UserAdmin userAdmin) throws Exception{
		UserAdmin user =  userAdminService.getUserAdmin(userAdmin);
		return user;
	}
	/**
	 * 
	 * 修改用户信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateUserAdmin", method=RequestMethod.POST)
	@ResponseBody
	public Object updateUserAdmin(HttpServletRequest request) throws Exception{
		String data = request.getParameter("data");
		
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		UserAdmin userAdmin = (UserAdmin) JSONObject.toBean(JSONObject.fromObject(data), UserAdmin.class);
		userAdminService.updateUserAdmin(userAdmin);
		return "succcess";
	}
	
	/**
	 * 
	 *添加信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addUserAdmin", method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public Object addUserAdmin(HttpServletRequest request) throws Exception{
		String data = request.getParameter("data");
		
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		UserAdmin userAdmin = (UserAdmin) JSONObject.toBean(JSONObject.fromObject(data), UserAdmin.class);
		userAdmin.setAdminRegister(new Date());
		userAdminService.addUserAdmin(userAdmin);
		return "注册成功";
	}
	/**
	 * 
	 *分页查询
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/queryPage", method=RequestMethod.POST)
	@ResponseBody
	public Object queryPage(HttpServletRequest request,UserAdmin userAdmin) throws Exception{
		Dto dto=WebUtil.getParamAsDto(request);
		Page<UserAdmin> page =this.getPage(dto);
		Map params = new HashMap();
		params.put("adminName", userAdmin.getAdminName());
		page.setParams(params);
		List<UserAdmin> user = userAdminService.getPageUserAdmin(page);
	    page.setData(user);
	    return page;
	}
	/**
	 * 删除医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteUserAdmin", method=RequestMethod.GET)
	@ResponseBody
	public Object deleteUserAdmin(HttpServletRequest request,UserAdmin userAdmin){
		userAdminService.deleteUserAdmin(userAdmin);
		return "seccess";
	}
}
