package web.user.dto;

import java.util.Date;

public class Message {
	private int msg_no;
	private int send_user;
	private int rec_user;
	private String msg_title;
	private String msg_content;
	private Date send_date;
	private String msg_read;
	
	@Override
	public String toString() {
		return "Message [msg_no=" + msg_no + ", send_use=" + send_user + ", rec_user=" + rec_user + ", msg_title="
				+ msg_title + ", msg_content=" + msg_content + ", msg_read=" + msg_read + "]";
	}
	
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public int getSend_user() {
		return send_user;
	}
	public void setSend_user(int send_user) {
		this.send_user = send_user;
	}
	public int getRec_user() {
		return rec_user;
	}
	public void setRec_user(int rec_user) {
		this.rec_user = rec_user;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public String getMsg_read() {
		return msg_read;
	}
	public void setMsg_read(String msg_read) {
		this.msg_read = msg_read;
	}
	
}
