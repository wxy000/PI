package cn.pi.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import cn.pi.dao.FriendsDao;
import cn.pi.model.Friends;
import cn.pi.model.User;
import cn.pi.utils.HibernateUtils;

public class FriendsDaoImpl extends BaseDaoImpl<Friends> implements FriendsDao {

	@Override
	public List<Friends> findAllByUserId() {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Friends where userId = ?";
		Object[] values = {user.getUserId()};
		@SuppressWarnings("unchecked")
		List<Friends> f = this.getHibernateTemplate().find(hql,values);
		return f;
	}

	@Override
	public List<Friends> findSelect(String friendName, String friendPhone) {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Friends where friendName like ? and friendPhone like ? and userId = ?";
		Object[] values = {"%"+friendName+"%","%"+friendPhone+"%",user.getUserId()};
		@SuppressWarnings("unchecked")
		List<Friends> f1 = this.getHibernateTemplate().find(hql,values);
		return f1;
	}

	@Override
	public void insert(Friends friends) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		Friends f = new Friends();
		f.setFriendName(friends.getFriendName());
		f.setFriendPhone(friends.getFriendPhone());
		f.setFriendCompany(friends.getFriendCompany());
		f.setFriendQq(friends.getFriendQq());
		f.setFriendEmail(friends.getFriendEmail());
		f.setUser(friends.getUser());
		session.save(f);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public int friendsSum() {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Friends where userId = ?";
		Object[] values = {user.getUserId()};
		@SuppressWarnings("unchecked")
		List<Friends> ff = this.getHibernateTemplate().find(hql,values);
		return ff.size();
	}
	
}
