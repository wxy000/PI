package cn.pi.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import cn.pi.dao.UserDao;
import cn.pi.model.User;
import cn.pi.utils.HibernateUtils;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		String hql = "from User where userName = ? and password = ?";
		Object[] values = {user.getUserName(),user.getPassword()};
		@SuppressWarnings("unchecked")
		List<User> u = this.getHibernateTemplate().find(hql,values);
		return u.size() == 0 ? null : u.get(0);
	}

	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		User u = new User();
		u.setUserName(user.getUserName());
		u.setPassword(user.getPassword());
		u.setEmail(user.getEmail());
		session.save(u);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		String hql="update User user set user.realName = '"+user.getRealName()+"',user.sex = '"+user.getSex()+"',user.work = '"+user.getWork()+"',user.phone = '"+user.getPhone()+"',user.email = '"+user.getEmail()+"',user.notes = '"+user.getNotes()+"' where user.userId = "+user.getUserId()+"";
		Query queryupdate=session.createQuery(hql);
		int ret=queryupdate.executeUpdate();
		session.getTransaction().commit();
		session.close();
		return ret;
	}

	@Override
	public int updateUserHeader(User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		String hql="update User user set user.photopath = '"+user.getPhotopath()+"' where user.userId = "+user.getUserId()+"";
		Query queryupdate=session.createQuery(hql);
		int ret=queryupdate.executeUpdate();
		session.getTransaction().commit();
		session.close();
		return ret;
	}

	@Override
	public int updateUserPwd(User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		String hql="update User user set user.password = '"+user.getPassword()+"' where user.userId = "+user.getUserId()+"";
		Query queryupdate=session.createQuery(hql);
		int ret=queryupdate.executeUpdate();
		session.getTransaction().commit();
		session.close();
		return ret;
	}
	
}
