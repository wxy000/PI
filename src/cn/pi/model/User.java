package cn.pi.model;

import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer userId;
	private String userName;
	private String password;
	private String work;
	private String realName;
	private String phone;
	private String photopath;
	private String email;
	private String sex;
	private String notes;
	private Set<Friends> friends = new HashSet<Friends>();
	
	public User() {
		super();
	}

	public User(String userName, String password, String work,
			String realName, String phone, String photopath) {
		super();
		this.userName = userName;
		this.password = password;
		this.work = work;
		this.realName = realName;
		this.phone = phone;
		this.photopath = photopath;
	}
	
	public User(String userName, String password, String work,
			String realName, String phone, String photopath,
			Set<Friends> friends) {
		super();
		this.userName = userName;
		this.password = password;
		this.work = work;
		this.realName = realName;
		this.phone = phone;
		this.photopath = photopath;
		this.friends = friends;
	}


	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhotopath() {
		return photopath;
	}
	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Friends> getFriends() {
		return friends;
	}
	public void setFriends(Set<Friends> friends) {
		this.friends = friends;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", work=" + work + ", realName="
				+ realName + ", phone=" + phone + ", photopath=" + photopath
				+ ", email=" + email + ", sex=" + sex + ", notes=" + notes
				+ ", friends=" + friends + "]";
	}

}
