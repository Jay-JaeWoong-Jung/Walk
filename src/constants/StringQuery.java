package constants;

public interface StringQuery {
	
	String UPDATE_TIME ="update membership  set  selectedTime=? where userId=?";
	
	String INSERT_DATE = "insert into id_log (userId,attendance,reserveDate) values(?,?,to_char(sysdate,'YYYYMMDD'))"; 
	

	String SELECTED_TIME = "select count(*) from membership where selectedTime=?";
	String INSERT_MEMBER ="insert into membership values(?,?,?,?,?,?,?,?,?,?)";
	String GET_ALL_USERID_TIMESLOT = "select userid, selectedtime from membership";
	String GET_USERID_BY_TIMESLOT = "SELECT userId FROM membership where selectedTime=?";
	String UPDATE_FLAG = "UPDATE membership SET flag=? WHERE userId =?";
	String GET_USERID_FLAG_BY_TIMESLOT = "select userid, flag from membership where selectedtime=?";
	String CLEAR_FLAG_SELECTEDTIME="UPDATE membership SET flag=?, selectedTime=?";
	
	String GET_RESERVATION_INFO_BY_ID="select userId, selectedTime, flag from membership where userId=?";
	String GET_SAME_FLAG_COUNT ="select count(*) from membership where selectedTime=? group by flag having flag=?";
	String UPDATE_TIMESLOT ="update membership set selectedTime=? where userId=?";
	String CANCEL_RESERVATION="update membership set selectedTime=0 where userId=?";

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
