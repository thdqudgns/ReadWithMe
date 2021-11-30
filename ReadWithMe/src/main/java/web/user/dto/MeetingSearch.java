package web.user.dto;

import java.util.List;

public class MeetingSearch {
	private List<Integer> area_no;
	private List<Integer> meetingtype_no;
	private List<Integer> book_class_no;
	private String searchType;
	private String searchWord;
	
	@Override
	public String toString() {
		return "MeetingSearch [area_no=" + area_no + ", meetingtype_no=" + meetingtype_no + ", book_class_no="
				+ book_class_no + ", searchType=" + searchType + ", searchWord=" + searchWord + "]";
	}
	
	public List<Integer> getArea_no() {
		return area_no;
	}
	public void setArea_no(List<Integer> area_no) {
		this.area_no = area_no;
	}
	public List<Integer> getMeetingtype_no() {
		return meetingtype_no;
	}
	public void setMeetingtype_no(List<Integer> meetingtype_no) {
		this.meetingtype_no = meetingtype_no;
	}
	public List<Integer> getBook_class_no() {
		return book_class_no;
	}
	public void setBook_class_no(List<Integer> book_class_no) {
		this.book_class_no = book_class_no;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}
