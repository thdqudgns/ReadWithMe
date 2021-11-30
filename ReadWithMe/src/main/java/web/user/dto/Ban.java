package web.user.dto;

import java.util.Date;

public class Ban {
	private int ban_no;
	private int user_no;
	private Date start_ban;
	private Date end_ban;
	@Override
	public String toString() {
		return "BAN [ban_no=" + ban_no + ", user_no=" + user_no + ", start_ban=" + start_ban + "]";
	}
	public int getBan_no() {
		return ban_no;
	}
	public void setBan_no(int ban_no) {
		this.ban_no = ban_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getStart_ban() {
		return start_ban;
	}
	public void setStart_ban(Date start_ban) {
		this.start_ban = start_ban;
	}
	public Date getEnd_ban() {
		return end_ban;
	}
	public void setEnd_ban(Date end_ban) {
		this.end_ban = end_ban;
	}
	
	
}
