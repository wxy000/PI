package cn.pi.service;

import java.io.Serializable;

import cn.pi.model.User;

public interface UserService {
	
	public User loginUser(User user);
	
	public boolean register(User user);
	
	public int updateUser(User user);
	
	public int updateUserHeader(User user);
	
	public int updateUserPwd(User user);
	
	public User findByUserid(Serializable id);
	
}
