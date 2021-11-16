package web.user.dto;

public class UserAuth {
	private String email;
	private String authKey;
	@Override
	public String toString() {
		return "UserAuth [email=" + email + ", authKey=" + authKey + "]";
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	
	

}
