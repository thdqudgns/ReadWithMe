package web.user.dto;

public class FileTb {
	private int file_no;
	private int user_no;
	private String url;
	private String stored_name;
	private String origin_name;
	@Override
	public String toString() {
		return "FileTb [file_no=" + file_no + ", user_no=" + user_no + ", url=" + url + ", stored_name=" + stored_name
				+ ", origin_name=" + origin_name + "]";
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getStored_name() {
		return stored_name;
	}
	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	
	
	
}
