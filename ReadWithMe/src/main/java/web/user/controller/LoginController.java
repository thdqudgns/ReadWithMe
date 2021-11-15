package web.user.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.user.dto.Social_account;
import web.user.dto.UserSessionTb;
import web.user.dto.UserTb;
import web.user.service.face.LoginService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(UserTb user, UserSessionTb userSession, HttpSession session, HttpServletResponse resp) {
		
		logger.info("user {}", user);
		boolean isLogin = loginService.login(user);
		
		logger.info("isLogin : {}", isLogin);
		
		if( isLogin ) {
			session.setAttribute("login", isLogin);
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_lv", user.getUser_lv());
			session.setAttribute("user_nick", loginService.getNick(user));
			
//			if( user.getRemember() > 0) {
//				logger.info("remember {}", user.getRemember());
//				Cookie loginCookie = new Cookie("loginCookie", session.getId());
//				loginCookie.setPath("/");
//				int amount = 60*60*24*7;
//				loginCookie.setMaxAge(amount);
//				
//				resp.addCookie(loginCookie);
//				
//				Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
//				loginService.KeepLogin(login.)
//			}
			
			
			
			return "redirect:/";
			
		} else {
			session.invalidate();
			return "/user/member/loginFail";
		}
	}
	
	
	public void socialLogin() {}
	
	public String socialLoginProc(Social_account social, HttpSession session) {
		
		loginService.naverLogin(social);
		loginService.googleLogin(social);
		loginService.kakaoLogin(social);
		return null;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();		
		return "redirect:/";	
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "user/member/join";		
	}
	
	@RequestMapping(value="/join/idntf", method=RequestMethod.GET)
	public String joinIdntf() {
		return "user/member/joinIdntf";		
	}
	
	@RequestMapping(value="/join/email", method=RequestMethod.GET)
	public String joinEmail() {
		logger.info("/join/email [GET]");
		return "user/member/joinEmail";		
	}
	
	@RequestMapping(value="/join/social", method=RequestMethod.GET)
	public String socialJoin() {
		return "user/member/join";		
	}

	
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int loginCheck(@RequestParam("id") String id) {
		logger.info(id);
		int res = loginService.userIdCheck(id);
		
		logger.info("res {}", res);
		
		return res;
	}
	
	@RequestMapping(value="/nickCheck", method=RequestMethod.GET)
	@ResponseBody
	public int nickCheck(@RequestParam("nick") String nick) {
		logger.info(nick);
		int res = loginService.userNickCheck(nick);
		
		logger.info("res {}", res);
		
		return res;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(UserTb user, HttpServletRequest req) {
		
		logger.info("user {}", user);
		
		boolean res = loginService.join(user, req);
		
		if(res) {
			logger.info("회원가입 성공");
			return "/user/member/joinEnd";
		} else {
			logger.info("회원가입 실패");
			return "/user/member/joinFail";
		}

	}
	
	public void findId(UserTb user) {
		loginService.findId(user);
	}
	
	public void findPw(UserTb user) {
		loginService.findPw(user);
	}

}
