package cn.pi.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import cn.pi.model.Calendar;
import cn.pi.model.Files;
import cn.pi.model.User;
import cn.pi.service.CalendarService;
import cn.pi.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CalendarAction extends ActionSupport implements ModelDriven<Calendar>,SessionAware {

	private static final long serialVersionUID = 1900957086513597761L;

	// 接收框架运行时候传入的代表session对象的map
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	private Calendar calendar = new Calendar();
	@Override
	public Calendar getModel() {
		// TODO Auto-generated method stub
		return calendar;
	}
	
	//需要spring注入 service 
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private CalendarService calendarService;
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	private int userId;	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	/**
	 * 日程列表
	 */
	public String list(){
		List<Calendar> calendarList = calendarService.findByUserId();
		session.put("calendarList", calendarList);
		return "calendarlist";
	}
	/**
	 * 日程的保存或修改
	 */
	public String souCalendar(){
		User user = userService.findByUserid(this.getUserId());
		calendar.setUser(user);
		calendarService.saveOrUpdate(calendar);
		List<Calendar> calendarList = calendarService.findByUserId();
		session.put("calendarList", calendarList);
		return "calendarlist";
	}
	/**
	 * 删除日程
	 */
	public String delete(){
		calendarService.deleteCalendar(calendar);
		List<Calendar> calendarList = calendarService.findByUserId();
		session.put("calendarList", calendarList);
		return "calendarlist";
	}
	
}
