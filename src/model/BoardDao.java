package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.StringQuery;

/*
 * 나중에 실질적으로 Component기반으로 최종적으로 돌릴때에는
 * DataSource 방식을 사용할 것이다...
 * 
 * 지금은 단위테스트를 우선적으로 해야하기 떄문에
 * DriverManager 방식을 임시로 사용하겠다.
 * ::
 * 1)
 * DataSource방식을 사용할때 가장 핵심이 되는 Service는 JNDI(Naming Service)를 사용할
 * 것이다.
 * 바인딩된 객체를 찾아오는 로직이 dao에 혼재되지 않도록 별도로 분리시키겠다.
 * ::
 * DataSourceManager
 * ::
 * ::
 * 2)
 * String Query부분을 별도로 분리시키겠다.
 * Interface  >>> properties >>>   xml(Framework - MyBatis)  >>> Annotation
 */
public class BoardDao {
	private static BoardDao dao = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return dao;
		
	}
	
	/////////////// 공통적인 로직 /////////////////////////////
	public  Connection getConnection() throws SQLException{
		System.out.println("디비연결 성공....");
		return DataSourceManager.getInstance().getConnection();
	}
	public void closeAll(PreparedStatement ps, Connection conn)throws SQLException{
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}
	
	public void closeAll(ResultSet rs,PreparedStatement ps, Connection conn)throws SQLException{
		if(rs!=null){
			rs.close();
			closeAll(ps, conn);
		}
	}//
	
	//////////////////////// 비지니스 로직 //////////////////////////
	public void posting(BoardVO vo) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps=conn.prepareStatement(StringQuery.INSERT_POSTING);
			ps.setString(1,vo.getUserId());
			ps.setString(2,vo.getContent());
						
			int row = ps.executeUpdate();
			System.out.println(row+" row INSERT OK!!");
			
			System.out.println("+++++++++++++++++++++++++++++++++++++++++");
			System.out.println("dao INSERT before SequenceNo ::"+vo.getNo());//0
			// 여기서 쿼리문이 하나 다ㅓ 돌아야 한다....CURRENT_NO...
			// vo에 no 를 주입.....vo.setNo(a);
			ps = conn.prepareStatement(StringQuery.CURRENT_NO);
			rs = ps.executeQuery();
			if(rs.next()) vo.setNo(rs.getInt(1));
			
			System.out.println("dao INSERT after SequenceNo ::"+vo.getNo());//1
		}finally {
			closeAll(rs,ps, conn);
		}
	}//	posting	
	
	/*public BoardVO getPostingByNo(int no) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardVO vo = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.SELECT_POSTING);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo = new BoardVO(no, 
						rs.getString("userId"), 
						rs.getString("content"), 
						rs.getString("timePosted"));
				System.out.println("getPostingByNo...."+no);
			}
		}finally {
			closeAll(ps, conn);
		}
		return vo;
	}//getPostingByNo
*/	
	
	public ArrayList<BoardVO> getAllpostByDate(String date) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
				
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.PAGE_LIST);
			ps.setString(1, date);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO(
						rs.getInt("no"), 
						rs.getString("userId"), 
						rs.getString("content"),
						rs.getString("timePosted")));
							
			}
		}finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
	public boolean checkId(int no, String userId) throws SQLException{ // int도 가능
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result= false;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.CHECK_ID);
			ps.setInt(1, no);
			ps.setString(2, userId);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)!=0) result = true; // getInt(1)은 쿼리문의 성공여부의 결과창, 
			}										// 현재는 일치하는것이 하나이기 때문에 로직성공시 1이나옴( 두개일땐 2 나옴)
							
		}finally {
			closeAll(rs, ps, conn);
		}
		
		return result;
		
	}
	
	public void deletePosting(int no) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.DELETE_POSTING);
			ps.setInt(1, no);
			
			int row = ps.executeUpdate(); // 1
			System.out.println("DELETE OK !! "+row); //delete가 되면 1(delelete되어진 row수)
		}finally {
			closeAll(ps, conn);
		}
		
		
	}
	
	public void updateContent(BoardVO vo) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.UPDATE_CONTENT);
			ps.setString(1,vo.getContent());
			ps.setInt(2, vo.getNo());
			int row = ps.executeUpdate(); // 1
			System.out.println("UPDATE OK! "+row); //delete가 되면 1(delelete되어진 row수)
		}finally {
			closeAll(ps, conn);
		}
	}
	
	public String getTodayDate() throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String date="";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.CURRENT_DATE);
			rs = ps.executeQuery();
			if(rs.next()) {
				date = rs.getString("timePosted");
				System.out.println("getTodayDate...."+date);
			}
		}finally {
			closeAll(ps, conn);
		}
			
		
		return date;
		
	}
	
	public ArrayList<BoardVO> getAllPostById(String userId) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.SELECT_POSTINGBYID);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO(
						rs.getInt("no"), 
						rs.getString("userId"), 
						rs.getString("content"),
						rs.getString("timePosted")));
							
			}
		}finally {
			closeAll(ps, conn);
		}
		return list;
	}//getPostingByNo
	
	
	
	public static void main(String[] args) throws Exception{
		BoardDao dao = BoardDao.getInstance();
		//dao.posting(new BoardVO("추석", "신정환", "7788", "낌미낌미~~~"));
		//System.out.println(dao.getPostingByNo(1));
		/*BoardVO v = new BoardVO("한가위", "홍길동", "1234", "보름달이 뜨면은~~~우워우어");
		System.out.println(dao.getPostingByNo(v.getNo()));*/
	}

}









