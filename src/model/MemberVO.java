package model;

import java.util.Date;

public class MemberVO {
	private String userId;
	private String userPass;
	private String userName;
	private String phone1;
	private String phone2;
	private String phone3;
	private Date regDate;
	private int selectedTime;
	private String emailId;
	private String emailAdd;
	private String company;
	private int gender;
	private String birth;

	public MemberVO(String string, String string2, String string3, String string4, int int5, String string6,
			String string7, String string8) {
	}

	public MemberVO(String userId, String userPass) {
		super();
		this.userId = userId;
		this.userPass = userPass;
	}

	public MemberVO(String userId, String userPass, String userName, String phone1, String phone2, String phone3,
			String emailId, String emailAdd, int gender, String birth) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.emailId = emailId;
		this.emailAdd = emailAdd;
		this.gender = gender;
		this.birth = birth;
	}

	public MemberVO(String userId, String userPass, String userName, String phone1, String phone2, String phone3,
			Date regDate, int selectedTime, String emailId, String emailAdd, String company, int gender, String birth) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.regDate = regDate;
		this.selectedTime = selectedTime;
		this.emailId = emailId;
		this.emailAdd = emailAdd;
		this.company = company;
		this.gender = gender;
		this.birth = birth;
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

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailAdd() {
		return emailAdd;
	}

	public void setEmailAdd(String emailAdd) {
		this.emailAdd = emailAdd;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", regDate=" + regDate + ", selectedTime="
				+ selectedTime + ", emailId=" + emailId + ", emailAdd=" + emailAdd + ", company=" + company
				+ ", gender=" + gender + ", birth=" + birth + "]";
	}

}
