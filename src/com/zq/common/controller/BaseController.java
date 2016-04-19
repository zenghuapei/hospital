package com.zq.common.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.zq.common.dto.Dto;
import com.zq.common.page.Page;
import com.zq.common.util.WebUtil;


public class BaseController{
	
	public final static String SUCCESS ="success";  
	
	public final static String MSG ="msg";  
	
	
	public final static String DATA ="data";  
	
	public final static String LOGOUT_FLAG = "logoutFlag";  
	
	
 
	 
	 /**
	  * 获取IP地址
	  * @param request
	  * @return
	  */
	 public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	/**
	 * 获取Page对象
	 * @param <T>
	 * @param request
	 * @param beanClass
	 * @return
	 */
	public Page getPage(Dto dto){
		
		//Dto dto=WebUtil.getParamAsDto(request);
		Page page = new Page();
		page.setPageIndex(Integer.parseInt(dto.get("pageIndex").toString()));
		page.setPageSize(Integer.parseInt(dto.get("pageSize").toString()));
		page.setSortField(dto.get("sortField").toString());
		//page.setTotalPage(1);
		page.setSortOrder(dto.get("sortOrder").toString());
		return page;
	} 

	public ModelAndView forword(String viewName,Map context){
		return new ModelAndView(viewName,context); 
	}
	
	public ModelAndView error(String errMsg){
		return new ModelAndView("error"); 
	}
	  /** 
     * 根据日期获得星期 
     * @param date 
     * @return 
     */ 
	public static String getWeekOfDate(Date date) { 
	  String[] weekDaysName = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" }; 
	  String[] weekDaysCode = { "0", "1", "2", "3", "4", "5", "6" }; 
	  Calendar calendar = Calendar.getInstance(); 
	  calendar.setTime(date); 
	  int intWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1; 
	  return weekDaysName[intWeek]; 
}

}
