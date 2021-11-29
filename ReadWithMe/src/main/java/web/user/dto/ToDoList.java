package web.user.dto;

import java.util.Date;

public class ToDoList {
	private int list_no;
	private int user_no;
	private String list_content;
	private String bookname;
	private String bookthum;
	private Date start_date;
	@Override
	public String toString() {
		return "ToDoList [list_no=" + list_no + ", user_no=" + user_no + ", list_content=" + list_content
				+ ", bookname=" + bookname + ", bookthum=" + bookthum + ", start_date=" + start_date + "]";
	}
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getList_content() {
		return list_content;
	}
	public void setList_content(String list_content) {
		this.list_content = list_content;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookthum() {
		return bookthum;
	}
	public void setBookthum(String bookthum) {
		this.bookthum = bookthum;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	
	
	
	
	
}
