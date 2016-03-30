package com.zq.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zq.common.page.Page;
import com.zq.system.entity.Booking;
import com.zq.system.entity.Menu;

@Repository
public interface BookingDao {
	 /**
	  * 查询所有预约信息
	 * @param userId
	 * @return
	 */
	 public List<Booking> getBookingList(Booking booking);
	
	/**
	 * 添加预约挂号
	 * @param menu
	 * @return
	 */
	public Integer addBooking(Booking booking);
}
