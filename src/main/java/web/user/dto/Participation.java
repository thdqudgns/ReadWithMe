package web.user.dto;

public class Participation {
	private int meetion_no;
	private int user_no;
	@Override
	public String toString() {
		return "Participation [meetion_no=" + meetion_no + ", user_no=" + user_no + "]";
	}
	public int getMeetion_no() {
		return meetion_no;
	}
	public void setMeetion_no(int meetion_no) {
		this.meetion_no = meetion_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
}
