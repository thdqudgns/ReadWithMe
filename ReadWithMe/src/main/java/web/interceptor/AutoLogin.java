package web.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import web.user.dto.UserTb;
import web.user.service.face.LoginService;


public class AutoLogin implements HandlerInterceptor {
	
	@Autowired LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(AutoLogin.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if( loginCookie != null ) {
			logger.info(" 쿠키가 있을 경우 " );
			String sessionKey = loginCookie.getValue();
			UserTb userSession = new UserTb();
			userSession.setSession_key(sessionKey);
			UserTb user = loginService.checkUserWithSessionKey(userSession);
			
			logger.info("user하아.....{}", user);
			
			boolean isLogin = loginService.AutoLogin(user);
			
			if(isLogin) {
				
				if( session.getAttribute("login") == null) {
					session.setAttribute("login", isLogin);
					session.setAttribute("user_no", loginService.getUserNo(user.getId()));
					session.setAttribute("user_lv", loginService.getUserLv(user.getId()));
					session.setAttribute("user_nick", loginService.getNick(user.getId()));
				}
				return true;
				
			} else {
				return false; 
			}
			
			
                        
		}
		return true; 
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}
