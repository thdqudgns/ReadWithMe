package web.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import web.user.dto.Ban;
import web.user.dto.EmailAuth;
import web.user.dto.PhoneAuth;
import web.user.dto.UserSessionTb;
import web.user.dto.UserTb;
import web.user.service.face.LoginService;
import web.util.JsonParser;
import web.util.KakaoLogin;
import web.util.MessageService;
import web.util.NaverLogin;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired LoginService loginService;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(UserTb user, UserSessionTb userSession, HttpSession session, HttpServletResponse resp, Model model)  {
		
		logger.info("user {}", user);
		boolean isLogin = loginService.login(user);
		
		logger.info("isLogin : {}", isLogin);
		
		if( isLogin ) {
			int user_no = Integer.parseInt(String.valueOf(loginService.getUserNo(user.getId())));
			
			if( Integer.parseInt(loginService.getUserLv(user.getId())) == 0 ) {

				
				boolean res = loginService.isBan(user_no);
			
				
				if( res ) {
					logger.info("user_no {}", user_no);
					
					Ban ban = loginService.banUser(user_no);
					
					logger.info("ban {}", ban);
					model.addAttribute("ban", ban);
					session.invalidate();
					
					return "/user/member/userBan";			
					
				} else {
					session.setAttribute("login", isLogin);
					session.setAttribute("user_no", user_no);
					session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
					session.setAttribute("user_nick", loginService.getNick(user.getId()));
					
					logger.info(user.getRemember() + "???");
					if(user.getRemember() == 1) {
						logger.info("왜죠........? {}",user.getRemember());
						
						Cookie loginCookie = new Cookie("loginCookie", session.getId());
						loginCookie.setPath("/");
						loginCookie.setMaxAge(60*60*24*7);
						
						resp.addCookie(loginCookie);
						
						Date sessionLimit = new Date(System.currentTimeMillis() + (1000*60*60*24*7));
					
						user.setSession_limit(sessionLimit);
						user.setSession_key(session.getId());
						user.setUser_no(user_no);
						loginService.keepLogin(user);
					}
					return "redirect:/"; 
					
				}
				
		        
			} else {
				session.setAttribute("login", isLogin);
				session.setAttribute("user_no", user_no);
				session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
				session.setAttribute("user_nick", loginService.getNick(user.getId()));
				
				logger.info("왜죠? {}", user.getRemember()==1);
				if(user.getRemember() == 1) {
					logger.info("왜죠........? {}",user.getRemember());
					
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60*60*24*7);
					
					resp.addCookie(loginCookie);
					Date sessionLimit = new Date(System.currentTimeMillis() + (1000*60*60*24*7));
					logger.info("리밑 {}", sessionLimit);
					logger.info("키 {}", session.getId());
					user.setSession_limit(sessionLimit);
					user.setSession_key(session.getId());
					user.setUser_no(user_no);
					loginService.keepLogin(user);
				}
				
				return "redirect:/";
			}
			
		} else {
			session.invalidate();
			logger.info("로그인실패이동페이지");
			return "/user/member/loginFail";
		}
	}
	

	//---------------------------------- 카카오 로그인(회원가입) ---------------------------------------
	
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
			session.setAttribute("user_no", loginService.getUserNo(user.getId()));
			session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
			session.setAttribute("user_nick", loginService.getNick(user.getId()));
						
			return "redirect:/";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("social", "kakao");
			return "user/member/SocialLogin";
		}
		
		
	}
	
	@RequestMapping(value="/join/kakao", method=RequestMethod.POST)
	public String kakaoJoin(UserTb snsUser, HttpServletRequest req) {
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
	
	
	//---------------------------------- 네이버 로그인(회원가입) ---------------------------------------
	
	@RequestMapping(value="/login/naver", method=RequestMethod.GET)
	public void naverLogin(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String naverAuthUrl = NaverLogin.getAuthorizationUrl(session);
		
		PrintWriter writer = response.getWriter();
        writer.println("<script>");
        writer.print("location.href =\"");
        writer.println(request.getContextPath() + naverAuthUrl +"\";");
        writer.println("</script>");
        
		logger.info("/naver/login [GET]");
		
	}
	
	@RequestMapping(value="/login/naver/token",method = RequestMethod.GET)
	public String naverLoginProc(@RequestParam String code, @RequestParam String state, HttpServletResponse response, HttpSession session, Model model, UserTb user) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		logger.info("/naverlogin callback");
		JsonParser json = new JsonParser();

		OAuth2AccessToken oauthToken = NaverLogin.getAccessToken(session, code, state);
		String apiResult = NaverLogin.getUserProfile(oauthToken);
		try {
			user = json.changeJson(apiResult);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		boolean isNaverLogin = loginService.getNaverId(user);
		if ( isNaverLogin ) {
			session.setAttribute("login", isNaverLogin);
			session.setAttribute("user_no", loginService.getUserNo(user.getId()));
			session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
			session.setAttribute("user_nick", loginService.getNick(user.getId()));
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			
			return "redirect:/";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("social", "naver");
			return "user/member/SocialLogin";
		}

	}
	
	@RequestMapping(value="/join/naver", method=RequestMethod.POST)
	public String NaverJoin(UserTb snsUser, HttpServletRequest req) {
		logger.info("/join/naver [POST]");
		
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
	
	
	
	//---------------------------------- 구글 로그인(회원가입) ---------------------------------------

	@RequestMapping(value="/login/google/wait")
	public String googleLoginWait(UserTb user) {
		logger.info("구글로그인 {}", user);
		
		return "/user/member/googleWait";
	}
	
	@RequestMapping(value="/login/google", method = RequestMethod.GET)
	public String googleLogin(UserTb user, HttpSession session, HttpServletResponse response, Model model) {
		logger.info("구글로그인입니닷 {}", user);
		
		boolean isGoogleLogin = loginService.getGoogleId(user);
		logger.info("isGoogleLogin : {}", isGoogleLogin);
		logger.info("user : {}", user);
		
		if( isGoogleLogin ) {
			session.setAttribute("login", isGoogleLogin);
			session.setAttribute("user_no", loginService.getUserNo(user.getId()));
			session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
			session.setAttribute("user_nick", loginService.getNick(user.getId()));
						
			return "redirect:/";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("social", "google");
			return "user/member/SocialLogin";
		}
		
	}
	
	@RequestMapping(value="/join/google", method = RequestMethod.POST)
	public String googleLoginProc(UserTb user, HttpServletRequest req) {
		logger.info("구글회원가입 처리 {}", user);
		
		logger.info("snsUser {}:", user);
		
		boolean res = loginService.KakaoJoin(user, req);
		
		if(res) {
			logger.info("회원가입 성공");
			return "/user/member/joinEnd";
		} else {
			logger.info("회원가입 실패");
			return "/user/member/joinFail";
		}
		
	}
	
	//---------------------------------- 로그아웃 ---------------------------------------
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, Model model, HttpServletResponse response, HttpSession session) {
		
		Object object = request.getSession().getAttribute("login");
		
		if(object != null) {
			boolean res = (boolean) object;
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				
				Date date = new Date(System.currentTimeMillis());
				UserTb user = new UserTb();
				user.setSession_limit(date);
				
				logger.info("흑흑 {}", request.getSession().getAttribute("user_no"));
				
				user.setUser_no(Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_no"))));
				user.setSession_key(request.getSession().getId());
				loginService.keepLogin(user);
				
			}
				
			request.getSession().removeAttribute("login");
			request.getSession().invalidate();
			
			
		}
		
		return "redirect:/";	
	}
	
	
	//---------------------------------- origin 회원가입 ---------------------------------------
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "user/member/join";		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(UserTb user, HttpServletRequest req) {
		
		logger.info("user {}", user);
		
		boolean res = loginService.join(user, req);
		loginService.userAuth(user);
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
	
	
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		logger.info(email);
		int res = loginService.userEmailCheck(email);
		
		logger.info("res {}", res);
		
		return res;
	}
	
	@RequestMapping(value="/agree/personal")
	public String PersonalAgree(Model model) {
		model.addAttribute("agree", "personal");
		return"user/member/agree";
	}
	
	@RequestMapping(value="/agree/service")
	public String ServiceAgree(Model model) {
		model.addAttribute("agree", "service");
		return"user/member/agree";
	}
	//---------------------------------- 이메일 인증 ---------------------------------------
	
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
	public void emailConfirm(String email, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		logger.info(email);
		model.addAttribute("email", email);

		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
        writer.println("<script>");
        writer.println("alert('이메일 인증이 완료되었습니다, 회원가입을 할 수 있는 페이지로 이동합니다')");
        writer.print("location.href =\"");
        writer.println(request.getContextPath() + "/join/origin?email=" + email +"\";");
        writer.println("</script>");
	}
	
	
	
	//---------------------------------- 핸드폰 인증 ---------------------------------------
	
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
		MessageService.sendMessage(user.getPhone(), random);
		model.addAttribute("user", user);
		return "user/member/phoneWait";	
	}
	
	@RequestMapping(value="/phone/confirm", method=RequestMethod.POST)
	public void PhoneConfirmProc(PhoneAuth phoneAuth, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {	
		logger.info("phoneAuth {}", phoneAuth);
		
		String phone = phoneAuth.getPhone();
		
		if( loginService.phoneRegister(phoneAuth) ) {
			
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter writer = response.getWriter();
	        writer.println("<script>");
	        writer.println("alert('핸드폰 인증이 완료되었습니다, 회원가입을 할 수 있는 페이지로 이동합니다')");
	        writer.print("location.href =\"");
	        writer.println(request.getContextPath() + "/join/origin?phone=" + phone +"\";");
	        writer.println("</script>");
	        
		} else {			
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter writer = response.getWriter();
	        writer.println("<script>");
	        writer.print("location.href =\"");
	        writer.println(request.getContextPath() + "/phone/fail\";");
	        writer.println("</script>");	
		}
	}
	
	@RequestMapping(value="/phone/fail")
	public String phoneFail() {
		return"user/member/phoneFail";
	}
	
	
	
	//---------------------------------- 아이디/비밀번호찾기 ---------------------------------------
	
	@RequestMapping(value="/seach/login")
	public String seachLogin(UserTb user) {
		return "/user/member/seachLogin";	
	}
	
	@RequestMapping(value="/find/pw", method = RequestMethod.GET)
	public String findPw() {
		return "/user/member/findPw";	
	}
	
	@RequestMapping(value="/find/pw", method = RequestMethod.POST)
	public String findPwProc(UserTb user) {
		logger.info("/find/pw [POST]");
		
		logger.info("user {}", user);
		
		if( loginService.findPw(user) ) {
			if(user.getEmail() != "" && user.getEmail() != null ) {				
				loginService.sendPwByEmail(user);
			} else if(user.getPhone() != "" && user.getPhone() != null ) {	
				logger.info("getPhone() [POST]");
				loginService.sendPwByPhone(user);
			}
		}
		
		return "/user/member/findPwEnd";					
	}
	
	@RequestMapping(value="/find/id", method = RequestMethod.GET)
	public String findId() {
		return "/user/member/findId";	
	}
	
	@RequestMapping(value="/find/id", method = RequestMethod.POST)
	public String findIdProc(UserTb user, Model model) {
		
		logger.info("/find/id [POST]");
		
		logger.info("user {}", user);
				
		String id = loginService.findId(user);
	
		model.addAttribute("id", id);
		
		
		return "/user/member/findIdEnd";	
	}
	
	@RequestMapping(value="/find/email", method = RequestMethod.GET)
	public String findEmail() {
		return "/user/member/findEmail";	
	}
	
	@RequestMapping(value="/find/email", method = RequestMethod.POST)
	public String findEmailProc(UserTb user, Model model) {
		logger.info("/find/email [POST]");
		
		boolean res = loginService.findEmail(user);
		
		if(res) {
			model.addAttribute("res", 0);
			return "/user/member/findEmailEnd";				
		} else {
			model.addAttribute("res", 1);
			return "/user/member/findEmailEnd";				
		}
				
	}


	

}
