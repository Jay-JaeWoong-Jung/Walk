package sql;

public interface StringQuery {

	String INSERT_POSTING = 
			"INSERT INTO board (no, userId, content, time_posted)"+
	" VALUES(board_seq.nextVal,?, ?, sysdate)";
	
	String CHECK_ID =
			"SELECT COUNT(-1) FROM board WHERE no=? AND userId=?";
	// COUNT(-1) == COUNT(*)
	String DELETE_POSTING =
			"DELETE FROM board WHERE no=?";

	String CURRENT_NO = 
			"SELECT board_seq.currVal FROM dual";
	
	String SELECT_POSTING = 
			"SELECT no, userId, content, timePosted FROM board WHERE no=?";
	
	String UPDATE_CONTENT = 
			"UPDATE board SET content= ? WHERE no=?";
	
	String PAGE_LIST = 
			"SELECT no, userId, content, to_char(time_posted, 'YYYY/mm/DD hh:mm') timePosted "
			+ "FROM board where to_char(timePosted, 'YYYY/MM/DD') = ? order by no";
	
	String CURRENT_DATE=
			"SELECT to_char(sysdate,'YYYY/MM/DD') AS timePosted FROM dual";
}
