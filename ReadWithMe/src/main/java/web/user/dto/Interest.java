package web.user.dto;

public class Interest {
	private int user_no;
	private String interest;
	@Override
	public String toString() {
		return "Interest [user_no=" + user_no + ", interest=" + interest + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	
}
