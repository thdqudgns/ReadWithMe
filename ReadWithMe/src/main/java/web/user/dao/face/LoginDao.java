package web.user.dao.face;

import web.user.dto.Member;
import web.user.dto.Social_account;

public interface LoginDao {

	public void join(Member member);

	public void login(Member member);

	public void naverLogin(Social_account social);

	public void googleLogin(Social_account social);

	public void kakaoLogin(Social_account social);

	public void selectIdByEmail(Member member);

	public void selectPwById(Member member);

	/**
	 * id가 존재하는 값인지 확인한다
	 * @param id - 조회하려는 회원의 id
	 * @return 
	 */
	public int selectCntById(String id);

}
