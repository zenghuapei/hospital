package com.zq.system.controller;

import java.util.List;

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
import com.zq.system.entity.DoctorInfo;
import com.zq.system.entity.DutyInfo;
import com.zq.system.entity.Menu;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.BookingService;
import com.zq.system.service.DutyInfoService;
import com.zq.system.service.MenuService;

@Controller("DutyInfoController")
@RequestMapping("dutyInfo")
public class DutyInfoController extends BaseController{
	@Autowired
	private DutyInfoService dutyInfoService;
	

	/**
	 * 添加值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addDutyInfo", method=RequestMethod.POST)
	public Object addDutyInfo(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 查询值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDutyInfo", method=RequestMethod.GET)
	public Object queryDutyInfo(HttpServletRequest request,DutyInfo dutyInfo){
		DoctorInfo doctorInfo = dutyInfoService.getDutyInfoList(dutyInfo);
		request.setAttribute("doctorInfo", doctorInfo);
		return "hospital/makeDuty";
	}
	/**
	 * 修改值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateDutyInfo", method=RequestMethod.POST)
	public Object updateDutyInfo(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 删除值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteDutyInfo", method=RequestMethod.POST)
	public Object deleteDutyInfo(HttpServletRequest request){
		
		return "";
	}
}
