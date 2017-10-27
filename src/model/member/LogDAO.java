package model.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.OracleInfo;
import constants.StringQuery;
import dataSourceManager.DataSourceManager;

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

	///////////////////////////////////////////////
	
	public int getWeeklyAttananceById(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int attandance = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_WKLY_ATTANDANCE_BY_ID);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				attandance = rs.getInt(1);
			}
		} finally {
			closeAll(rs,pstmt,conn);
		}
		return attandance;
	}
	
	public int getMonthlyAttananceById(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int attandance = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(StringQuery.SELECT_MTHLY_ATTANDANCE_BY_ID);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				attandance = rs.getInt(1);
			}
		} finally {
			closeAll(rs,pstmt,conn);
		}
		return attandance;
	}
	
	/*public static void main(String[] args) throws Exception {
		LogDAO dao = LogDAO.getInstance();
		System.out.println(dao.getWeeklyAttananceById("myId1"));
		System.out.println(dao.getMonthlyAttananceById("myId1"));

	}*/
}
