package web.user.service.face;

import web.user.dto.Member;
import web.user.dto.Social_account;

public interface LoginService {

	public void join(Member member);

	public void login(Member member);

	public void naverLogin(Social_account social);

	public void googleLogin(Social_account social);

	public void kakaoLogin(Social_account social);

	public void findId(Member member);

	public void findPw(Member member);

}
