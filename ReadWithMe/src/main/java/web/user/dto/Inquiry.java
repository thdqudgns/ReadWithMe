package web.user.dto;

import java.util.Date;

public class Inquiry {
	private int board_no;
	private int user_no;
	private String nickname;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String writer_id;
	private String writer_name;
	private int check_reply;
	
	
	@Override
	public String toString() {
		return "Inquiry [board_no=" + board_no + ", user_no=" + user_no + ", nickname=" + nickname + ", board_title="
				+ board_title + ", board_content=" + board_content + ", board_date=" + board_date + ", writer_id="
				+ writer_id + ", writer_name=" + writer_name + ", check_reply=" + check_reply + "]";
	}

	

	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
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


	public String getWriter_id() {
		return writer_id;
	}


	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}


	public String getWriter_name() {
		return writer_name;
	}


	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}


	public int getCheck_reply() {
		return check_reply;
	}


	public void setCheck_reply(int check_reply) {
		this.check_reply = check_reply;
	}
	
	
	
	
	
	
}
	
	