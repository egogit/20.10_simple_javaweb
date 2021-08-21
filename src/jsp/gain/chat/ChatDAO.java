package jsp.gain.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jsp.util.DBConn;

public class ChatDAO {

	private static ChatDAO instance;
	private PreparedStatement pstmt = null;
	private Connection conn = null;
	private ResultSet rs = null;
	
	public ChatDAO() {
		
		conn = null;
		try {
			conn = DBConn.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static ChatDAO getInstance() {
		if (instance == null)
			instance = new ChatDAO();
		return instance;
	}
	
	public ArrayList<ChatBean> getChatList(String time) {
		ArrayList<ChatBean> chatList = null;
		
		String qry = "SELECT * FROM GAIN.CHAT WHERE CHATTIME > ? ORDER BY CHATTIME";
		
		try {
			
			pstmt = conn.prepareStatement(qry);
			pstmt.setString(1, time);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<ChatBean>();
			
			while (rs.next()) {
				ChatBean chat = new ChatBean();
				chat.setChatUser("chatUser");
				chat.setChatContent("chatContent");
				chat.setChatTime(rs.getString("chatTime"));
				chatList.add(chat);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return chatList;
		
		
	}
	
	
	public int submit(String chatUser, String chatContent) {
		
		String qry = "INSERT INTO GAIN.CHAT VALUES (? ,? , NOW())";
		
		try {
			
			pstmt = conn.prepareStatement(qry);
			pstmt.setString(1, chatUser);
			pstmt.setString(2, chatContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
