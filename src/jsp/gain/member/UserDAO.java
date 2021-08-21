package jsp.gain.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import javax.naming.NamingException;

import jsp.util.DBConn;

public class UserDAO {

	
		private static UserDAO instance;
		
		private UserDAO() {}
		
		public static UserDAO getInstance() {
			if (instance ==null)
				instance = new UserDAO();
			return instance;
		}
		
		
		public void insertUser(UserBean user) throws SQLException
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				
				conn = DBConn.getConnection();
				conn.setAutoCommit(false);
				
				StringBuffer sql = new StringBuffer();
				sql.append("INSERT INTO gain.member (name, email, password, phonenum) values");
				sql.append("(?,?,?,?)");
				
				
				
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getEmail1()+"@"+user.getEmail2());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getPhonenum());
				
				pstmt.executeUpdate();
				conn.commit();
				
			} catch (ClassNotFoundException | NamingException | SQLException sqle) {
				
				conn.rollback();
				
				throw new RuntimeException(sqle.getMessage());
			} 
			
		}
		
		public String getname(String email)
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String dbname = "";
			
			try {
				
				StringBuffer qry = new StringBuffer();
				qry.append("SELECT name FROM gain.member WHERE email=?");
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry.toString());
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if (rs.next())
				{
					/* 여기부터 코딩 다시 시작....*/
					dbname = rs.getString("name");
					return dbname;
				}
				
			}catch (Exception sqle) {
				throw new RuntimeException(sqle.getMessage());
			} 	
			return "";
		}	
		
		
		public int loginCheck(String email,String pw)
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String dbpw = "";
			int signal = 0;
			
			try {
				     
				StringBuffer qry = new StringBuffer();
				qry.append("SELECT password FROM gain.member WHERE email=?");
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry.toString());
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if (rs.next())
				{
					dbpw = rs.getString("password");
					
					if (dbpw.equals(pw)) signal=1;
					else signal=0;
					
				} else {
					signal=-1;
				}
				
				return signal;
				
			}catch (Exception sqle) {
				throw new RuntimeException(sqle.getMessage());
			} 	
		}	
}
