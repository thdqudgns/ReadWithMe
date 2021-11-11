package web.user.dto;

import java.util.Date;

public class Review {
	private int review_no;
	private int user_no;
	private String review_title;
	private String review_content;
	private Date review_date;
	private int review_views;
	private int review_rcmnd;
	private Date review_last_modify;
	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", user_no=" + user_no + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", review_views=" + review_views + ", review_rcmnd="
				+ review_rcmnd + "]";
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
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_views() {
		return review_views;
	}
	public void setReview_views(int review_views) {
		this.review_views = review_views;
	}
	public int getReview_rcmnd() {
		return review_rcmnd;
	}
	public void setReview_rcmnd(int review_rcmnd) {
		this.review_rcmnd = review_rcmnd;
	}
	public Date getReview_last_modify() {
		return review_last_modify;
	}
	public void setReview_last_modify(Date review_last_modify) {
		this.review_last_modify = review_last_modify;
	}
	
}
