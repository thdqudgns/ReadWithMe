package web.user.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.github.scribejava.core.model.OAuth2AccessToken;

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
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_lv", user.getUser_lv());
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
	public ModelAndView naverLogin(HttpSession session) {
		String naverAuthUrl = NaverLogin.getAuthorizationUrl(session);
		logger.info("/naver/login [GET]");
		return new ModelAndView("user/member/NaverWait", "url", naverAuthUrl);
	}
	
	@RequestMapping(value="/login/naver/token",method = RequestMethod.GET)
	public String naverLoginProc(@RequestParam String code, @RequestParam String state, HttpSession session, Model model, UserTb user) throws IOException {
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
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_lv", user.getUser_lv());
			session.setAttribute("user_nick", loginService.getNick(user.getId()));
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

//	@RequestMapping(value="/login/google")
//	public void googleLogin(Model model, @RequestParam(value = "code") String authCode) throws JsonProcessingException {
//
//		//HTTP Request를 위한 RestTemplate
//		RestTemplate restTemplate = new RestTemplate();
//
//		//Google OAuth Access Token 요청을 위한 파라미터 세팅
//		GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
//				.builder()
//				.clientId("604366855673-sn0moenehgundmgh9hf20dksulomr1en.apps.googleusercontent.com")
//				.clientSecret("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")
//				.code(authCode)
//				.redirectUri("http://localhost:8888/login/google")
//				.grantType("authorization_code").build();
//
//		
//		//JSON 파싱을 위한 기본값 세팅
//		//요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
//		mapper.setSerializationInclusion(Include.NON_NULL);
//
//		//AccessToken 발급 요청
//		ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam, String.class);
//
//		//Token Request
//		GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
//		});
//		
//		System.out.println(resultEntity.getBody());
//
//		//ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
//		String jwtToken = result.getIdToken();
//		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
//		.queryParam("id_token", jwtToken).encode().toUriString();
//		
//		String resultJson = restTemplate.getForObject(requestUrl, String.class);
//		
//		Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
//		model.addAllAttributes(userInfo);
//		model.addAttribute("token", result.getAccessToken());
//		System.out.println(userInfo);
//
//
//
//
//		return "/google.html";
//
//	}
	
	//---------------------------------- 로그아웃 ---------------------------------------
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();		
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
	public String emailConfirm(String email, Model model) throws Exception {
		logger.info(email);
		model.addAttribute("email", email);

		return "/user/member/emailConfirm";
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
	
	
	//---------------------------------- 아이디/비밀번호찾기 ---------------------------------------
	
	public void findId(UserTb user) {
		loginService.findId(user);
	}
	
	public void findPw(UserTb user) {
		loginService.findPw(user);
	}
	
	
	
	//---------------------------------- 회원탈퇴 ---------------------------------------
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
