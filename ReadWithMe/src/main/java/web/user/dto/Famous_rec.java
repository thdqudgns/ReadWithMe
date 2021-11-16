package web.user.dto;

public class Famous_rec {
	
	private String user_nick;
	private int famous_no;
	
	@Override
	public String toString() {
		return "Famous_rec [user_nick=" + user_nick + ", famous_no=" + famous_no + "]";
	}
	
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getFamous_no() {
		return famous_no;
	}
	public void setFamous_no(int famous_no) {
		this.famous_no = famous_no;
	}
	
	

}
