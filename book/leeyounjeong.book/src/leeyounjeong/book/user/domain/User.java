package leeyounjeong.book.user.domain;

import java.sql.Date;

public class User {
	private String userId;
	private String userName;
	private String userPwd;
	private String phoneNum;
	private String address;
	private Date regDate;
	
	public User() {}
	
	public User(String userId, String userName, String userPwd, String phoneNum, String Destination, Date regDate, String address) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phoneNum = phoneNum;
		this.address = address;
		this.regDate = regDate;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return String.format("%s %-6s %s %s %s %s", userId, userName, userPwd, phoneNum, address, regDate);
	}
}
