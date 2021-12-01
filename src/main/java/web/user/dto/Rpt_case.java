package web.user.dto;

public class Rpt_case {
	private int case_no;
	private String report_case;
	@Override
	public String toString() {
		return "Rpt_case [case_no=" + case_no + ", report_case=" + report_case + "]";
	}
	public int getCase_no() {
		return case_no;
	}
	public void setCase_no(int case_no) {
		this.case_no = case_no;
	}
	public String getReport_case() {
		return report_case;
	}
	public void setReport_case(String report_case) {
		this.report_case = report_case;
	}
	
	
}
