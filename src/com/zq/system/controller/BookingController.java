package com.zq.system.controller;

import java.util.Date;
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
import com.zq.system.entity.Booking;
import com.zq.system.entity.Menu;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.BookingService;
import com.zq.system.service.MenuService;

@Controller("BookingController")
@RequestMapping("booking")
public class BookingController extends BaseController{
	@Autowired
	private BookingService bookingService;
	

	/**
	 * 添加预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addBooking", method=RequestMethod.POST)
	public Object addBooking(HttpServletRequest request,Booking booking){
		booking.setBooknow(new Date());
		bookingService.addBooking(booking);
		return "hospital/bookingQuery";
	}
	/**
	 * 查询预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryBooking", method=RequestMethod.POST)
	public Object queryBooking(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 修改预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateBooking", method=RequestMethod.POST)
	public Object updateBooking(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 删除预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteBooking", method=RequestMethod.POST)
	public Object deleteBooking(HttpServletRequest request){
		
		return "";
	}
	/**
	 * 删除预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/jumbBooking", method=RequestMethod.GET)
	public Object jumbBooking(HttpServletRequest request){
		String doctorId = request.getParameter("doctorId");
		request.setAttribute("doctorId", doctorId);
		return "hospital/addBook";
	}
}
