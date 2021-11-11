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

}
