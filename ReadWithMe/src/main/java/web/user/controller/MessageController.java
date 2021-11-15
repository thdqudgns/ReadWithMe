package web.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@RequestMapping(value="/message/main")
	public String messageMain() {
		logger.info("/message/main");
		
		return "user/mypage/message";
	}
	
}
