package cn.pi.dao;

import java.util.List;

import cn.pi.model.Calendar;

public interface CalendarDao extends BaseDao<Calendar> {

	public List<Calendar> findByUserId();
	
	public void insert(Calendar calendar);
	
	public int calendarSum();
	
}
