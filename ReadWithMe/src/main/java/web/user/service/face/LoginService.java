package web.user.service.face;

import javax.servlet.http.HttpServletRequest;

import web.user.dto.Member;
import web.user.dto.Social_account;

public interface LoginService {

	public void login(Member member);

	public void naverLogin(Social_account social);

	public void googleLogin(Social_account social);

	public void kakaoLogin(Social_account social);

	public void findId(Member member);

	public void findPw(Member member);

	/**
	 * 회원가입
	 * @param member - 신규 고객 정보가 들어있는 DTO
	 * @param req - 고객의 관심분야가 들어있음
	 * @return 
	 */
	public boolean join(Member member, HttpServletRequest req);

	/**
	 * 아이디 중복 체크
	 * @param id - 고객이 입력한 아이디
	 * @return
	 */
	public int userIdCheck(String id);

}
