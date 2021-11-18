package web.user.dto;

public class Review_rec {
	
	private int user_no;
	private int review_no;
	@Override
	public String toString() {
		return "Review_rec [user_no=" + user_no + ", review_no=" + review_no + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	
	
	
	


}
