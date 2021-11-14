package web.user.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.user.dto.Interest;
import web.user.dto.Member;
import web.user.dto.Social_account;
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
	public String loginProc(Member member, HttpSession session) {
		
		loginService.login(member);
		return null;
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
		return null;		
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
	
//	@InitBinder
//	public void dataBinding(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		dateFormat.setLenient(false);
//		binder.registerCustomEditor(LocalDateTime.class, "startDateTime", new CustomDateEditor(dateFormat, true));
//	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public int loginCheck(@RequestParam("id") String id) {
		return loginService.userIdCheck(id);
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public void joinProc(Member member, HttpServletRequest req) {
		
		logger.info("member {}", member);
		
		boolean res = loginService.join(member, req);

	}
	
	public void findId(Member member) {
		loginService.findId(member);
	}
	
	public void findPw(Member member) {
		loginService.findPw(member);
	}

}
