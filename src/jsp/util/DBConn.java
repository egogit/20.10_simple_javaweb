package jsp.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.NamingException;

public class DBConn {

	
	public static Connection getConnection() throws SQLException, NamingException, ClassNotFoundException{
	
		Connection conn = null;
		try {
			String url = "jdbc:mysql://localhost:3306/gain?characterEncoding=UTF-8&serverTimezone=UTC&autoReconnect=true";
			String user = "m1r1st4r";
			String password = "test";
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
		public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs){
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {            
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}
	
}
