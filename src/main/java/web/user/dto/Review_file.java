package web.user.dto;

public class Review_file {
	private int file_no;
	private int review_no;
	private String origin_name;
	private String stored_name;
	@Override
	public String toString() {
		return "Review_file [file_no=" + file_no + ", review_no=" + review_no + ", origin_name=" + origin_name
				+ ", stored_name=" + stored_name + "]";
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
