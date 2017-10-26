package model.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.OracleInfo;
import constants.StringQuery;

public class LogDAO {
	private static LogDAO dao = new LogDAO();
	private LogDAO() {
		
	}
	public static LogDAO getInstance() {
		return dao;
	}

	/////////////// 공통적인 로직 /////////////////////////////
	public Connection getConnection() throws SQLException {
		// System.out.println("디비연결 성공....");
		//return DataSourceManager.getInstance().getConnection();
		 return DriverManager.getConnection(OracleInfo.URL, OracleInfo.USER,
		 OracleInfo.PASS);
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

	///////////////////////////////////////////////
	
	public int getWeeklyAttendanceByUserId(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int attendance = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_WEEKLY_ATTENDANCE_BY_ID);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				attendance = rs.getInt(1);
			}
		} finally {
			closeAll(rs,pstmt,conn);
		}
		return attendance;
	}
	
	public static void main(String[] args) throws Exception {
		LogDAO dao = LogDAO.getInstance();
		System.out.println(dao.getWeeklyAttendanceByUserId("myId1"));
	}
}
