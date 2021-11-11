package web.user.dto;

public class ToDoList {
	private int list_no;
	private int user_no;
	private String list_content;
	@Override
	public String toString() {
		return "ToDoList [list_no=" + list_no + ", user_no=" + user_no + ", list_content=" + list_content + "]";
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
	
	
}
