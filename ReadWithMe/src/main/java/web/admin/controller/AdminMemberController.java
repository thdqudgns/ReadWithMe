package web.admin.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.admin.service.face.AdminMemberService;
import web.user.dto.UserTb;
import web.util.Paging;

@Controller
public class AdminMemberController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	@Autowired private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String Member(Paging paramData, Model model, HttpServletRequest req, HttpSession session) {
		
		Paging paging = adminMemberService.getPaging(paramData);
		
		List<HashMap<String,Object>> memberList = adminMemberService.getMemberList(paging, req);
		List<HashMap<String,Object>> banMemberList = adminMemberService.getBanMemberList(paging, req);
	
				
		logger.info("memberList {}", memberList);
		logger.info("banMemberList {}", banMemberList);
		
		String userLv = (String) session.getAttribute("user_lv");
		logger.info("lv {}", userLv);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("banMemberList", banMemberList);
		model.addAttribute("paging", paging);
		model.addAttribute("userLv", userLv);
		
		return"/admin/member/list";
	}
	
	
	@RequestMapping(value="/admin/set", method=RequestMethod.GET)
	public String PrmsnAdmin(UserTb user, HttpServletRequest req) {
		
		logger.info("User {}", user);
		
		adminMemberService.setAdmin(user, req);
		
		return"redirect:/admin/member";
	}
	
	//------------------------------- 회원 제재 -------------------------
	
	@RequestMapping(value="/admin/ban", method=RequestMethod.GET)
	public String BanUser(HttpServletRequest req) {
		
		adminMemberService.banUser(req);
		
		return"redirect:/admin/member";
	}

	@RequestMapping(value="/admin/banDelete", method=RequestMethod.GET)
	public String BanUserDelete (HttpServletRequest req) {
		
		adminMemberService.banDeleteUser(req);
		
		return"redirect:/admin/member";
	}
	
	
}
