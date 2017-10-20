package model;

import java.util.Date;

public class MemberVO {
	private String userId;
	private String userPass;
	private String userName;
	private String phoneNumber;
	private Date regDate;
	private int selectedTime;
	private String company;
	private int gender;	
	private int birth;
	private String email;
	private int flag;
	public MemberVO(String userId, String userPass, String userName, String phoneNumber, Date regDate, int selectedTime,
			String company, int gender, int birth, String email, int flag) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.phoneNumber = phoneNumber;
		this.regDate = regDate;
		this.selectedTime = selectedTime;
		this.company = company;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.flag = flag;
	}
	
	
	public MemberVO(String userId, int selectedTime, int flag) {
		super();
		this.userId = userId;
		this.selectedTime = selectedTime;
		this.flag = flag;
	}
	
	
	
	

	

	public MemberVO(String userName) {
		super();
		this.userName = userName;
	}


	public MemberVO(String userId, String userName, int selectedTime, int flag) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.selectedTime = selectedTime;
		this.flag = flag;
	}


	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getSelectedTime() {
		return selectedTime;
	}
	public void setSelectedTime(int selectedTime) {
		this.selectedTime = selectedTime;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", phoneNumber="
				+ phoneNumber + ", regDate=" + regDate + ", selectedTime=" + selectedTime + ", company=" + company
				+ ", gender=" + gender + ", birth=" + birth + ", email=" + email + ", flag=" + flag + "]";
	}
	
	
	
	
	
}
