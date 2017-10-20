package sql;

public interface StringQuery {

	String INSERT_POSTING = 
			"INSERT INTO board (no, writer, password, content, time_posted)"+
	" VALUES(board_seq.nextVal,?,?,?,sysdate)";
	
	String CHECK_PASSWORD =
			"SELECT COUNT(-1) FROM board WHERE no=? AND password=?";
	// COUNT(-1) == COUNT(*)
	String DELETE_POSTING =
			"DELETE FROM board WHERE no=?";
			
	
	String CURRENT_NO = 
			"SELECT board_seq.currVal FROM dual";
	
	String SELECT_POSTING = 
			"SELECT no, writer, content, hits, time_posted FROM board WHERE  no=?";
	
	String UPDATE_CONTENT = 
			"UPDATE board SET content= ? WHERE no=?";
	
	String PAGE_LIST = "SELECT no, writer, content,  hits, to_char(time_posted, 'YYYY.MM.DD') time_posted FROM board order by no";
	
	String CURRENT_DATE=
			"SELECT to_char(sysdate,'YYYYMMDD') AS time_posted FROM dual";
}
