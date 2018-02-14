package cn.pi.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import cn.pi.dao.CalendarDao;
import cn.pi.model.Calendar;
import cn.pi.model.User;
import cn.pi.utils.HibernateUtils;

public class CalendarDaoImpl extends BaseDaoImpl<Calendar> implements CalendarDao {

	@Override
	public List<Calendar> findByUserId() {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Calendar where userId = ? ORDER BY start_time ASC";
		Object[] values = {user.getUserId()};
		@SuppressWarnings("unchecked")
		List<Calendar> c = this.getHibernateTemplate().find(hql, values);
		return c;
	}

	@Override
	public void insert(Calendar calendar) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		Calendar c = new Calendar();
		c.setCalendartitle(calendar.getCalendartitle());
		c.setStart_time(calendar.getStart_time());
		c.setEnd_time(calendar.getEnd_time());
		c.setCalendarcontent(calendar.getCalendarcontent());
		c.setUser(calendar.getUser());
		session.save(c);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public int calendarSum() {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Calendar where userId = ? and start_time > sysdate()";
		Object[] values = {user.getUserId()};
		@SuppressWarnings("unchecked")
		List<Calendar> c = this.getHibernateTemplate().find(hql, values);
		return c.size();
	}

}
