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

	public boolean registerMember(MemberVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
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
			System.out.println("update 전");

			pstmt.executeUpdate();	
			System.out.println("후");
			/*if (count > 0) {
				flag = true;
				System.out.println("registerMember OK...." + count);
			}*/
 
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

				vo.setUserName(rs.getString("username"));
				vo.setUserId(rs.getString("userid"));
				vo.setUserPass(rs.getString("userpass"));
				vo.setPhone1(rs.getString("phone1"));
				vo.setPhone2(rs.getString("phone2"));
				vo.setPhone3(rs.getString("phone3"));
				vo.setEmailId(rs.getString("emailId"));
				vo.setEmailAdd(rs.getString("emailAdd"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getInt("gender"));

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

	/*public MemberVO login(String userId, String userPass) throws SQLException {
		MemberVO vo = null;
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
						rs.getString("phone2"), rs.getString("phone3"), rs.getString("emailId"),
						rs.getString("emailAdd"), rs.getInt("gender"), rs.getString("birth"));
			}

		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}*/

	public static void main(String[] args) throws Exception {
		
		 MemberDAO dao = MemberDAO.getInstance();
		 dao.registerMember(new MemberVO("myId", "myPass", "myname", "010", "1234", "5678", "ddd", "naver.com", 0, "19860806"));
		/* MemberVO vo = new MemberVO("1234",
		"1234", "1234", "1234", new Date(1986, 8, /6) , 0, "1234", "My Company",
		 0,19808060); dao.idCheck("abcd"); System.out.println(dao.idCheck("abcd"));
		dao.loginCheck("abcd", "1234"); System.out.println(dao.registerMember(new
		 MemberVO("opilior", "8686", "김보경", "010", "2319", "7552",
		 "ealurill","@naver.com", 1, 860806)));
		*/ 
		 
	}


}
