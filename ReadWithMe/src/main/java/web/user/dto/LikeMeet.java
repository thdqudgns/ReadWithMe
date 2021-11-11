package web.user.dto;

public class LikeMeet {
	private int like_no;
	private int meeting_no;
	private int user_no;
	@Override
	public String toString() {
		return "LikeMeet [like_no=" + like_no + ", meeting_no=" + meeting_no + ", user_no=" + user_no + "]";
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
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
