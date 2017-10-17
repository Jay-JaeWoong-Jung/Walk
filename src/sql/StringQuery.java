package sql;

public interface StringQuery {
	
	String UPDATE_TIME ="update membership  set  selectedTime=? where userId=?";
	
	String INSERT_DATE = "insert into id_log (userId,attendance,reserveDate) values(?,?,to_char(sysdate,'YYYYMMDD'))"; 
	
	String selectedCount = "select count(*) from membership where selectedTime=?";
	
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
