package cn.pi.service;

import java.util.List;

import cn.pi.model.Friends;

public interface FriendsService {
	
	public List<Friends> findAllByUserId();
	
	public List<Friends> findSelect(String friendName, String friendPhone);
	
	public void deleteFriend(Friends friends);
	
	public void saveOrUpdate(Friends friends);
	
	public int friendsSum();
	
}
