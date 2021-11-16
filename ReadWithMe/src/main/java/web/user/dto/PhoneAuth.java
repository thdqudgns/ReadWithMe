package web.user.dto;

public class PhoneAuth {
	private String phone;
	private String authKey;
	@Override
	public String toString() {
		return "PhoneAuth [phone=" + phone + ", authKey=" + authKey + "]";
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	
	
}
