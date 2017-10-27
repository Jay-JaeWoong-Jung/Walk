package model.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import config.OracleInfo;
import constants.StringQuery;
import dataSourceManager.DataSourceManager;
import javafx.util.Pair;

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
		//System.out.println("디비연결 성공....");
		return DataSourceManager.getInstance().getConnection();
		//return DriverManager.getConnection(OracleInfo.URL, OracleInfo.USER,
		// OracleInfo.PASS);
		
		 
		
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
	}
	
	//10/27 9:23 아이디 존재여부
	public boolean isExist(String userId) throws SQLException{
		boolean result=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select count(-1) from membership where userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			if(rs.next()){				
				if(rs.getInt(1)>0)
					result=true;
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return result;
	}
	
	public boolean nameExist(String userName) throws SQLException{
		boolean result=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select count(-1) from membership where userName=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userName);
			rs=pstmt.executeQuery();
			if(rs.next()){				
				if(rs.getInt(1)>0)
					result=true;
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return result;
	}
	
	
	/////////////////////////아이디 찾기 로직////////////////////문제:VO에 한개 매개변수 갖고 있는 거가 또있음...해결:생성자 여러개짜리써서 null값넣을수있다//
	public String findIdByEmail(String userName,String emailId,String emailAdd) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			conn = getConnection();
			//	String SELECT_FINDID="select userid from membership where username=? and emailid=? and emailadd=?";
			pstmt = conn.prepareStatement(StringQuery.SELECT_FINDID);
			pstmt.setString(1, userName);
			pstmt.setString(2, emailId);
			pstmt.setString(3, emailAdd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO();
				vo.setUserId(rs.getString("userid"));
				vo.setUserPass(null);
				

						}
			System.out.println("입력한 정보와 일치하는 ID는 "+vo.getUserId()+"입니다.");
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return vo.getUserId();
	}// findIdByEmail
	
	//임시비번 DB 업데이트 로직
	public int updateFindPass(String userId,String tempPass) throws SQLException{
		int result=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			//update membership set userpass=? where userid=?
			pstmt = conn.prepareStatement(StringQuery.UPDATE_FINDPASS);
			pstmt.setString(1, tempPass);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			System.out.println("updateFindPass OK..." + result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(pstmt, conn);
		}
		return result;
		}//updateFindPass


	////////////////// 회원관리 로직///////////////////
	public boolean idCheck(String userId) throws SQLException {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			//"select * from membership where userId=?
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
			pstmt.setString(13, vo.getEmailAccept());
			pstmt.setString(14, null);
			pstmt.setNull(15, java.sql.Types.INTEGER);

			flag = pstmt.executeUpdate();
			System.out.println("registerMember OK....");

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
			System.out.println("check: "+check);
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
				vo = new MemberVO();
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

	public int updateMember(MemberVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
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
			pstmt.setInt(11, vo.getGender());
			pstmt.setString(12, vo.getUserId());
			
			result = pstmt.executeUpdate();
			System.out.println("updateMember OK..." + result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(pstmt, conn);
		}
		return result;
	}

	public int deleteMember(String userId, String userPass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.DELETE_MEMBER);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPass);
			result=pstmt.executeUpdate();
			System.out.println("delete메소드 실행:"+result);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return result;
	}

	public MemberVO login(String userId, String userPass) throws SQLException ,Exception{
		MemberVO vo  = null;
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
						rs.getString("phone2"), rs.getString("phone3"), rs.getInt("gender"), rs.getString("emailId"),
						rs.getString("emailAdd"), rs.getString("birth"), rs.getString("emailaccept"),
						rs.getString("profile"));
				System.out.println("login성공!!!...." + vo);
			} 

		}catch(Exception e){e.printStackTrace();}
		
		finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	///////////////// reservation logic/////////////

	public ArrayList<Pair<String, Integer>> getAllUserIdTimePair() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Pair<String, Integer>> list = null;
		try {
			con = getConnection();
			list = new ArrayList<Pair<String, Integer>>();
			ps = con.prepareStatement(StringQuery.GET_ALL_USERID_TIMESLOT);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Pair(rs.getString(1), rs.getInt(2)));
			}
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	public ArrayList<Pair<String, Integer>> getUserIdgroupColorPairByTimeSlot(int timeSlot) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Pair<String, Integer>> list = null;
		try {
			con = getConnection();
			list = new ArrayList<Pair<String, Integer>>();
			ps = con.prepareStatement(StringQuery.GET_USERID_GROUPCOLOR_BY_TIMESLOT);
			ps.setInt(1, timeSlot);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Pair(rs.getString(1), rs.getInt(2)));
			}
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	public ArrayList<String> getUserIDsByTimeSlot(int timeSlot) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<String> list = null;
		try {
			con = getConnection();
			list = new ArrayList<String>();
			ps = con.prepareStatement(StringQuery.GET_USERID_BY_TIMESLOT);
			ps.setInt(1, timeSlot);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	public void updateAssignedGroup(String userId, int groupColor) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.UPDATE_GROUPCOLOR);
			ps.setString(2, userId);
			ps.setInt(1, groupColor);
			int result = ps.executeUpdate();

			// System.out.println("update ok.."+result);

		} finally {
			closeAll(ps, conn);
		}
	}

	public void chooseTimeSlot(int selectedTime, String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.UPDATE_TIME);

			ps.setInt(1, selectedTime);
			ps.setString(2, userId);

			int row = ps.executeUpdate();
			System.out.println(row + "  chooseTimeSlot row update OK!!");

		} finally {
			closeAll(rs, ps, conn);
		}

	}

	public void setReserveDate(String userId, int attendace) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.INSERT_DATE);

			ps.setString(1, userId);
			ps.setInt(2, attendace);

			int row = ps.executeUpdate();
			System.out.println(row + " setReserveDate row insert OK!!");

		} finally {
			closeAll(rs, ps, conn);
		}

	}

	public void cleargroupColorNTime(int groupColor, int selectedTime) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.CLEAR_GROUPCOLOR_SELECTEDTIME);
			ps.setInt(1, groupColor);
			ps.setInt(2, selectedTime);
			int result = ps.executeUpdate();

			System.out.println("update ok.." + result);

		} finally {
			closeAll(ps, conn);
		}
	}

	public MemberVO getReservationInfo(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.GET_RESERVATION_INFO_BY_ID);
			ps.setString(1, userId);

			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new MemberVO(userId, rs.getString("userName"), rs.getInt("selectedTime"), rs.getInt("groupColor"));
			}
		} finally {
			closeAll(rs, ps, con);
		}
		return vo;
	}

	public int getgroupColorCout(int selectedTime, int groupColor) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		
		
		int result=0;

		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.GET_SAME_GROUPCOLOR_COUNT);
			ps.setInt(1, selectedTime);
			ps.setInt(2, groupColor);

			rs = ps.executeQuery();

			
			if(rs.next()) {
				result=rs.getInt(1);
				

			}
		} finally {
			closeAll(ps, con);
		}
		return result;
	}

	public int updateTimeSlot(int selectedTime, String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result;

		System.out.println("dao입성  selectedTime:" + selectedTime);
		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.UPDATE_TIMESLOT);
			ps.setInt(1, selectedTime);
			ps.setString(2, userId);

			result = ps.executeUpdate();
			System.out.println("타임슬럿 변경 " + result + "개 성공");

		} finally {
			closeAll(ps, con);
		}
		return result;
	}

	public int cancelReservation(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result;

		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.CANCEL_RESERVATION);

			ps.setString(1, userId);

			result = ps.executeUpdate();
			System.out.println("타임슬럿 0 으로 초기화 " + result + "개 성공");

		} finally {
			closeAll(ps, con);
		}
		return result;
	}

	public int deleteLog(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result;

		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.DELETE_LOG);

			ps.setString(1, userId);

			result = ps.executeUpdate();
			System.out.println("로그  삭제 " + result + "개 성공");

		} finally {
			closeAll(ps, con);
		}
		return result;
	}

	public ArrayList<MemberVO> getNameInGroup(int selectedTime, int groupColor) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.GET_NAME_IN_GROUP_BY_ID_GROUPCOLOR);
			ps.setInt(1, selectedTime);
			ps.setInt(2, groupColor);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new MemberVO(rs.getString("userName")));
			}
		} finally {
			closeAll(rs, ps, con);
		}
		return list;
	}

	public boolean isReservation(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;

		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.IS_RESERVATION);

			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getInt(1) == 1)
					result = true;

				System.out.println(" isreservation dao값:" + result);

			}
		} finally {
			closeAll(rs, ps, con);
		}
		return result;
	}

	public Date getReserveDate(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Date date = null;

		try {
			con = getConnection();

			ps = con.prepareStatement(StringQuery.GET_RESERVE_DATE);

			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next()) {
				date = rs.getDate(1);

				System.out.println(" getReserveDate dao값:" + date);

			}
		} finally {
			closeAll(rs, ps, con);
		}
		return date;
	}
	
	public void updateStartTime(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.UPDATE_START_TIME);
			ps.setString(1, userId);
			
			int result = ps.executeUpdate();

			 System.out.println("updateStartTime 성공갯수"+result);

		} finally {
			closeAll(ps, conn);
		}
	}
	
	public void updateFinishTime(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.UPDATE_FINISH_TIME);
			ps.setString(1, userId);
			
			int result = ps.executeUpdate();

			 System.out.println("updateFinishTime 성공갯수"+result);

		} finally {
			closeAll(ps, conn);
		}
	}
	/*public static void main(String[] args) throws SQLException {
		
		//String findId=MemberDAO.getInstance().findIdByEmail("admin", "ealurill", "@naver.com");
		//System.out.println(findId);
		//int result=MemberDAO.getInstance().updateFindPass("TempPassword123", "tester","테스터", "tester", "@naver.com");
		//System.out.println(result);
		//문제점 디비 비밀번호 저장공간이 너무적다  USERPASS  NOT NULL VARCHAR2(60) 상향요청
	boolean result=MemberDAO.getInstance().isExist("test");
	System.out.println(result);
	}
	*/

}