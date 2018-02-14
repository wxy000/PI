package cn.pi.service.impl;

import java.io.Serializable;
import java.util.List;

import cn.pi.dao.UserDao;
import cn.pi.model.User;
import cn.pi.service.UserService;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	@Override
	public User loginUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.login(user);
	}

	@Override
	public boolean register(User user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		List<User> list = this.userDao.findAll("and userName = ?", user.getUserName());
		//System.out.println(list.size());
		if(list.size() <= 0){
			this.userDao.register(user);
			flag = true;
		}
		return flag;
	}

	@Override
	public int updateUser(User user) {
		return this.userDao.updateUser(user);
	}

	@Override
	public User findByUserid(Serializable id) {
		// TODO Auto-generated method stub
		return this.userDao.findById(id);
	}

	@Override
	public int updateUserHeader(User user) {
		// TODO Auto-generated method stub
		return this.userDao.updateUserHeader(user);
	}

	@Override
	public int updateUserPwd(User user) {
		// TODO Auto-generated method stub
		return this.userDao.updateUserPwd(user);
	}
	
}
