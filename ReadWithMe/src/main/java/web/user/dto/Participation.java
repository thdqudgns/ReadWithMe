package web.user.dto;

public class Participation {
	private int meeting_no;
	private int user_no;
	@Override
	public String toString() {
		return "Participation [meeting_no=" + meeting_no + ", user_no=" + user_no + "]";
	}
	public int getMeeting_no() {
		return meeting_no;
	}
	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
}
