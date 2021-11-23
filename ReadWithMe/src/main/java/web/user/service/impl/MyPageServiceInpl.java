package web.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import web.user.dao.face.MyPageDao;
import web.user.dto.UserTb;
import web.user.service.face.MyPageService;


@Service
public class MyPageServiceInpl implements MyPageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageService.class);
	@Autowired	MyPageDao myPageDao;
	@Autowired PasswordEncoder passwordEncoder;
	
	@Override
	public void wthdrUser(int user_no) {
		myPageDao.deleteUser(user_no);		
	}
	
	@Override
	public int userPwCheck(UserTb user) {
		
		String pw = user.getPassword();
				
		logger.info("입력받은 비밀번호"+pw);

		String password = myPageDao.selectPwByUser_no(user);
		
		logger.info("실제 비밀번호"+password);
		
		if(passwordEncoder.matches(pw, password)) {
			logger.info("비밀번호 일치");
			user.setPassword(password);
		}else {
			logger.info("비밀번호 불일치");
		}  
	  
		int res = myPageDao.selectCntPwMtc(user);
		logger.info("res!! {}:", res);
		
		return myPageDao.selectCntPwMtc(user);
	}
	
	@Override
	public void pwChange(UserTb user) {
		
		String encPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encPassword);
		logger.info("암호화된 비밀번호 : "+user.getPassword());
		
		myPageDao.updatePw(user);
		
	}
	
	@Override
	public UserTb getUserProfile(UserTb user) {
		return myPageDao.selectUserByUser_no(user);
	}
}
