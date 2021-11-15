package web.user.service.impl;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import web.user.dao.face.LoginDao;
import web.user.dto.Interest;
import web.user.dto.UserTb;
import web.user.dto.Social_account;
import web.user.service.face.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	@Autowired LoginDao loginDao;
	@Autowired PasswordEncoder passwordEncoder;
	
	@Override
	public int userIdCheck(String id) {
		return loginDao.selectCntById(id);
	}
	
	@Override
	public int userNickCheck(String nick) {
		return loginDao.selectCntByNick(nick);
		
	}
	
@Override
	public boolean join(UserTb user, HttpServletRequest req) {
		logger.info("join() 호출 {} : ", user);
		
		String[] interests = req.getParameterValues("interest");
		logger.info("interests {}", Arrays.toString(interests));
		
		String encPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encPassword);
		logger.info("암호화된 비밀번호 : "+user.getPassword());
		
		//회원가입(삽입)
		loginDao.insertMember(user);
		
		Interest interest = new Interest();
		
		interest.setUser_no( user.getUser_no() );
		
		if( interests[0] != null ) {
			interest.setInterest(interests[0]);
		} else if ( interests[1] !=null ) {
			interest.setInterest2(interests[1]);
		} else if ( interests[2] !=null ) {
			interest.setInterest3(interests[2]);
		} 
		
		//관심분야(삽입)
		loginDao.insertInterest(interest);
		
		//회원가입 결과 확인
		if( loginDao.selectCntById(user.getId()) > 0) {
			return true;
		}	
		return false;
	
	}
	
	@Override
	public boolean login(UserTb user) {
		
		
		String pw = loginDao.gerUserPw(user);
		
		logger.info("암호화 비밀번호"+pw);
		
		String rawPw = user.getPassword();
		
		logger.info("비밀번호"+rawPw);
		
			if(passwordEncoder.matches(rawPw, pw)) {
				logger.info("비밀번호 일치");
				user.setPassword(pw);
			}else {
				logger.info("비밀번호 불일치");
			}  
		  
		  
		if( loginDao.selectCnt(user) >=1 ) {
			return true;
		} else {
			return false;
		}		
	}
	
	@Override
	public String getNick(String user) {
		return loginDao.selectNickByUser(user);
	}
	
	@Override
	public boolean getKakaoId(UserTb user) {
		
		if( loginDao.selectCntById(user.getId()) > 0) {
			return true;
		}	
		return false;
	}
	
	
	@Override
	public boolean kakaoLogin(UserTb user) {
		
//		if ( loginDao.selectKakaoCnt(user) >= 1 ) {
//			
//		}
		
		
		return false;
	}
	
	
	@Override
	public boolean KakaoJoin(UserTb user, HttpServletRequest req) {
		String[] interests = req.getParameterValues("interest");
		logger.info("interests {}", Arrays.toString(interests));
				
		//회원가입(삽입)
		loginDao.insertKakaoMember(user);
		
		Interest interest = new Interest();
		
		interest.setUser_no( user.getUser_no() );
		
		if( interests[0] != null ) {
			interest.setInterest(interests[0]);
		} else if ( interests[1] !=null ) {
			interest.setInterest2(interests[1]);
		} else if ( interests[2] !=null ) {
			interest.setInterest3(interests[2]);
		} 
		
		//관심분야(삽입)
		loginDao.insertInterest(interest);
		
		//회원가입 결과 확인
		if( loginDao.selectCntById(user.getId()) > 0) {
			return true;
		}	
		return false;
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
	public void findId(UserTb user) {
		loginDao.selectIdByEmail(user);
		
	}

	@Override
	public void findPw(UserTb user) {
		loginDao.selectPwById(user);
		
	}
	

}
