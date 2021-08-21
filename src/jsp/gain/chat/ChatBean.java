package jsp.gain.chat;

public class ChatBean {
	
	int chatIdx;
	String chatUser;
	String chatContent;
	String chatTime;

	public String getChatUser() {
		return chatUser;
	}
	public void setChatUser(String chatUser) {
		this.chatUser = chatUser;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	
	public int getChatIdx() {
		return chatIdx;
	}
	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
	}

}
