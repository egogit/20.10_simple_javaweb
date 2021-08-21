package jsp.gain.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jsp.util.DBConn;


public class BoardDAO {

	
		private static BoardDAO instance;
		private PreparedStatement pstmt;
		private Connection conn;
		private ResultSet rs;
		private Statement stmt;
		
		public BoardDAO() {
			
			conn = null;
			try {
				conn = DBConn.getConnection();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		public static BoardDAO getInstance() {
			if (instance ==null)
				instance = new BoardDAO();
			return instance;
		}

		/* 게시판 번호  */
		
		public int getnum() {
			
			conn = null;
			stmt = null;
			
			try {
				conn = DBConn.getConnection();
				stmt = conn.createStatement();
				
				String qry = "SELECT boardidx FROM gain.board ORDER BY boardidx DESC";
				
				rs = stmt.executeQuery(qry);
				if (rs.next()) {
					return rs.getInt(1) +1;
				}
				return 1;
				
			} catch (Exception e) {
				
				e.printStackTrace();  
			}
			return -1;
		}
		
			/*글 등록*/
			
		public int boardinsert(String name, String title, String content) {
				
			conn = null;
			pstmt = null;
				
			try {
				conn = DBConn.getConnection();
				stmt = conn.createStatement();
				String qry = "INSERT INTO GAIN.BOARD ( BOARDUSERNAME, BOARDTITLE, BOARDCONTENT, BOARDIDX) VALUES (?,?,?,?)";
				
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry);
				pstmt.setString(1, name);
				System.out.println("set name finish!!");
				pstmt.setString(2, title);
				System.out.println("set title finish!!");
				pstmt.setString(3, content);
				System.out.println("set content finish!!");
				pstmt.setInt(4, getnum());
				System.out.println("Get next number Finish!!");
				
				int success = pstmt.executeUpdate();
				
				return success;
				
				}
				catch (Exception e) {
					
				e.printStackTrace();
				return -1;
				} finally {
					try {
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch(Exception e2){
						e2.printStackTrace();
					}
				}
		}
		
		public int boardupdate(int idx, String title, String content) {
			
			conn = null;
			pstmt = null;
			
			try {
				String qry = "UPDATE GAIN.BOARD SET BOARDTITLE = ? , BOARDCONTENT = ? WHERE BOARDIDX =?";
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry);
				pstmt.setString(1,title);
				pstmt.setString(2,content);
				pstmt.setInt(3, idx);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
			
		}
		
		

		
		/*글 삭제*/
		/*
		public void boarddel(int num) {
			
			conn = null;
			pstmt = null;
			
			try {
				String qry = "DELETE FROM gain.board where boardnum=" + num;
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry);
				pstmt.executeUpdate();
				conn.commit();
			} catch (Exception e) {
				
				e.printStackTrace();
				
				throw new RuntimeException(e.getMessage());
			} finally {
				try {
					if (pstmt !=null) {pstmt.close(); pstmt=null;}
					if (conn !=null) {conn.close(); conn=null;}
				} catch(Exception e) {
					throw new RuntimeException(e.getMessage());
				}
			}
		}
			
		public ArrayList<BoardBean> getList(int pagenum) {
			
			conn = null;
			pstmt = null;
			String qry = "SELECT * FROM gain.board WHERE boardidx < ? and boarddel = 1 ORDER BY boardidx DESC LIMIT 10";
			ArrayList<BoardBean> list = new ArrayList<BoardBean>();
			
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry.toString());
				pstmt.setInt(1, getNext() - (pagenum -1)*10);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BoardBean board = new BoardBean();
					board.setBoardusername(rs.getString(1));
					board.setBoardidx(rs.getInt(2));
					board.setBoardtitle(rs.getString(3));
					board.setBoardusername(rs.getString(4));
					board.setBoarddate(rs.getString(5));
					board.setBoarddel(rs.getInt(6));
					board.setReadcount(rs.getInt(7));
					list.add(board);
				}
			}catch (Exception e) {
				e.printStackTrace();
			} return list;
		}

		public boolean nextPage(int pagenum){
			
			conn = null;
			pstmt = null;
			String qry = "SELECT * FROM gain.board WHERE boardidx < ? and boarddel = 1 ORDER BY boardidx DESC LIMIT 10";	
			ArrayList<BoardBean> list = new ArrayList<BoardBean>();
			
			try {
				conn=DBConn.getConnection();
				pstmt = conn.prepareStatement(qry.toString());
				pstmt.setInt(1, getNext() - (pagenum -1)*10);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		*/
		
		
		
		/* 전체 게시물 갯수*/
		/*
		public int getallnum() {
			
			conn = null;
			pstmt = null;
			rs = null;
			
			int listCount = 0;
			
			try {
				StringBuffer qry = new StringBuffer();
				qry.append("SELECT count(*) from gain.board");
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(qry.toString());
				rs= pstmt.executeQuery();
				conn.commit();
				
				
				if(rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			
			}  return listCount;
			
		}
		*/
		
		
}


