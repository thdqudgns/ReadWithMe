package web.user.dto;

import java.util.Date;

public class Member {
	private int user_no;
	private String user_lv;
	private String id;
	private String password;
	private String type;
	private String name;
	private String nick;
	private String email;
	private String phone;
	private Date birth;
	private String location;
	private String gender;
	private String profile;
	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_lv=" + user_lv + ", id=" + id + ", password=" + password
				+ ", type=" + type + ", name=" + name + ", nick=" + nick + ", email=" + email + ", phone=" + phone
				+ ", birth=" + birth + ", location=" + location + ", gender=" + gender + ", profile=" + profile + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_lv() {
		return user_lv;
	}
	public void setUser_lv(String user_lv) {
		this.user_lv = user_lv;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	


}
