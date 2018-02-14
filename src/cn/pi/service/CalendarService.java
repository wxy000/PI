package cn.pi.service;

import java.util.List;

import cn.pi.model.Calendar;

public interface CalendarService {

	public List<Calendar> findByUserId();
	
	public void saveOrUpdate(Calendar calendar);
	
	public void deleteCalendar(Calendar calendar);
	
	public int calendarSum();
	
}
