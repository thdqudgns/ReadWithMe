package web.user.dao.face;

import web.user.dto.UserTb;
import web.user.dto.Social_account;

public interface LoginDao {

	public void join(UserTb user);

	public void login(UserTb user);

	public void naverLogin(Social_account social);

	public void googleLogin(Social_account social);

	public void kakaoLogin(Social_account social);

	public void selectIdByEmail(UserTb user);

	public void selectPwById(UserTb user);

	/**
	 * id가 존재하는 값인지 확인한다
	 * @param id - 조회하려는 회원의 id
	 * @return 
	 */
	public int selectCntById(String id);

	/**
	 * nick 이 존재하는 값인지 확인한다
	 * @param nick - 조회하려는 회원의 nick
	 * @return
	 */
	public int selectCntByNick(String nick);

	/**
	 * 회원 가입
	 * @param user
	 */
	public void insertMember(UserTb user);

}
