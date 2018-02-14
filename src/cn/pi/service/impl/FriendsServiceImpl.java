package cn.pi.service.impl;

import java.util.List;

import cn.pi.dao.FriendsDao;
import cn.pi.model.Friends;
import cn.pi.service.FriendsService;

public class FriendsServiceImpl implements FriendsService{
	
	private FriendsDao friendsDao;
	public void setFriendsDao(FriendsDao friendsDao) {
		this.friendsDao = friendsDao;
	}

	@Override
	public List<Friends> findAllByUserId() {
		// TODO Auto-generated method stub
		return this.friendsDao.findAllByUserId();
	}

	@Override
	public List<Friends> findSelect(String friendName, String friendPhone) {
		// TODO Auto-generated method stub
		return this.friendsDao.findSelect(friendName, friendPhone);
	}

	@Override
	public void deleteFriend(Friends friends) {
		// TODO Auto-generated method stub
		this.friendsDao.delete(friends);
	}

	@Override
	public void saveOrUpdate(Friends friends) {
		// TODO Auto-generated method stub
		if(friends.getFriendId() == null || "".equals(friends.getFriendId())){
			this.friendsDao.insert(friends);
		}else{
			this.friendsDao.update(friends);
		}
	}

	@Override
	public int friendsSum() {
		// TODO Auto-generated method stub
		return this.friendsDao.friendsSum();
	}
	
}
