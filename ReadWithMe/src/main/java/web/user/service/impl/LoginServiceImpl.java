package web.user.service.impl;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.LoginDao;
import web.user.dto.Member;
import web.user.dto.Social_account;
import web.user.service.face.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	@Autowired LoginDao loginDao;
	
	@Override
	public void join(Member member) {
		loginDao.join(member);
		
	}
	
	@Override
	public void login(Member member) {
		loginDao.login(member);
		
	}

	@Override
	public void naverLogin(Social_account social) {
		loginDao.naverLogin(social);
		
	}

	@Override
	public void googleLogin(Social_account social) {
		loginDao.googleLogin(social);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void kakaoLogin(Social_account social) {
		// TODO Auto-generated method stub
		loginDao.kakaoLogin(social);
		
	}

	@Override
	public void findId(Member member) {
		loginDao.selectIdByEmail(member);
		
	}

	@Override
	public void findPw(Member member) {
		loginDao.selectPwById(member);
		
	}
	

}
