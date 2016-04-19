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
import com.zq.system.entity.Subject;
import com.zq.system.entity.UserAdmin;
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
	@ResponseBody
	public Object addSubject(HttpServletRequest request){
		String data = request.getParameter("data");
		
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		Subject subject = (Subject) JSONObject.toBean(JSONObject.fromObject(data), Subject.class);
		subject.setSubjectLevel(2);
		subjectService.addSubject(subject);
		return "success";
	}
	/**
	 * 查询科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/querySubject", method=RequestMethod.GET)
	public Object querySubject(HttpServletRequest request){
		List<Subject> subjectList = subjectService.getSubjectList(1);
		request.setAttribute("subjectList", subjectList);
		return "hospital/make";
	}
	/**
	 * 查询科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/querySubjectDe", method=RequestMethod.GET)
	@ResponseBody
	public Object querySubjectDe(HttpServletRequest request,Subject subject){
		Subject subjectList = subjectService.getSubject(subject);
		return subjectList;
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
	public Object queryPage(HttpServletRequest request,Subject subject) throws Exception{
		Dto dto=WebUtil.getParamAsDto(request);
		Page<Subject> page =this.getPage(dto);
		Map params = new HashMap();
		params.put("subjectLevel", 1);
		params.put("subjectName", subject.getSubjectName());
		page.setParams(params);
		List<Subject> user = subjectService.getPageSubject(page);
	    page.setData(user);
	    return page;
	}
	/**
	 * 修改科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateSubject", method=RequestMethod.POST)
	@ResponseBody
	public Object updateSubject(HttpServletRequest request){
		String data = request.getParameter("data");
		
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		Subject subject = (Subject) JSONObject.toBean(JSONObject.fromObject(data), Subject.class);
		subjectService.updateSubject(subject);
		return "success";
	}
	/**
	 * 删除科室信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteSubject", method=RequestMethod.GET)
	@ResponseBody
	public Object deleteSubject(HttpServletRequest request,Subject subject){
		subjectService.deleteSubject(subject);
		return "success";
	}
	/**
	 * 查询科室一级信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/querySubjectSelect", method=RequestMethod.GET)
	@ResponseBody
	public Object querySubjectSelect(HttpServletRequest request){
		List<Subject> subjectlevel = subjectService.getSubjectList();
		return subjectlevel;
	}
	/**
	 * 查询科室下一级信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/querySubjectSubset", method=RequestMethod.GET)
	@ResponseBody
	public Object querySubjectSubset(HttpServletRequest request,Subject subject){
		List<Subject> subjectlevel = subjectService.getParentSubjectList(subject.getParentId());
		return subjectlevel;
	}
}
