package web.user.dto;

public class Notice_file {
	private int board_no;
	private int file_no;
	private String origin_name;
	private String stored_name;
	
	@Override
	public String toString() {
		return "Notice_file [board_no=" + board_no + ", file_no=" + file_no + ", origin_name=" + origin_name
				+ ", stored_name=" + stored_name + "]";
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getStored_name() {
		return stored_name;
	}
	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
	
	
	
}
