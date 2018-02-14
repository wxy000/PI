package cn.pi.model;

public class Friends {
	private Integer friendId;
	private String friendName;
	private String friendPhone;
	private String friendCompany;
	private String friendQq;
	private String friendEmail;
	private User user;
	
	public Friends() {
		super();
	}
	
	public Friends(String friendName, String friendPhone, String friendCompany,
			String friendQq, User user) {
		super();
		this.friendName = friendName;
		this.friendPhone = friendPhone;
		this.friendCompany = friendCompany;
		this.friendQq = friendQq;
		this.user = user;
	}

	public Integer getFriendId() {
		return friendId;
	}
	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}
	public String getFriendName() {
		return friendName;
	}
	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	public String getFriendPhone() {
		return friendPhone;
	}
	public void setFriendPhone(String friendPhone) {
		this.friendPhone = friendPhone;
	}
	public String getFriendCompany() {
		return friendCompany;
	}
	public void setFriendCompany(String friendCompany) {
		this.friendCompany = friendCompany;
	}
	public String getFriendQq() {
		return friendQq;
	}
	public void setFriendQq(String friendQq) {
		this.friendQq = friendQq;
	}
	public String getFriendEmail() {
		return friendEmail;
	}

	public void setFriendEmail(String friendEmail) {
		this.friendEmail = friendEmail;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
