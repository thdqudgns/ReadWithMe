package web.user.dto;

public class Interest {
	private int user_no;
	private String interest;
	private String interest2;
	private String interest3;
	@Override
	public String toString() {
		return "Interest [user_no=" + user_no + ", interest=" + interest + ", interest2=" + interest2 + ", interest3="
				+ interest3 + "]";
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
	public String getInterest2() {
		return interest2;
	}
	public void setInterest2(String interest2) {
		this.interest2 = interest2;
	}
	public String getInterest3() {
		return interest3;
	}
	public void setInterest3(String interest3) {
		this.interest3 = interest3;
	}
	
}
