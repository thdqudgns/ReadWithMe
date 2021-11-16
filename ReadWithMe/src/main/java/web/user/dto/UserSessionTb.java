package web.user.dto;

public class UserSessionTb {

	private int user_no;
	private String session_key;
	private String session_limit;
	@Override
	public String toString() {
		return "UserSessionTb [user_no=" + user_no + ", session_key=" + session_key + ", session_limit=" + session_limit
				+ "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getSession_key() {
		return session_key;
	}
	public void setSession_key(String session_key) {
		this.session_key = session_key;
	}
	public String getSession_limit() {
		return session_limit;
	}
	public void setSession_limit(String session_limit) {
		this.session_limit = session_limit;
	}
	
	
}
