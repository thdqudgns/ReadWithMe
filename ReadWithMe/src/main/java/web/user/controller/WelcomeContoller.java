package web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeContoller {
	
	@RequestMapping(value="/")
	public String main() {
		return "/main";
	}

}
