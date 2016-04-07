package com.zq.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zq.system.dao.BookingDao;
import com.zq.system.entity.Booking;
import com.zq.system.service.BookingService;
@Service("bookingService")
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDao bookingDao;

	public List<Booking> getBookingList(Booking booking) {
		
		return bookingDao.getBookingList(booking);
	}

	public Integer addBooking(Booking booking) {
		return bookingDao.addBooking(booking);
	}

	public Integer updateBooking(Booking booking) {
		
		return bookingDao.updateBooking(booking);
	}

	public Integer getBookCount(Booking booking) {
		
		return bookingDao.getBookCount(booking);
	}

}
