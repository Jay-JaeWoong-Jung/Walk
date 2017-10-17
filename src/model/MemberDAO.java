package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import config.OracleInfo;

/*
 * 나중에 실질적으로 Component기반으로 최종적으로 돌릴때에는
 * DataSource 방식을 사용할 것이다...
 * 
 * 지금은 단위테스트를 우선적으로 해야하기 떄문에
 * DriverManager 방식을 임시로 사용하겠다.
 * ::
 * 1)
 * DataSource방식을 사용할 때 가장 핵심이 되는 service는 JNDI(Naming Service)를 사용할
 * 것이다.
 * 바인딩된 객체를 찾아오는 로직이 dao에 혼재되지 않도록 별도로 분리시키겠다.
 * ::
 * DataSourceManager
 * 2)
 * String Query부분을 별도로 분리
 * 
 */
public class MemberDAO {

	private static MemberDAO dao = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		return dao;
	}
	/////////////// 공통적인 로직 /////////////////////////////
	public  Connection getConnection() throws SQLException{
		System.out.println("디비연결 성공....");
		//return DataSourceManager.getInstance().getConnection();
		return DriverManager.getConnection(OracleInfo.URL, OracleInfo.USER, OracleInfo.PASS);
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
	public void registerMember(MemberVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con=getConnection();
			String sql="insert into membership values(?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1,vo.getUserId());
			ps.setString(2,vo.getUserPass());
			ps.setString(3,vo.getUserName());
			ps.setString(4,vo.getPhoneNumber());
			ps.setInt(5, vo.getGender());
			ps.setInt(6, vo.getBirth());
			ps.setString(7, vo.getCompany());
			ps.setInt(8, vo.getSelectedTime());
			ps.setDate(9,  new java.sql.Date(vo.getRegDate().getTime()));
			ps.setString(10, vo.getEmail());
			int result=ps.executeUpdate();
			System.out.println("insert ok.."+result);
		}finally{
			closeAll(ps,con);
		}
	}
	
	public static void main(String[] args) throws Exception{
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO vo = new MemberVO(
				"myId", 
				"myPass", 
				"myUserName",
				"01012345678",
				new Date(),
				0,
				"my comapny",
				0,
				950411,
				"email@email.com");
		dao.registerMember(vo);
		//System.out.println(dao.getPostingByNo());
		 
	}



	
	
}
