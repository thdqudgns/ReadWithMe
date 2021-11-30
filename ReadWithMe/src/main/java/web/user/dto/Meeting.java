package web.user.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Meeting {
	private int meeting_no;
	private int user_no;
	private int meetingtype_no;
	private int area_no;
	private int book_class_no;
	private String meeting_location;
	private String meeting_title;
	private String meeting_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meeting_rcr_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meeting_rcr_end;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meeting_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meeting_end;
	private String meeting_personnel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meeting_board_date;
	private String meeting_approved;

	@Override
	public String toString() {
		return "Meeting [meeting_no=" + meeting_no + ", user_no=" + user_no + ", meetingtype_no=" + meetingtype_no
				+ ", area_no=" + area_no + ", book_class_no=" + book_class_no + ", meeting_location=" + meeting_location
				+ ", meeting_title=" + meeting_title + ", meeting_content=" + meeting_content + ", meeting_rcr_start="
				+ meeting_rcr_start + ", meeting_rcr_end=" + meeting_rcr_end + ", meeting_start=" + meeting_start
				+ ", meeting_end=" + meeting_end + ", meeting_personnel=" + meeting_personnel + ", meeting_board_date="
				+ meeting_board_date + ", meeting_approved=" + meeting_approved + "]";
	}

	public int getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getMeetingtype_no() {
		return meetingtype_no;
	}

	public void setMeetingtype_no(int meetingtype_no) {
		this.meetingtype_no = meetingtype_no;
	}

	public int getArea_no() {
		return area_no;
	}

	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}

	public int getBook_class_no() {
		return book_class_no;
	}

	public void setBook_class_no(int book_class_no) {
		this.book_class_no = book_class_no;
	}

	public String getMeeting_location() {
		return meeting_location;
	}

	public void setMeeting_location(String meeting_location) {
		this.meeting_location = meeting_location;
	}

	public String getMeeting_title() {
		return meeting_title;
	}

	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}

	public String getMeeting_content() {
		return meeting_content;
	}

	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
	}

	public Date getMeeting_rcr_start() {
		return meeting_rcr_start;
	}

	public void setMeeting_rcr_start(Date meeting_rcr_start) {
		this.meeting_rcr_start = meeting_rcr_start;
	}

	public Date getMeeting_rcr_end() {
		return meeting_rcr_end;
	}

	public void setMeeting_rcr_end(Date meeting_rcr_end) {
		this.meeting_rcr_end = meeting_rcr_end;
	}

	public Date getMeeting_start() {
		return meeting_start;
	}

	public void setMeeting_start(Date meeting_start) {
		this.meeting_start = meeting_start;
	}

	public Date getMeeting_end() {
		return meeting_end;
	}

	public void setMeeting_end(Date meeting_end) {
		this.meeting_end = meeting_end;
	}

	public String getMeeting_personnel() {
		return meeting_personnel;
	}

	public void setMeeting_personnel(String meeting_personnel) {
		this.meeting_personnel = meeting_personnel;
	}

	public Date getMeeting_board_date() {
		return meeting_board_date;
	}

	public void setMeeting_board_date(Date meeting_board_date) {
		this.meeting_board_date = meeting_board_date;
	}

	public String getMeeting_approved() {
		return meeting_approved;
	}

	public void setMeeting_approved(String meeting_approved) {
		this.meeting_approved = meeting_approved;
	}
}
