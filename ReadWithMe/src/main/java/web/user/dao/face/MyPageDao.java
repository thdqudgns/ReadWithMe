package web.user.dao.face;

import web.user.dto.UserTb;

public interface MyPageDao {

	/**
	 * 회원탈퇴
	 * @param user_no
	 */
	public void deleteUser(int user_no);
	
	/**
	 * 비밀번호 변경 위해 현재 비밀번호 확인
	 * @param user
	 * @return
	 */
	public String selectPwByUser_no(UserTb user);

	/**
	 * 비밀번호 변경 위해 현재 비밀번호가 맞는지 확인
	 * @param user
	 * @return
	 */
	public int selectCntPwMtc(UserTb user);

	/**
	 * 비밀번호 변경
	 * @param user
	 */
	public void updatePw(UserTb user);

	/**
	 * user_no으로 user프로필 정보 가져오기
	 * @param user
	 * @return
	 */
	public UserTb selectUserByUser_no(UserTb user);

}
