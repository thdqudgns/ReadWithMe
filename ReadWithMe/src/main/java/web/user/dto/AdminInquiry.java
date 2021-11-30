package web.user.dto;

import java.sql.Date;

public class AdminInquiry {

	private int rnum;
	private int comment_no;
	private int board_no;
	private String id;
	private String content;
	private Date write_date;
	
	
	@Override
	public String toString() {
		return "AdminInquiry [rnum=" + rnum + ", comment_no=" + comment_no + ", board_no=" + board_no + ", id=" + id
				+ ", content=" + content + ", write_date=" + write_date + "]";
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


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
	
	
	
	
}
