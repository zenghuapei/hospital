package com.zq.system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zq.common.controller.BaseController;
import com.zq.system.entity.DoctorInfo;
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
	@RequestMapping(value="/queryDoctorInfo", method=RequestMethod.GET)
	public Object queryDoctorInfo(HttpServletRequest request,DoctorInfo doctorInfo){
//		String subjectId = request.getParameter("subjectId");
//		DoctorInfo do
		List<DoctorInfo> doctorList = doctorInfoService.getDoctorInfoList(doctorInfo);
		request.setAttribute("doctorList", doctorList);
		return "hospital/makeDoctor";
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
