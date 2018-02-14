package cn.pi.dao;

import cn.pi.model.User;

public interface UserDao extends BaseDao<User>{
	
	public User login(User user);
	
	public void register(User user);
	
	public int updateUser(User user);
	
	public int updateUserHeader(User user);
	
	public int updateUserPwd(User user);

}