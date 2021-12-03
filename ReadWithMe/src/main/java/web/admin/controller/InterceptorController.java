package web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterceptorController {
	
	//에러페이지
	@RequestMapping(value="/user/error")
	public void notLoginError() {}

}
