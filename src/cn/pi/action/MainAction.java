package cn.pi.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import cn.pi.service.CalendarService;
import cn.pi.service.FilesService;
import cn.pi.service.FriendsService;

import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;
	
	// 接收框架运行时候传入的代表session对象的map
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	private FilesService filesService;
	public void setFilesService(FilesService filesService) {
		this.filesService = filesService;
	}
	private FriendsService friendsService;
	public void setFriendsService(FriendsService friendsService){
		this.friendsService = friendsService;
	}
	private CalendarService calendarService;
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

	public String execute() throws Exception{
		int calendarSum = this.calendarService.calendarSum();
		session.put("calendarSum", calendarSum);
		int friendsSum = this.friendsService.friendsSum();
		session.put("friendsSum", friendsSum);
		int filesSum1 = this.filesService.filesSum(1);
		session.put("filesSum1", filesSum1);
		int filesSum2 = this.filesService.filesSum(2);
		session.put("filesSum2", filesSum2);
		int filesSum3 = this.filesService.filesSum(3);
		session.put("filesSum3", filesSum3);
		int filesSum4 = this.filesService.filesSum(4);
		session.put("filesSum4", filesSum4);
		return "mainx";		
	}
	
}
