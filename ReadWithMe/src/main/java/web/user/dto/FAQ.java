package web.user.dto;

import java.util.Date;

public class FAQ {
	private int board_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	@Override
	public String toString() {
		return "FAQ [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content + "]";
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

}
