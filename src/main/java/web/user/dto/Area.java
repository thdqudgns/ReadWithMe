package web.user.dto;

public class Area {
	private int area_no;
	private String area_name;
	@Override
	public String toString() {
		return "Area [area_no=" + area_no + ", area_name=" + area_name + "]";
	}
	public int getArea_no() {
		return area_no;
	}
	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	
}
