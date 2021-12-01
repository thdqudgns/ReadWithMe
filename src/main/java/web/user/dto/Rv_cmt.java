package web.user.dto;

import java.util.Date;

public class Rv_cmt {
	private int rnum;
	private int comment_no;
	private int review_no;
	private int user_no;
	private String nick;
	private String comment_content;
	private Date comment_write_date;
	@Override
	public String toString() {
		return "Rv_cmt [rnum=" + rnum + ", comment_no=" + comment_no + ", review_no=" + review_no + ", user_no="
				+ user_no + ", nick=" + nick + ", comment_content=" + comment_content + ", comment_write_date="
				+ comment_write_date + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_write_date() {
		return comment_write_date;
	}
	public void setComment_write_date(Date comment_write_date) {
		this.comment_write_date = comment_write_date;
	}
	
	
	
}
