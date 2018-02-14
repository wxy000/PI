package cn.pi.model;

public class Calendar {

	private Integer calendarid;
	private String start_time;
	private String end_time;
	private String calendartitle;
	private String calendarcontent;
	private User user;
	
	public Integer getCalendarid() {
		return calendarid;
	}
	public void setCalendarid(Integer calendarid) {
		this.calendarid = calendarid;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getCalendartitle() {
		return calendartitle;
	}
	public void setCalendartitle(String calendartitle) {
		this.calendartitle = calendartitle;
	}
	public String getCalendarcontent() {
		return calendarcontent;
	}
	public void setCalendarcontent(String calendarcontent) {
		this.calendarcontent = calendarcontent;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
