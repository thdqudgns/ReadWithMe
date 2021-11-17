package web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.user.dto.OauthToken;
import web.user.dto.PhoneAuth;
import web.user.dto.Social_account;
import web.user.dto.EmailAuth;
import web.user.dto.UserSessionTb;
import web.user.dto.UserTb;
import web.user.service.face.LoginService;
import web.util.KakaoLogin;
import web.util.MessageService;

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
			session.setAttribute("user_no", loginService.getUserNo(user.getId()));
			session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
			session.setAttribute("user_nick", loginService.getNick(user.getId()));
			
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
	

	
	@RequestMapping(value = "/login/kakao" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {	
		
		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println("profile : " + profile);
		UserTb user = KakaoLogin.changeData(profile);
		user.setId("k"+user.getId());
		
		boolean isKakaoLogin = loginService.getKakaoId(user);
		logger.info("isKakaoLogin : {}", isKakaoLogin);
		logger.info("user : {}", user);
		
		if( isKakaoLogin ) {
			session.setAttribute("login", isKakaoLogin);
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_lv", user.getUser_lv());
			session.setAttribute("user_nick", loginService.getNick(user.getId()));
			return "redirect:/";
		} else {
			model.addAttribute("user", user);
			return "user/member/kakaoLogin";
		}
		
		
	}
	
	@RequestMapping(value="/join/kakao", method=RequestMethod.POST)
	public String kakaoLoginProc(UserTb snsUser, HttpServletRequest req) {
		logger.info("/join/kakao [POST]");
		
		logger.info("snsUser {}:", snsUser);
		
		boolean res = loginService.KakaoJoin(snsUser, req);
		
		if(res) {
			logger.info("회원가입 성공");
			return "/user/member/joinEnd";
		} else {
			logger.info("회원가입 실패");
			return "/user/member/joinFail";
		}
	}
	
	public String socialLoginProc(Social_account social, HttpSession session) {
		
		loginService.naverLogin(social);
		loginService.googleLogin(social);
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
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(UserTb user, HttpServletRequest req) {
		
		logger.info("user {}", user);
		
		boolean res = loginService.join(user, req);
		loginService.userAuth(user.getEmail());
		if(res) {
			logger.info("회원가입 성공");
			return "/user/member/joinEnd";
		} else {
			logger.info("회원가입 실패");
			return "/user/member/joinFail";
		}

	}
	
	@RequestMapping(value="/join/idntf", method=RequestMethod.GET)
	public String joinIdntf() {
		return "user/member/joinIdntf";		
	}
	
	
	
	
	
	@RequestMapping(value = "/email/register", method = RequestMethod.GET)
	public String EmailRegister() {

		return "user/member/emailRegister";	
	}
	
	@RequestMapping(value = "/email/register", method = RequestMethod.POST)
	public String EmailRegisterProc(EmailAuth user, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		logger.info("/register [POST]");
		logger.info(user.toString());
		
		rttr.addFlashAttribute("authmsg" , "입력한 이메일로 인증해주세요");
		
		if( loginService.create(user) ) {
			return "/user/member/emailWait";	
		} else {			
			return "/user/member/emailFail";	
		}
	}
	
	@RequestMapping(value = "/email/confirm", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception {
		logger.info(email);
		model.addAttribute("email", email);

		return "/user/member/emailConfirm";
	}
	
	
	
	
	@RequestMapping(value = "/phone/register", method = RequestMethod.GET)
	public String PhoneRegister() {
		return "user/member/phoneRegister";	
	}	
	@RequestMapping(value = "/phone/register", method = RequestMethod.POST)
	public String PhoneRegisterProc(UserTb user, Model model) {
		logger.info("user {}", user);
		
		String random = MessageService.makeRandom(6,1);
		logger.info(random);
		loginService.savePhoneRegister(user, random);
//		MessageService.sendMessage(user.getPhone(), random);
		model.addAttribute("user", user);
		return "user/member/phoneWait";	
	}
	
	@RequestMapping(value="/phone/confirm", method=RequestMethod.POST)
	public String PhoneConfirmProc(PhoneAuth phoneAuth, Model model) {	
		logger.info("phoneAuth {}", phoneAuth);
		
		if( loginService.phoneRegister(phoneAuth) ) {
			return "/user/member/phoneConfirm";	
		} else {			
			return "/user/member/phoneFail";	
		}
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/join/origin", method=RequestMethod.GET)
	public String joinEmail() {
		logger.info("/join/origin [GET]");
		return "user/member/joinOrigin";		
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
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void findId(UserTb user) {
		loginService.findId(user);
	}
	
	public void findPw(UserTb user) {
		loginService.findPw(user);
	}

}
