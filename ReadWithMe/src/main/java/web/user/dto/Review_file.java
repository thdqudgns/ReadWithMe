package web.user.dto;

public class Review_file {
	private int review_no;
	private int file_no;
	@Override
	public String toString() {
		return "Review_file [review_no=" + review_no + ", file_no=" + file_no + "]";
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	
	
}
