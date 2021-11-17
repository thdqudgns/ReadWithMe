package web.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageMainController.class);
	
	@RequestMapping(value="/mypage/main")
	public String myPageMain() {
		logger.info("/mypage/main");
		
		return "user/mypage/main";
	}
}
