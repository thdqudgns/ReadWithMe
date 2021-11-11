package web.user.dto;

import java.util.Date;

public class Calender {
	private int schedule_no;
	private int user_no;
	private String cal_content;
	private Date start_date;
	private Date end_date;
	@Override
	public String toString() {
		return "Calender [schedule_no=" + schedule_no + ", user_no=" + user_no + ", cal_content=" + cal_content + "]";
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
}
