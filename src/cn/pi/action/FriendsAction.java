package cn.pi.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import cn.pi.model.Friends;
import cn.pi.model.User;
import cn.pi.service.FriendsService;
import cn.pi.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FriendsAction extends ActionSupport implements ModelDriven<Friends>,SessionAware{

	private static final long serialVersionUID = 1900957086513597761L;
	
	private Friends friends = new Friends();
	@Override
	public Friends getModel() {
		// TODO Auto-generated method stub
		return friends;
	}
	
	//需要spring注入 service 
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private FriendsService friendsService;
	public void setFriendsService(FriendsService friendsService){
		this.friendsService = friendsService;
	}

	// 接收框架运行时候传入的代表session对象的map
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	private int userId;	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	/**
	 * 所有联系人列表
	 */
	public String list(){
		List<Friends> friendsList = friendsService.findAllByUserId();
		session.put("friendsList", friendsList);
		return "friendslist";
	}
	/**
	 * 通过姓名及电话号码查询
	 */
	public String selectList(){
		List<Friends> selectList = friendsService.findSelect(friends.getFriendName(), friends.getFriendPhone());
		session.put("friendsList", selectList);
		return "friendslist";
	}
	/**
	 * 删除联系人
	 */
	public String deleteFriend(){
		friendsService.deleteFriend(friends);
		List<Friends> friendsList = friendsService.findAllByUserId();
		session.put("friendsList", friendsList);
		return "friendslist";
	}
	/**
	 * 新增或修改联系人
	 */
	public String souFriend(){
		User user = userService.findByUserid(this.getUserId());
		friends.setUser(user);
		friendsService.saveOrUpdate(friends);
		List<Friends> friendsList = friendsService.findAllByUserId();
		session.put("friendsList", friendsList);
		return "friendslist";
	}

}
