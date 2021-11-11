package web.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.Member;
import web.user.dto.Social_account;
import web.user.service.face.LoginService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(Member member, HttpSession session) {
		
		loginService.login(member);
		return null;
	}
	
	public void logout(HttpSession session) {}
	
	public void join() {}
	
	public void joinProc(Member member) {
		
		loginService.join(member);
	}
	
	public void findId(Member member) {
		loginService.findId(member);
	}
	
	public void findPw(Member member) {
		loginService.findPw(member);
	}
	
	public void socialLogin() {}
	
	public String socialLoginProc(Social_account social, HttpSession session) {
		
		loginService.naverLogin(social);
		loginService.googleLogin(social);
		loginService.kakaoLogin(social);
		return null;
	}
	

}
