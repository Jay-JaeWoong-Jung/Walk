package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.Date;



import config.OracleInfo;
import constants.StringQuery;
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
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		return dao;
	}
	/////////////// 공통적인 로직 /////////////////////////////
	public  Connection getConnection() throws SQLException{
		//System.out.println("디비연결 성공....");
		return DataSourceManager.getInstance().getConnection();
		//return DriverManager.getConnection(OracleInfo.URL, OracleInfo.USER, OracleInfo.PASS);
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
			ps=con.prepareStatement(StringQuery.INSERT_MEMBER);
			
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
	public ArrayList<Pair<String,Integer>> getAllUserIdTimePair() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		ArrayList<Pair<String,Integer>> list = null;
		try {
			con=getConnection();
			list = new ArrayList<Pair<String,Integer>>();
			ps=con.prepareStatement(StringQuery.GET_ALL_USERID_TIMESLOT);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Pair(rs.getString(1), rs.getInt(2)));	
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return list;
	}
	public ArrayList<Pair<String,Integer>> getUserIdFlagPairByTimeSlot(int timeSlot) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		ArrayList<Pair<String,Integer>> list = null;
		try {
			con=getConnection();
			list = new ArrayList<Pair<String,Integer>>();
			ps=con.prepareStatement(StringQuery.GET_USERID_FLAG_BY_TIMESLOT);
			ps.setInt(1, timeSlot);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Pair(rs.getString(1), rs.getInt(2)));	
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return list;
	}
	public ArrayList<String> getUserIDsByTimeSlot(int timeSlot) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		ArrayList<String> list = null;
		try {
			con=getConnection();
			list = new ArrayList<String>();
			ps=con.prepareStatement(StringQuery.GET_USERID_BY_TIMESLOT);
			ps.setInt(1, timeSlot);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));	
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return list;
	}
	public void updateAssignedGroup(String userId, int flag) throws SQLException {
		Connection conn=null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.UPDATE_FLAG);
			ps.setString(2, userId);
			ps.setInt(1, flag);
			int result = ps.executeUpdate();
			
			//System.out.println("update ok.."+result);
			
		}finally {
			closeAll(ps, conn);
		}
	}

	public void chooseTimeSlot(int selectedTime, String userId) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps=conn.prepareStatement(StringQuery.UPDATE_TIME);
			
			ps.setInt(1,selectedTime);
			ps.setString(2,userId);
			
			
			int row = ps.executeUpdate();
			System.out.println(row+"  chooseTimeSlot row update OK!!");
			

		}finally {
			closeAll(rs,ps, conn);
		}

	}
	
	
	public void setReserveDate(String userId,int attendace) throws SQLException{
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps=conn.prepareStatement(StringQuery.INSERT_DATE);
			
			
			ps.setString(1,userId);
			ps.setInt(2,attendace);
			
			int row = ps.executeUpdate();
			System.out.println(row+" setReserveDate row insert OK!!");
			

		}finally {
			closeAll(rs,ps, conn);
		}

	}
	
	public void clearFlagNTime(int flag, int selectedTime) throws SQLException {
		Connection conn=null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.CLEAR_FLAG_SELECTEDTIME);
			ps.setInt(1, flag);
			ps.setInt(2, selectedTime);
			int result = ps.executeUpdate();
			
			System.out.println("update ok.."+result);
			
		}finally {
			closeAll(ps, conn);
		}
	}
	
	public MemberVO getReservationInfo(String userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.GET_RESERVATION_INFO_BY_ID);
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				vo=new MemberVO(userId, rs.getString("userName"), rs.getInt("selectedTime"), rs.getInt("flag"));
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return vo;
	}
	
	
	public int getFlagCout(int selectedTime, int flag) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		System.out.println("dao selectedTime:"+selectedTime);
		System.out.println("dao flag:"+flag);
		
		int result=0;
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.GET_SAME_FLAG_COUNT);
			ps.setInt(1, selectedTime);
			ps.setInt(2, flag);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
				System.out.println(result);
			}
		} finally {
			closeAll(ps,con);
		}
		return result;
	}
	
	
	public int updateTimeSlot(int selectedTime, String  userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result;
		
		System.out.println("dao입성  selectedTime:"+selectedTime);
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.UPDATE_TIMESLOT);
			ps.setInt(1, selectedTime);
			ps.setString(2, userId);
			
			result=ps.executeUpdate();
			System.out.println("타임슬럿 변경 "+result+"개 성공");
			
		} finally {
			closeAll(ps,con);
		}
		return result;
	}
	
	public int cancelReservation(String  userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result;
		
		
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.CANCEL_RESERVATION);
			
			ps.setString(1, userId);
			
			result=ps.executeUpdate();
			System.out.println("타임슬럿 0 으로 초기화 "+result+"개 성공");
			
		} finally {
			closeAll(ps,con);
		}
		return result;
	}
	
	public int deleteLog(String  userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result;
		
		
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.DELETE_LOG);
			
			ps.setString(1, userId);
			
			result=ps.executeUpdate();
			System.out.println("로그  삭제 "+result+"개 성공");
			
		} finally {
			closeAll(ps,con);
		}
		return result;
	}
	
	
	public ArrayList<MemberVO> getNameInGroup(int selectedTime, int flag) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		ArrayList<MemberVO> list =new ArrayList<MemberVO>();
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.GET_NAME_IN_GROUP_BY_ID_FLAG);
			ps.setInt(1, selectedTime);
			ps.setInt(2, flag);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new MemberVO(rs.getString("userName")));	
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return list;
	}
	
	public boolean isReservation(String  userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		boolean result=false;
		
		
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.IS_RESERVATION);
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				if (rs.getInt(1) == 1) result=true;
					
			System.out.println(" isreservation dao값:"+result);		
				
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return result;
	}
	
	public Date getReserveDate(String  userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		Date date= null;
		
		
		try {
			con=getConnection();
			
			ps=con.prepareStatement(StringQuery.GET_RESERVE_DATE);
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				date=rs.getDate(1);
				
					
			System.out.println(" getReserveDate dao값:"+date);		
				
			}
		} finally {
			closeAll(rs,ps,con);
		}
		return date;
	}
	
	

	
	/*	
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
		System.out.println(dao.getAllUserIdTimePair());
		//System.out.println(dao.getPostingByNo());
		 
	}
	*/
	



	
	
}
