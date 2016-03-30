package com.zq.system.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zq.common.controller.BaseController;
import com.zq.system.service.SubjectService;

@Controller("SubjectController")
@RequestMapping("subject")
public class SubjectController extends BaseController{
	@Autowired
	private SubjectService subjectService;
	
	
	
	/**
	 * 添加科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addSubject", method=RequestMethod.POST)
	public Object addSubject(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 查询科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/querySubject", method=RequestMethod.POST)
	public Object querySubject(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 修改科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateSubject", method=RequestMethod.POST)
	public Object updateSubject(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 删除科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteSubject", method=RequestMethod.POST)
	public Object deleteSubject(HttpServletRequest request){
		
		return "";
	}
}
