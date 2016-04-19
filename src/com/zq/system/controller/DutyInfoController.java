package com.zq.system.controller;

import java.text.SimpleDateFormat;
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
import com.zq.system.entity.Booking;
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
	@ResponseBody
	public Object addDutyInfo(HttpServletRequest request){
		String data = request.getParameter("data");
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		DutyInfo dutyInfo = (DutyInfo) JSONObject.toBean(JSONObject.fromObject(data), DutyInfo.class);
		String dutyInterval =  this.getWeekOfDate(dutyInfo.getDutyDate());
		dutyInfo.setDutyInterval(dutyInterval);
		dutyInfoService.addDutyInfo(dutyInfo);
		return "success";
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
	 * 查询值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDutyInfoUpdate", method=RequestMethod.GET)
	@ResponseBody
	public Object queryDutyInfoUpdate(HttpServletRequest request,DutyInfo dutyInfo){
		DutyInfo duty = dutyInfoService.getDutyInfo(dutyInfo);
		return duty;
	}
	/**
	 * 查询值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryDutyInfoAjax", method=RequestMethod.GET)
	@ResponseBody
	public Object queryDutyInfoAjax(HttpServletRequest request,DutyInfo dutyInfo){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<DutyInfo> duty = dutyInfoService.getDutyInfoListAjax(dutyInfo);
		for (int i = 0; i < duty.size(); i++) {
			DutyInfo info = duty.get(i);
			info.setDutyDateStr(sdf.format(info.getDutyDate()));
			duty.set(i, info);
		}
		return duty;
	}
	/**
	 * 修改值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateDutyInfo", method=RequestMethod.POST)
	@ResponseBody
	public Object updateDutyInfo(HttpServletRequest request){
		String data = request.getParameter("data");
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		DutyInfo dutyInfo = (DutyInfo) JSONObject.toBean(JSONObject.fromObject(data), DutyInfo.class);
		dutyInfoService.updateDutyInfo(dutyInfo);
		return "success";
	}
	/**
	 * 删除值班信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteDutyInfo", method=RequestMethod.GET)
	@ResponseBody
	public Object deleteDutyInfo(HttpServletRequest request,DutyInfo dutyInfo){
		dutyInfoService.deleteDutyInfo(dutyInfo);
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
	public Object queryPage(HttpServletRequest request,DutyInfo dutyInfo) throws Exception{
		Dto dto=WebUtil.getParamAsDto(request);
		Page<DutyInfo> page =this.getPage(dto);
		Map params = new HashMap();
		params.put("dutyDate", dutyInfo.getDutyDate());
		page.setParams(params);
		List<DutyInfo> doctor = dutyInfoService.getPageDutyInfo(page);
	    page.setData(doctor);
	    
	    return page;
	}
}
