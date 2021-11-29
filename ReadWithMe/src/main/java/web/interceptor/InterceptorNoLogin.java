package web.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class InterceptorNoLogin implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(InterceptorNoLogin.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info(" + + + 인터셉터 시작 + + + ");
		
		HttpSession session = request.getSession();
		
		if( session.getAttribute("login") == null ) {
			logger.info(" >> 접속 불가: 비 로그인 상태" );
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter writer = response.getWriter();
            writer.println("<script>");
            writer.println("alert('로그인이 필요합니다.')");
            writer.print("location.href =\"");
            writer.println(request.getContextPath() + "/login\";");
            writer.println("</script>");
            return false;
            
		} 
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		logger.info(" + + + 인터셉터 종료 + + + ");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}
