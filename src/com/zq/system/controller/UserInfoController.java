package com.zq.system.controller;

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
import com.zq.system.entity.UserInfo;
import com.zq.system.service.UserInfoService;
import com.zq.system.util.CommonConstants;

@Controller("UserInfoController")
@RequestMapping("userInfo")
public class UserInfoController  extends BaseController{

	
	@Autowired
	private UserInfoService userInfoService;
	
	/**
	 * 
	 * 根据Id查询用户信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/queryUserInfo", method=RequestMethod.POST)
	public Object queryUserInfo(HttpServletRequest request,UserInfo userInfo) throws Exception{
		
		return "";
	}
	/**
	 * 
	 * 修改用户信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateUserInfo", method=RequestMethod.POST)
	public Object updateUserInfo(HttpServletRequest request,UserInfo userInfo) throws Exception{
		userInfoService.updateUserInfo(userInfo);
		UserInfo user = userInfoService.getUserId(userInfo);
		request.getSession().setAttribute(CommonConstants.SEESION_MEMBER, user);
		return "hospital/updateUser";
	}
	/**
	 * 
	 * 修改密码信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updatePassword", method=RequestMethod.POST)
	public Object updatePassword(HttpServletRequest request,UserInfo userInfo) throws Exception{
		UserInfo user =(UserInfo) request.getSession().getAttribute(CommonConstants.SEESION_MEMBER);
		if(user.getPassword().equals(userInfo.getYpassWord())){
			userInfoService.updateUserInfo(userInfo);
		}else{
			request.setAttribute("message", "原密码错误！");
			return "hospital/updatePassword";
		}
		return "../login1";
	}
	/**
	 * 
	 *添加信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addUserInfo", method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public Object addUserInfo(HttpServletRequest request) throws Exception{
		String data = request.getParameter("data");
		
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		UserInfo userinfo = (UserInfo) JSONObject.toBean(JSONObject.fromObject(data), UserInfo.class);
		userinfo.setUserType(1);
		userinfo.setUserName(userinfo.getAccount());
		userInfoService.insertUserInfo(userinfo);
		request.setAttribute("userInfo", userinfo);
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
	public Object queryPage(HttpServletRequest request,UserInfo userInfo) throws Exception{
		Dto dto=WebUtil.getParamAsDto(request);
		Page<UserInfo> page =this.getPage(dto);
		Map params = new HashMap();
		params.put("userName", userInfo.getUserName());
		page.setParams(params);
		List<UserInfo> user = userInfoService.getPageUserInfo(page);
	    page.setData(user);
	    
	    return page;
	}
	/**
	 * 删除医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteUserInfo", method=RequestMethod.GET)
	@ResponseBody
	public Object deleteUserInfo(HttpServletRequest request,UserInfo userInfo){
		userInfoService.deleteUserInfo(userInfo);
		return "seccess";
	}
}
