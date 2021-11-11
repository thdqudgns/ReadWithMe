package web.user.dto;

import java.util.Date;

public class Famous {
	private int famous_no;
	private int user_no;
	private String famous_content;
	private Date famous_date;
	private int famous_rcmnd;
	@Override
	public String toString() {
		return "Famous [famous_no=" + famous_no + ", user_no=" + user_no + ", famous_content=" + famous_content
				+ ", famous_rcmnd=" + famous_rcmnd + "]";
	}
	public int getFamous_no() {
		return famous_no;
	}
	public void setFamous_no(int famous_no) {
		this.famous_no = famous_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getFamous_content() {
		return famous_content;
	}
	public void setFamous_content(String famous_content) {
		this.famous_content = famous_content;
	}
	public Date getFamous_date() {
		return famous_date;
	}
	public void setFamous_date(Date famous_date) {
		this.famous_date = famous_date;
	}
	public int getFamous_rcmnd() {
		return famous_rcmnd;
	}
	public void setFamous_rcmnd(int famous_rcmnd) {
		this.famous_rcmnd = famous_rcmnd;
	}
	
}
