package web.user.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserTb {
	private int user_no;
	private String user_lv;
	private String id;
	private String password;
	private String type;
	private String name;
	private String nick;
	private String email;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String location;
	private String gender;
	private int file_no;
	private String userCertification;
	@Override
	public String toString() {
		return "UserTb [user_no=" + user_no + ", user_lv=" + user_lv + ", id=" + id + ", password=" + password
				+ ", type=" + type + ", name=" + name + ", nick=" + nick + ", email=" + email + ", phone=" + phone
				+ ", birth=" + birth + ", location=" + location + ", gender=" + gender + ", file_no=" + file_no
				+ ", userCertification=" + userCertification + "]";
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
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getUserCertification() {
		return userCertification;
	}
	public void setUserCertification(String userCertification) {
		this.userCertification = userCertification;
	}
	
	
	
	
	
}