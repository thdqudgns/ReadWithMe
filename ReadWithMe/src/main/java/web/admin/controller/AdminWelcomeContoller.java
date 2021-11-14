package web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminWelcomeContoller {
	
	@RequestMapping(value="/admin")
	public String adminmain() {
		return "/adminmain";
	}

}
