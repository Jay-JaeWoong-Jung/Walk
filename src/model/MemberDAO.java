package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import config.OracleInfo;
import sql.StringQuery;

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

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return dao;

	}

	/////////////// 공통적인 로직 /////////////////////////////
	public Connection getConnection() throws SQLException {
		System.out.println("디비연결 성공....");
		//return DataSourceManager.getInstance().getConnection();
		return DriverManager.getConnection(OracleInfo.URL, OracleInfo.USER, OracleInfo.PASS);
	}

	public void closeAll(PreparedStatement ps, Connection conn) throws SQLException {
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
		if (rs != null) {
			rs.close();
			closeAll(ps, conn);
		}
	}//
	////////////////////////////// 비지니스 로직/////////////

	public boolean idCheck(String userId) throws SQLException {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_IDCHECK);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				result = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return result;
	}// idCheck

	public int registerMember(MemberVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.INSERT_REGISTER);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPass());
			pstmt.setString(3, vo.getUserName());

			pstmt.setString(4, vo.getPhone1());
			pstmt.setString(5, vo.getPhone2());
			pstmt.setString(6, vo.getPhone3());
			pstmt.setInt(7, vo.getGender());
			pstmt.setString(8, vo.getEmailId());
			pstmt.setString(9, vo.getEmailAdd());
			pstmt.setString(10, vo.getBirth());
			pstmt.setString(11, null);
			pstmt.setNull(12, java.sql.Types.INTEGER);
			pstmt.setString(13,vo.getEmailAccept());
			pstmt.setString(14, null);
			pstmt.setNull(15, java.sql.Types.INTEGER);
			
			flag=pstmt.executeUpdate();
			System.out.println("registerMember OK...." );
			
		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			closeAll(pstmt, conn);
		}
		return flag;
	}// registerMember

	public int loginCheck(String userId, String userPass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_LOGINCHECK);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("userpass");
				if (userPass.equals(dbPass))
					check = 1;
				else
					check = 0;
			}

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return check;
	}// loginCheck

	public MemberVO getMemberInfo(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_GETMEMINFO);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo=new MemberVO();
				vo.setUserId(rs.getString("userid"));
				vo.setUserPass(rs.getString("userpass"));
				vo.setUserName(rs.getString("username"));
				
				vo.setPhone1(rs.getString("phone1"));
				vo.setPhone2(rs.getString("phone2"));
				vo.setPhone3(rs.getString("phone3"));
				
				vo.setGender(rs.getInt("gender"));
				vo.setEmailId(rs.getString("emailid"));
				vo.setEmailAdd(rs.getString("emailadd"));
				
				vo.setBirth(rs.getString("birth"));
				vo.setCompany(rs.getString("company"));
				vo.setSelectedTime(rs.getInt("selectedtime"));
				
				vo.setRegDate(rs.getDate("regdate"));
				vo.setEmailAccept(rs.getString("emailaccept"));
				vo.setProfile(rs.getString("profile"));
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return vo;
	}// getMemberInfo
	

	public void updateMember(MemberVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_UPDATE);
			pstmt.setString(1, vo.getUserPass());
			pstmt.setString(2, vo.getPhone1());
			pstmt.setString(3, vo.getPhone2());
			pstmt.setString(4, vo.getPhone3());
			pstmt.setString(5, vo.getEmailId());
			pstmt.setString(6, vo.getEmailAdd());
			pstmt.setString(7, vo.getCompany());
			pstmt.setInt(8, vo.getSelectedTime());
			pstmt.setString(9, vo.getEmailAccept());
			pstmt.setString(10, vo.getProfile());
			
			pstmt.setString(11, vo.getUserId());
			int result = pstmt.executeUpdate();
			System.out.println("updateMember OK..." + result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(pstmt, conn);
		}

	}

	public int deleteMember(String userId, String userPass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = "";
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_MEMBER);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPass = rs.getString("userPass");
				if (dbPass.equals(userPass)) {
					pstmt = conn.prepareStatement(StringQuery.DELETE_MEMBER);
					pstmt.setString(1, userId);
					pstmt.executeUpdate();
					result = 1;

				} else {
					result = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return result;
	}
	public MemberVO login(String userId, String userPass) throws SQLException {
	MemberVO vo = new MemberVO();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	try {
		con = getConnection();
		pstmt = con.prepareStatement(StringQuery.SELECT_LOGIN);
		pstmt.setString(1, userId);
		pstmt.setString(2, userPass);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			vo = new MemberVO(userId, userPass, rs.getString("userName"), rs.getString("phone1"),
					rs.getString("phone2"), rs.getString("phone3"), rs.getInt("gender"),rs.getString("emailId"),
					rs.getString("emailAdd"), rs.getString("birth"),rs.getString("emailaccept"),rs.getString("profile"));
		System.out.println("login성공!!!...."+vo);
		}else {System.out.println("로그인 실패....");}
 
	} finally {
		closeAll(rs, pstmt, con);
	}
	return vo;
}

	public static void main(String[] args) throws Exception {
		
		 MemberDAO dao = MemberDAO.getInstance();
		dao.registerMember(new MemberVO("myID111", "myPass111", "myName111", "111", "1234", "5678", 0, "abc", "@ab.com", "950411", "myCom", 0, new Date(), "n", "url"));
		//System.out.println(dao.idCheck("myId"));
		//System.out.println(dao.deleteMember("myId", "myPass"));
		//System.out.println(dao.loginCheck("abcd", "1234"));
		 //System.out.println(dao.getMemberInfo("abcd"));
		//update membership set userpass=?,phone1=?,phone2=?,phone3=?,emailid=?,emailadd=? company=? selectedtime=? where userid=?"
		// System.out.println(dao.getMemberInfo("myId3"));
		//System.out.println(dao.login("abcd", "1234"));		 //dao.updateMember(new MemberVO("8686", "010", "1234", "4321", "opilior", "gmail@.com", "코스타", 1, "myId"));
//		 MemberVO vo = new MemberVO("1234",
//		"1234", "1234", "1234", new Date(1986, 8, /6) , 0, "1234", "My Company",
//		 0,19808060); 
//		 dao.idCheck("abcd"); System.out.println(dao.idCheck("abcd"));
//		dao.loginCheck("abcd", "1234"); System.out.println(dao.registerMember(new
//		 MemberVO("opilior", "8686", "김보경", "010", "2319", "7552",
//		 "ealurill","@naver.com", 1, 860806))); 
	 
		 
	}


}
