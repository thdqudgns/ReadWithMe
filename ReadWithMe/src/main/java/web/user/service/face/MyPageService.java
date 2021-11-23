package web.user.service.face;

import web.user.dto.UserTb;

public interface MyPageService {

	/**
	 * 회원 탈퇴
	 * @param user_no
	 */
	public void wthdrUser(int user_no);

	/**
	 * 현재 비밀번호가 일치하는지 확인
	 * @param prsntPw
	 * @return
	 */
	public int userPwCheck(UserTb user);

	/**
	 * 비밀번호 변경
	 * @param user
	 */
	public void pwChange(UserTb user);

	/**
	 * 프로필 변경 위해 회원 프로필 가져오기
	 * @param user - user_no이 들어있는 DTO
	 * @return
	 */
	public UserTb getUserProfile(UserTb user);

}
