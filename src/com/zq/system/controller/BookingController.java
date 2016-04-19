package com.zq.system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.zq.system.entity.Subject;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.BookingService;
import com.zq.system.service.DutyInfoService;
import com.zq.system.service.MenuService;

@Controller("BookingController")
@RequestMapping("booking")
public class BookingController extends BaseController{
	@Autowired
	private BookingService bookingService;
	@Autowired
	private DutyInfoService dutyInfoService;

	/**
	 * 添加预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addBooking", method=RequestMethod.POST)
	public Object addBooking(HttpServletRequest request,Booking booking){
		booking.setBooknow(new Date());
		booking.setBookingState("预约成功");
		bookingService.addBooking(booking);
		request.setAttribute("booking", booking);
		return "hospital/bookingQuery";
	}
	/**
	 * 添加预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addBookingAjax", method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public Object addBookingAjax(HttpServletRequest request){
		String data = request.getParameter("data");
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		Booking booking = (Booking) JSONObject.toBean(JSONObject.fromObject(data), Booking.class);
						
		Integer maxxuhao = bookingService.getBookingXuhao(booking);
		
		booking.setBookingId(booking.getBookingId());
		booking.setBookXuhao(maxxuhao+1);
		booking.setBooknow(new Date());
		booking.setBookingState("取号成功");
		bookingService.addBooking(booking);
		return "您的号码为"+(maxxuhao+1)+"请到相应科室就诊！";
	}
	/**
	 * 查询预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/queryBooking", method=RequestMethod.POST)
	public Object queryBooking(HttpServletRequest request,Booking booking){
		booking.setBookingState("预约成功");
		List<Booking> bookingList = bookingService.getBookingList(booking);
		request.setAttribute("bookingList", bookingList);
		return "hospital/bookingList";
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
	public Object queryPage(HttpServletRequest request) throws Exception{
		String data = request.getParameter("data");
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"}));
		Booking booking = (Booking) JSONObject.toBean(JSONObject.fromObject(data), Booking.class);
		Dto dto=WebUtil.getParamAsDto(request);
		Page<Booking> page =this.getPage(dto);
		Map params = new HashMap();
		if(booking !=null){
			params.put("bookingState", booking.getBookingState());
			params.put("booknow", booking.getBooknow());
			params.put("bookName", booking.getBookName());
			params.put("bookIdCard", booking.getBookIdCard());
			params.put("bookNum", booking.getBookNum());
			params.put("bookAddress", booking.getBookAddress());
		}
		page.setParams(params);
		List<Booking> user = bookingService.getPageBooking(page);
	    page.setData(user);
	    return page;
	}
	/**
	 * 修改预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateBooking", method=RequestMethod.GET)
	public Object updateBooking(HttpServletRequest request,Booking booking){
		booking.setBookingState("预约取消");
		bookingService.updateBooking(booking);
		Booking book = bookingService.getBookingList(booking).get(0);
		request.setAttribute("book", book);
		return "hospital/bookingQuery1";
	}
	/**
	 * 取号
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateBookingQ", method=RequestMethod.GET,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public Object updateBookingQ(HttpServletRequest request,Booking booking){
		booking = bookingService.getBooking(booking);
		Integer maxxuhao = bookingService.getBookingXuhao(booking);
		
		Booking book = new Booking();
		book.setBookingId(booking.getBookingId());
		book.setBookXuhao(maxxuhao+1);
		book.setBookingState("取号成功");
		bookingService.updateBooking(book);
		return "您的号码为"+(maxxuhao+1)+"请到相应科室就诊！";
	}
	/**
	 * 删除预约信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteBooking", method=RequestMethod.GET)
	@ResponseBody
	public Object deleteBooking(HttpServletRequest request,Booking booking){
		bookingService.deleteBooking(booking);
		return "success";
	}
	/**
	 * 跳转添加预约信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/jumbBooking", method=RequestMethod.GET)
	public Object jumbBooking(HttpServletRequest request,DutyInfo dutyInfo){
		DutyInfo duty = dutyInfoService.getDutyInfo(dutyInfo);
		Booking booking = new Booking();
		booking.setDoctorId(duty.getDoctorId());
		booking.setBookingState("预约成功");
		booking.setBooknow(duty.getDutyDate());
		int bookcount = bookingService.getBookCount(booking);
		if(duty.getMaxBookNum()>bookcount){
			request.setAttribute("doctorId", duty.getDoctorId());
			return "hospital/addBook";
		}else{
			request.setAttribute("message", "预约已满");
			return "hospital/BookError";
		}
	}
}
