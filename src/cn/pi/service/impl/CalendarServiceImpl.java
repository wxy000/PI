package cn.pi.service.impl;

import java.util.List;

import cn.pi.dao.CalendarDao;
import cn.pi.model.Calendar;
import cn.pi.service.CalendarService;

public class CalendarServiceImpl implements CalendarService {
	
	private CalendarDao calendarDao;
	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
	}

	@Override
	public List<Calendar> findByUserId() {
		// TODO Auto-generated method stub
		return this.calendarDao.findByUserId();
	}

	@Override
	public void saveOrUpdate(Calendar calendar) {
		// TODO Auto-generated method stub
		if(calendar.getCalendarid() == null || "".equals(calendar.getCalendarid())){
			this.calendarDao.insert(calendar);
		}else{
			this.calendarDao.update(calendar);
		}
	}

	@Override
	public void deleteCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		this.calendarDao.delete(calendar);
	}

	@Override
	public int calendarSum() {
		// TODO Auto-generated method stub
		return this.calendarDao.calendarSum();
	}

}
