package web.user.dto;

public class Meeting_type {
	private int meetingtype_no;
	private String meetingtype_name;
	@Override
	public String toString() {
		return "Meeting_type [meetingtype_no=" + meetingtype_no + ", meetingtype_name=" + meetingtype_name + "]";
	}
	public int getMeetingtype_no() {
		return meetingtype_no;
	}
	public void setMeetingtype_no(int meetingtype_no) {
		this.meetingtype_no = meetingtype_no;
	}
	public String getMeetingtype_name() {
		return meetingtype_name;
	}
	public void setMeetingtype_name(String meetingtype_name) {
		this.meetingtype_name = meetingtype_name;
	}
	
}
