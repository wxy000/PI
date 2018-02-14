package cn.pi.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import cn.pi.dao.FilesDao;
import cn.pi.model.Files;
import cn.pi.model.User;
import cn.pi.utils.HibernateUtils;

public class FilesDaoImpl extends BaseDaoImpl<Files> implements FilesDao {

	@Override
	public List<Files> findByUserIdAndType(int type) {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Files where userId = ? and type = ?";
		Object[] values = {user.getUserId(),type};
		@SuppressWarnings("unchecked")
		List<Files> f = this.getHibernateTemplate().find(hql,values);
		return f;
	}

	@Override
	public void insert(Files files) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		Files f = new Files();
		f.setFilename(files.getFilename());
		f.setSinger(files.getSinger());
		f.setAuthor(files.getAuthor());
		f.setTime(files.getTime());
		f.setPath(files.getPath());
		f.setType(files.getType());
		f.setUser(files.getUser());
		session.save(f);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Files> findByPathAndUserId(String path) {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Files where userId = ? and path = ?";
		Object[] values = {user.getUserId(),path};
		@SuppressWarnings("unchecked")
		List<Files> f = this.getHibernateTemplate().find(hql,values);
		return f;
	}

	@Override
	public int filesSum(int type) {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		String hql = "from Files where userId = ? and type = ?";
		Object[] values = {user.getUserId(),type};
		@SuppressWarnings("unchecked")
		List<Files> f = this.getHibernateTemplate().find(hql,values);
		return f.size();
	}

}
