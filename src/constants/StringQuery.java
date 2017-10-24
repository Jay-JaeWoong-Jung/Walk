package constants;

public interface StringQuery {
	///////////////////회원관리 queries//////////////////////////////
	String SELECT_IDCHECK = "select * from membership where userId=?";
	String INSERT_REGISTER = "insert into membership values(?,?,?,  ?,?,?,  ?,?,?,  ?,?,?, sysdate,?,?,?)";
	String SELECT_LOGINCHECK = "select userpass from membership where userid=? ";
	String SELECT_GETMEMINFO = "select userid,userpass,username,phone1,phone2,phone3,gender,emailid,emailadd,birth,company,selectedtime,regdate,emailaccept,profile from membership where userid=?";
	String SELECT_UPDATE = "update membership set userpass=?,phone1=?,phone2=?,phone3=?,emailid=?,emailadd=?, company=?, selectedtime=?,emailaccept=?, profile=? where userid=?";
/*	String SELECT_MEMBER = "select userpass from membership where userid=? ";*/
	String DELETE_MEMBER = "delete from membership where userid=? and userPass=?";
	String SELECT_LOGIN = "select userid,userpass,username,phone1,phone2,phone3,gender,emailid,emailadd,birth,company,selectedtime,regdate,emailAccept,profile from membership where userid=? and userPass=?";

	
	////////////////////reservation queries//////////////
	String UPDATE_TIME ="update membership  set  selectedTime=? where userId=?";
	
	String INSERT_DATE = "insert into id_log (userId,attendance,reserveDate) values(?,?,to_char(sysdate,'YYYYMMDD'))"; 
	

	String SELECTED_TIME = "select count(*) from membership where selectedTime=?";
	String INSERT_MEMBER ="insert into membership ( values(?,?,?,?,?,?,?,?,?,?)";
	String GET_ALL_USERID_TIMESLOT = "select userid, selectedtime from membership";
	String GET_USERID_BY_TIMESLOT = "SELECT userId FROM membership where selectedTime=?";
	String UPDATE_GROUPCOLOR = "UPDATE membership SET GROUPCOLOR=? WHERE userId =?";
	String GET_USERID_GROUPCOLOR_BY_TIMESLOT = "select userid, GROUPCOLOR from membership where selectedtime=?";
	String CLEAR_GROUPCOLOR_SELECTEDTIME="UPDATE membership SET GROUPCOLOR=?, selectedTime=?";
	
	String GET_NAME_IN_GROUP_BY_ID_GROUPCOLOR="select userName from membership where selectedTime=? and GROUPCOLOR=?";
	String GET_RESERVATION_INFO_BY_ID="select userId, selectedTime, GROUPCOLOR,userName from membership where userId=?";
	String GET_SAME_GROUPCOLOR_COUNT ="select count(*) from membership where selectedTime=? group by GROUPCOLOR having GROUPCOLOR=?";
	String UPDATE_TIMESLOT ="update membership set selectedTime=? where userId=?";
	String CANCEL_RESERVATION="update membership set selectedTime=0 where userId=?";
	String DELETE_LOG="delete from id_log where userId=? and reserveDate=to_char(sysdate,'YYYYMMDD')";
	String IS_RESERVATION="select attendance from id_log where userId=?";
	String GET_RESERVE_DATE= "select reserveDate from id_log where userId=? and reserveDate=to_char(sysdate,'YYYYMMDD')";
	/*String SET_START_TIME=*/

//	String INSERT_POSTING = "INSERT INTO board (no, title, writer, password, content, time_posted)" +
//	" VALUES(board_seq.nextVal, ?, ?, ?, ?, sysdate)";
//	String SELECT_POSTING = 
//			"SELECT no, title, writer, content, hits, time_posted FROM board WHERE  no=?";
//	String CURRENT_NO =
//			"SELECT board_seq.currVal FROM dual";
//	String DATE_POSTED = 
//			"SELECT sysdate FROM dual";
//	String SELECT_ALL =
//			"SELECT no, title, writer, content, hits, to_char(time_posted, 'YYYY.MM.DD') time_posted FROM board";
	
	
}
