package web.user.dto;

public class Famous_rec {
	
	private int user_no;
	private int famous_no;
	@Override
	public String toString() {
		return "Famous_rec [user_no=" + user_no + ", famous_no=" + famous_no + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getFamous_no() {
		return famous_no;
	}
	public void setFamous_no(int famous_no) {
		this.famous_no = famous_no;
	}
	
	


}
