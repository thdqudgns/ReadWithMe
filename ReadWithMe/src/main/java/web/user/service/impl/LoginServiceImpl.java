package web.user.service.impl;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.LoginDao;
import web.user.dto.Interest;
import web.user.dto.Member;
import web.user.dto.Social_account;
import web.user.service.face.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	@Autowired LoginDao loginDao;
	
	@Override
	public int userIdCheck(String id) {
		return loginDao.selectCntById(id);
	}
	
@Override
	public boolean join(Member member, HttpServletRequest req) {
		logger.info("join() 호출 {} : ", member);
		
		String[] interests = req.getParameterValues("interest");
		logger.info("interests {}", Arrays.toString(interests));
		
		Interest interest = new Interest();
		if( interests[0] !=null ) {
			interest.setInterest(interests[0]);
		} else if ( interests[1] !=null ) {
			interest.setInterest2(interests[1]);
		} else if ( interests[2] !=null ) {
			interest.setInterest3(interests[2]);
		} 
		
		//회원가입(삽입)
//		loginDao.insertMember(member);
		
//		//회원가입 결과 확인
//		if( loginDao.selectCntById(member) > 0) {
//			return true;
//		}	
		return false;
	
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
