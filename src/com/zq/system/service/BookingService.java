package com.zq.system.service;

import java.util.List;

import com.zq.common.page.Page;
import com.zq.system.entity.Booking;
import com.zq.system.entity.Menu;
import com.zq.system.entity.Subject;

public interface BookingService {
	 /**
	  * 查询所有预约信息
	 * @param userId
	 * @return
	 */
	 public List<Booking> getBookingList(Booking booking);
	 /**
	  * 查询预约信息
	 * @param userId
	 * @return
	 */
	 public Booking getBooking(Booking booking);
	/**
	 * 添加预约挂号
	 * @param menu
	 * @return
	 */
	public Integer addBooking(Booking booking);
	/**
	 * 修改预约挂号
	 * @param menu
	 * @return
	 */
	public Integer updateBooking(Booking booking);
	/**
	 * 查询预约数
	 * @param booking
	 * @return
	 */
	public Integer getBookCount(Booking booking);
	 /**
	  * 查询分页信息
	 * @param page
	 * @return
	 */
	public List<Booking> getPageBooking(Page page);
	/**
	 * 删除预约挂号
	 * @param menu
	 * @return
	 */
	public Integer deleteBooking(Booking booking);
	/**
	 * 查询排位号
	 * @param booking
	 * @return
	 */
	public Integer getBookingXuhao(Booking booking);
}
