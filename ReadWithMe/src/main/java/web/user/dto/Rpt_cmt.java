package web.user.dto;

import java.util.Date;

public class Rpt_cmt {
	private int report_no;
	private int user_no;
	private int penalty;
	private int dele;
	private int comment_no;
	private String report_content;
	private Date report_date;
	@Override
	public String toString() {
		return "Rpt_cmt [report_no=" + report_no + ", user_no=" + user_no + ", penalty=" + penalty + ", dele=" + dele
				+ ", comment_no=" + comment_no + ", report_content=" + report_content + ", report_date=" + report_date
				+ "]";
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getPenalty() {
		return penalty;
	}
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	public int getDele() {
		return dele;
	}
	public void setDele(int dele) {
		this.dele = dele;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
	
}
