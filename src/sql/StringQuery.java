package sql;

public interface StringQuery {
	
	String UPDATE_TIME ="update membership  set  selectedTime=? where userId=?";
	
	String INSERT_DATE = "insert into id_log (userId,attendance,reserveDate) values(?,?,to_char(sysdate,'YYYYMMDD'))"; 
	
	String SELECTED_TIME = "select count(*) from membership where selectedTime=?";
	String INSERT_MEMBER ="insert into membership values(?,?,?,?,?,?,?,?,?,?)";
	String GET_ALL_USERID_TIMESLOT = "select userid, selectedtime from membership";
	String GET_USERID_BY_TIMESLOT = "SELECT userId FROM membership where selectedTime=?";
	String UPDATE_FLAG = "UPDATE membership SET flag=? WHERE userId =?";
	String GET_USERID_FLAG_BY_TIMESLOT = "select userid, flag from membership where selectedtime=?";
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
