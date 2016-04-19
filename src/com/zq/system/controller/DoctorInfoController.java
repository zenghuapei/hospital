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
import com.zq.system.entity.DoctorInfo;
import com.zq.system.entity.UserInfo;
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
	@ResponseBody
	public Object addDoctorInfo(HttpServletRequest request,DoctorInfo doctorInfo){
		String data = request.getParameter("data");
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		DoctorInfo doctor = (DoctorInfo) JSONObject.toBean(JSONObject.fromObject(data), DoctorInfo.class);
		doctorInfoService.addDoctorInfo(doctor);
		return "success";
	}
	/**
	 * 查询医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDoctorInfo", method=RequestMethod.GET)
	public Object queryDoctorInfo(HttpServletRequest request,DoctorInfo doctorInfo){
		List<DoctorInfo> doctorList = doctorInfoService.getDoctorInfoList(doctorInfo);
		request.setAttribute("doctorList", doctorList);
		return "hospital/makeDoctor";
	}
	/**
	 * 查询医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDoctorInfoAjax", method=RequestMethod.GET)
	@ResponseBody
	public Object queryDoctorInfoAjax(HttpServletRequest request,DoctorInfo doctorInfo){
		List<DoctorInfo> doctorList = doctorInfoService.getDoctorInfoList(doctorInfo);
		return doctorList;
	}
	/**
	 * 修改医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateDoctorInfo", method=RequestMethod.POST)
	@ResponseBody
	public Object updateDoctorInfo(HttpServletRequest request){
		String data = request.getParameter("data");
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		DoctorInfo doctor = (DoctorInfo) JSONObject.toBean(JSONObject.fromObject(data), DoctorInfo.class);
		doctorInfoService.updateDoctorInfo(doctor);
		return "success";
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
	public Object queryPage(HttpServletRequest request,DoctorInfo doctorInfo) throws Exception{
		Dto dto=WebUtil.getParamAsDto(request);
		Page<DoctorInfo> page =this.getPage(dto);
		Map params = new HashMap();
		params.put("doctorName", doctorInfo.getDoctorName());
		page.setParams(params);
		List<DoctorInfo> doctor = doctorInfoService.getPageDoctorInfo(page);
	    page.setData(doctor);
	    
	    return page;
	}
	/**
	 * 删除医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteDoctorInfo", method=RequestMethod.GET)
	@ResponseBody
	public Object deleteDoctorInfo(HttpServletRequest request,DoctorInfo doctorInfo){
		doctorInfoService.deleteDoctorInfo(doctorInfo);
		return "success";
	}
	/**
	 * 查询医生信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDoctor", method=RequestMethod.GET)
	@ResponseBody
	public Object queryDoctor(HttpServletRequest request,DoctorInfo doctorInfo){
		DoctorInfo doctor = doctorInfoService.getDoctorInfo(doctorInfo);
		return doctor;
	}
}
