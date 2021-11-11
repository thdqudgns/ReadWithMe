package web.user.dto;

public class Social_account {
	private int user_no;
	private String social_type;
	private String social_key;
	@Override
	public String toString() {
		return "Social_account [user_no=" + user_no + ", social_type=" + social_type + ", social_key=" + social_key
				+ "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getSocial_type() {
		return social_type;
	}
	public void setSocial_type(String social_type) {
		this.social_type = social_type;
	}
	public String getSocial_key() {
		return social_key;
	}
	public void setSocial_key(String social_key) {
		this.social_key = social_key;
	}
	
	

}
