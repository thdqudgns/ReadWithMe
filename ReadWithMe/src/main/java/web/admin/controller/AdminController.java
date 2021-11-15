package web.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import web.admin.service.face.AdminService;
import web.user.dto.UserTb;
import web.util.Paging;

@Controller
public class AdminController {
	
	@Autowired AdminService adminService;

	public void memberList(UserTb member, Paging paramData, Model model) {
		
		Paging paging = adminService.getPaging(paramData);		
		List<UserTb> list = adminService.list(paging);
	}
	
	public void givePrmsn(HttpServletRequest req, HttpSession session) {
		
		adminService.getUserNo(req, session);
		
	}
	
	
}
