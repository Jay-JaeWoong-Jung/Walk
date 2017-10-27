package constants;

public interface StringQuery {
	///////////////////회원관리 queries//////////////////////////////
	String SELECT_IDCHECK = "select * from membership where userId=?";
	String INSERT_REGISTER = "insert into membership values(?,?,?,  ?,?,?,  ?,?,?,  ?,?,?, sysdate,?,?,?)";
	String SELECT_LOGINCHECK = "select userpass from membership where userid=? ";
	String SELECT_GETMEMINFO = "select userid,userpass,username,phone1,phone2,phone3,gender,emailid,emailadd,birth,company,selectedtime,regdate,emailaccept,profile from membership where userid=?";
	String SELECT_UPDATE = "update membership set userpass=?,phone1=?,phone2=?,phone3=?,emailid=?,emailadd=?, company=?, selectedtime=?,emailaccept=?, profile=? , gender=? where userid=?";
/*	String SELECT_MEMBER = "select userpass from membership where userid=? ";*/
	String DELETE_MEMBER = "delete from membership where userid=? and userPass=?";
	String SELECT_LOGIN = "select userid,username,phone1,phone2,phone3,  gender,emailid,emailadd,birth,company, selectedtime,emailAccept,profile from membership where userid=? and userPass=?";

	
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
	
	String GET_NAME_IN_GROUP_BY_ID_GROUPCOLOR="select userName,selectedTime,GROUPCOLOR from membership where  selectedTime=? and GROUPCOLOR=? and GROUPCOLOR is not null and GROUPCOLOR !=0";
	String GET_RESERVATION_INFO_BY_ID="select userId, selectedTime, GROUPCOLOR,userName from membership where userId=?";
	String GET_SAME_GROUPCOLOR_COUNT ="select count(*) from membership where selectedTime=? group by GROUPCOLOR having GROUPCOLOR=? and GROUPCOLOR is not null and GROUPCOLOR !=0";
	String UPDATE_TIMESLOT ="update membership set selectedTime=? where userId=?";
	String CANCEL_RESERVATION="update membership set selectedTime=0 ,groupcolor=0 where userId=?";
	String DELETE_LOG="delete from id_log where userId=? and reserveDate=to_char(sysdate,'YYYYMMDD')";
	String IS_RESERVATION="select attendance from id_log where userId=? and reserveDate=to_char(sysdate,'YYYYMMDD')";
	String GET_RESERVE_DATE= "select reserveDate from id_log where userId=? and reserveDate=to_char(sysdate,'YYYYMMDD')";
	String UPDATE_START_TIME="update id_log set startTime=TO_CHAR(SYSDATE, 'HH24MISS') where userId=?";
	String UPDATE_FINISH_TIME="update id_log set finishTime=TO_CHAR(SYSDATE, 'HH24MISS') where userId=?";
	
	///////////////////게시판 비지니스 로직////////////////////////////
	
	String INSERT_POSTING = "INSERT INTO board (no, userId, content, timePosted) VALUES(board_seq.nextVal,?, ?, sysdate)";
	
	String CHECK_ID =
			"SELECT COUNT(-1) FROM board WHERE no=? AND userId=?";
	// COUNT(-1) == COUNT(*)
	String DELETE_POSTING =
			"DELETE FROM board WHERE no=?";

	String CURRENT_NO = "SELECT board_seq.currVal FROM dual";
	
	String UPDATE_CONTENT = "UPDATE board SET content= ? WHERE no=?";
	
	String PAGE_LIST = "SELECT no, userId, content, to_char(timePosted, 'YYYY/mm/DD hh24:mm') timePosted FROM board where to_char(timePosted, 'YYYY/MM/DD') = ? order by no";
	
	String CURRENT_DATE="SELECT to_char(sysdate,'YYYY/MM/DD') AS timePosted FROM dual";
	
	String SELECT_POSTINGBYID = 
			"SELECT no, userId, content, to_char(timePosted, 'YYYY/mm/DD hh24:mm') timePosted"
			+ " FROM board WHERE userId=? order by no";
	
	

	
	
}
