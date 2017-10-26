package model.member;

import java.util.Date;

public class MemberVO {
	private String userId;
    private String userPass;
    private String userName;
    private String phone1;
    private String phone2;
    private String phone3;
    private int gender;
    private String emailId;
    private String emailAdd;
    private String birth;
    private String company;
    private int selectedTime;
    private Date regDate;
    private String emailAccept;
    private String profile;
    private int groupColor;
    
    
    public MemberVO() {
		super();
	}
    


	///회원가입용 생성자///   //이름,이메일로 아이디 찾기
 // delete, logincheck용
 	public MemberVO(String userId, String userPass) {
 		super();
 		this.userId = userId;
 		this.userPass = userPass;
 	}
 

	//login용 
 	public MemberVO(String userId, String userPass, String userName, String phone1, String phone2, String phone3,
 			int gender, String emailId, String emailAdd, String birth, String emailAccept, String profile) {
 		super();
 		this.userId = userId;
 		this.userPass = userPass;
 		this.userName = userName;
 		this.phone1 = phone1;
 		this.phone2 = phone2;
 		this.phone3 = phone3;
 		this.gender = gender;
 		this.emailId = emailId;
 		this.emailAdd = emailAdd;
 		this.birth = birth;
 		this.emailAccept = emailAccept;
 		this.profile = profile;
 	}

 	// update용 생성자
 	public MemberVO(String userPass, String phone1, String phone2, String phone3, String emailId, String emailAdd,
 			String company, int selectedTime, String userId, String emailAccept, String profile) {
 		super();
 		this.userPass = userPass;
 		this.phone1 = phone1;
 		this.phone2 = phone2;
 		this.phone3 = phone3;
 		this.emailId = emailId;
 		this.emailAdd = emailAdd;
 		this.company = company;
 		this.selectedTime = selectedTime;
 		this.userId = userId;
 		this.emailAccept = emailAccept;
 		this.profile = profile;
 	}

 	
 	public MemberVO(String userId, String userPass, String userName, String phone1, String phone2, String phone3,
 			int gender, String emailId, String emailAdd, String birth, String company, int selectedTime, Date regDate,
 			String emailAccept, String profile) {
 		super();
 		this.userId = userId;
 		this.userPass = userPass;
 		this.userName = userName;
 		this.phone1 = phone1;
 		this.phone2 = phone2;
 		this.phone3 = phone3;
 		this.gender = gender;
 		this.emailId = emailId;
 		this.emailAdd = emailAdd;
 		this.birth = birth;
 		this.company = company;
 		this.selectedTime = selectedTime;
 		this.regDate = regDate;
 		this.emailAccept = emailAccept;
 		this.profile = profile;
 	}
    
    ///예약관리용 생성자////
 	
	public MemberVO(String userName) {
		super();
		this.userName = userName;
	}
	public MemberVO(String userId, String userName, int selectedTime, int groupColor) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.selectedTime = selectedTime;
		this.groupColor = groupColor;
	}


	public MemberVO(String userId, String userPass, String userName, String phone1, String phone2, String phone3,
			int gender, String emailId, String emailAdd, String birth, String company, int selectedTime, Date regDate,
			String emailAccept, String profile, int groupColor) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.gender = gender;
		this.emailId = emailId;
		this.emailAdd = emailAdd;
		this.birth = birth;
		this.company = company;
		this.selectedTime = selectedTime;
		this.regDate = regDate;
		this.emailAccept = emailAccept;
		this.profile = profile;
		this.groupColor = groupColor;
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
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getSelectedTime() {
		return selectedTime;
	}
	public void setSelectedTime(int selectedTime) {
		this.selectedTime = selectedTime;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getEmailAccept() {
		return emailAccept;
	}
	public void setEmailAccept(String emailAccept) {
		this.emailAccept = emailAccept;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getgroupColor() {
		return groupColor;
	}
	public void setgroupColor(int groupColor) {
		this.groupColor = groupColor;
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", gender=" + gender + ", emailId=" + emailId
				+ ", emailAdd=" + emailAdd + ", birth=" + birth + ", company=" + company + ", selectedTime="
				+ selectedTime + ", regDate=" + regDate + ", emailAccept=" + emailAccept + ", profile=" + profile
				+ ", groupColor=" + groupColor + "]";
	}
    
    
	
	
	
	
}