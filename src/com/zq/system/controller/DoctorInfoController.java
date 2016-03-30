package com.zq.system.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zq.common.controller.BaseController;
import com.zq.system.service.DoctorInfoService;

@Controller("DoctorInfoController")
@RequestMapping("doctorInfo")
public class DoctorInfoController extends BaseController{
	@Autowired
	private DoctorInfoService doctorInfoService;

	/**
	 * 添加医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addDoctorInfo", method=RequestMethod.POST)
	public Object addDoctorInfo(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 查询医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDoctorInfo", method=RequestMethod.POST)
	public Object queryDoctorInfo(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 修改医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateDoctorInfo", method=RequestMethod.POST)
	public Object updateDoctorInfo(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 删除医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteDoctorInfo", method=RequestMethod.POST)
	public Object deleteDoctorInfo(HttpServletRequest request){
		
		return "";
	}
}
