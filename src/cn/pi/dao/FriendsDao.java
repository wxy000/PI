package cn.pi.dao;

import java.util.List;

import cn.pi.model.Friends;

public interface FriendsDao extends BaseDao<Friends>{
	
	public List<Friends> findAllByUserId();
	
	public List<Friends> findSelect(String friendName, String friendPhone);
	
	public void insert(Friends friends);
	
	public int friendsSum();
	
}
