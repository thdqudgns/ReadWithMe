package web.user.dto;

public class Score {
	private int user_no;
	private int total_score;
	private int evaluators;
	@Override
	public String toString() {
		return "Score [user_no=" + user_no + ", total_score=" + total_score + ", evaluators=" + evaluators + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public int getEvaluators() {
		return evaluators;
	}
	public void setEvaluators(int evaluators) {
		this.evaluators = evaluators;
	}
	
	
}
