package web.user.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.user.dao.face.LoginDao;
import web.user.dto.Interest;
import web.user.dto.PhoneAuth;
import web.user.dto.Social_account;
import web.user.dto.Ban;
import web.user.dto.EmailAuth;
import web.user.dto.UserTb;
import web.user.service.face.LoginService;
import web.util.MailHandler;
import web.util.MessageService;
import web.util.TempKey;
@Service
public class LoginServiceImpl implements LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	@Autowired LoginDao loginDao;
	@Autowired PasswordEncoder passwordEncoder;
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public int userIdCheck(String id) {
		return loginDao.selectCntById(id);
	}
	
	@Override
	public int userNickCheck(String nick) {
		return loginDao.selectCntByNick(nick);
	}
	
	@Override
	public int userEmailCheck(String email) {
		return loginDao.selectCntByEmailInUserTb(email);
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

		if( interests.length == 1 ) {
			
			interest.setInterest(interests[0]);
			logger.info("interests확인 {}", interest);
			
		} else if( interests.length == 2 ) {
			
			interest.setInterest(interests[0]);
			interest.setInterest2(interests[1]);
			logger.info("interests확인1 {}", interest);
			
		} else if( interests.length == 3 ) {
			
			interest.setInterest(interests[0]);
			interest.setInterest2(interests[1]);
			interest.setInterest3(interests[2]);
			logger.info("interests확인2 {}", interest);
			
		}
		
		
		logger.info("interest 입니다 {}", interest);
		
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
				
				if( loginDao.selectCnt(user) >=1 ) {
					return true;
				} else {
					return false;
				}		
			}else {
				logger.info("비밀번호 불일치");
				return false;
			}  

	}
	
	@Override
	public String getNick(String user) {
		return loginDao.selectNickByUser(user);
	}
	
	@Override
	public String getUserNo(String user) {
		return loginDao.selectUserNoByUser(user);
	}
	
	@Override
	public String getUserLv(String user) {
		return loginDao.selectUserLvByUser(user);
	}
	
	@Override
	public boolean getKakaoId(UserTb user) {
		
		if( loginDao.selectCntById(user.getId()) > 0) {
			return true;
		}	
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
	public boolean create(EmailAuth user) {

		if( loginDao.selectCntByEmailInEmailAuth(user) > 0) {
			return false;
		} else {
		
		String key = new TempKey().getKey(50, false); // 인증키 생성
		user.setAuthKey(key);
	
		loginDao.createAuthKey(user); // 인증키 DB저장
		
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[이메일 본인 인증]");
			sendMail.setText( // 메일내용
					"<h1>메일인증</h1>" +
					"<a href='http://localhost:8888/email/confirm?email=" + user.getEmail() +
					"&key=" + key +
					"' target='_blenk'>이메일 인증 확인</a>");
			sendMail.setFrom("anzu.only@gmail.com", "Read With Me");
			sendMail.setTo(user.getEmail());
			sendMail.send();
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return true;
		
		}
	}
	
	@Override
	public void userAuth(UserTb user) {
		if(user.getEmail() != "" && user.getEmail() != null) {
			loginDao.userEmailAuth(user.getEmail());				
		} else if (user.getPhone() != "" && user.getPhone() != null) {
			loginDao.userPhonAuth(user.getPhone());
		}
	}
	
	@Override
	public void savePhoneRegister(UserTb user, String random) {
		PhoneAuth phoneAuth = new PhoneAuth();
		phoneAuth.setPhone(user.getPhone());
		phoneAuth.setAuthKey(random);
		
		loginDao.insertPhone(phoneAuth);
	}
	
	@Override
	public boolean phoneRegister(PhoneAuth phoneAuth) {
		if( loginDao.selectCntByPhoneAuth(phoneAuth) > 0) {
			return true;
		} else {
			return false;			
		}
	}
	
	
	@Override
	public boolean getNaverId(UserTb user) {		
		if( loginDao.selectCntById(user.getId()) > 0) {
			return true;
		}	
		return false;
	}
	
	
	@Override
	public boolean findPw(UserTb user) {
		
		if( user.getEmail() != "" && user.getEmail() != null) {
			
			if(loginDao.selectCntByEmailandId(user) > 0) {
				return true;
			} else {
				return false;				
			}
			
		} else if ( user.getPhone() != "" && user.getPhone() != null ) {
			logger.info("getPhone()");
			
			if(loginDao.selectCntByPhoneandId(user) > 0) {
				return true;
			} else {
				return false;				
			}			
		}
		return false;		
	}
	
	@Override
	public void sendPwByEmail(UserTb user) {
		logger.info("sendPwByEmail()");
					
			String random = MessageService.makePwRandom(10);
			

			String encPassword = passwordEncoder.encode(random);
			user.setPassword(encPassword);
			logger.info("암호화된 비밀번호 : "+user.getPassword());

			loginDao.updatePw(user);
		
			try {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("[임시 비밀번호]");
				sendMail.setText( 
						"<h1>임시 비밀번호</h1>" +
						"고객님의 임시 비밀번호는" + random + "입니다<br>" +
						"개인정보 보호를 위해 로그인 후 꼭 비밀번호를 바꿔주세요!");
				sendMail.setFrom("anzu.only@gmail.com", "Read With Me");
				sendMail.setTo(user.getEmail());
				sendMail.send();
			} catch (MessagingException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}

	}
	
	@Override
	public void sendPwByPhone(UserTb user) {
		logger.info("sendPwByPhone()");
		
		String random = MessageService.makePwRandom(10);		

		String encPassword = passwordEncoder.encode(random);
		user.setPassword(encPassword);
		logger.info("암호화된 비밀번호 : "+user.getPassword());

		loginDao.updatePw(user);
		
//		MessageService.sendPwMessage(user.getPhone(), random);		
	}
	
	
	
	@Override
	public String findId(UserTb user) {
		
		String id = null;
		
		if( user.getEmail() != "" && user.getEmail() != null) {
			id = loginDao.selectIdByEmail(user);
		} else if ( user.getPhone() != "" && user.getPhone() != null ) {
			id =loginDao.selectIdByPhone(user);
		}
		
		return id;
		
	}
	
	@Override
	public void findEmail(UserTb user) {
		loginDao.deleteEmail(user);
	}
	
	@Override
	public Ban banUser(int user_no) {
		return loginDao.selectBanUser(user_no);
	}
	
	@Override
	public boolean isBan(int user_no) {
		
		if( loginDao.selectCntIsBanUser(user_no) < 1 ) {
			logger.info("트루입니다");
			return true;			
		} else {
			logger.info("트루가 아닙니다");
			loginDao.updateUser(user_no);
			loginDao.deleteBan(user_no);
			return false;			
		}
	}


	@Override
	public void keepLogin(UserTb user) {
		loginDao.keepLogin(user);		
	}

	@Override
	public UserTb checkUserWithSessionKey(UserTb user) {
		return loginDao.selectUserBySessionKey(user);
	}
	
	@Override
	public boolean AutoLogin(UserTb user) {
		if( loginDao.selectCnt(user) >=1 ) {
			return true;
		} else {
			return false;
		}	
	}

}
