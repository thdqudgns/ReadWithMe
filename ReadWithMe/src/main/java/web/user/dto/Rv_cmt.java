package web.user.dto;

import java.util.Date;

public class Rv_cmt {
	private int comment_no;
	private int user_no;
	private int review_no;
	private String comment_content;
	private Date comment_write_date;
	private Date comment_last_modify;
	@Override
	public String toString() {
		return "Rv_cmt [comment_no=" + comment_no + ", user_no=" + user_no + ", review_no=" + review_no
				+ ", comment_content=" + comment_content + "]";
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
	public Date getComment_last_modify() {
		return comment_last_modify;
	}
	public void setComment_last_modify(Date comment_last_modify) {
		this.comment_last_modify = comment_last_modify;
	}
	
}
