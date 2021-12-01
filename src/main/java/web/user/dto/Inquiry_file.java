package web.user.dto;

public class Inquiry_file {
	private int board_no;
	private int file_no;
	@Override
	public String toString() {
		return "InquiryFile [board_no=" + board_no + ", file_no=" + file_no + "]";
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
	
}
