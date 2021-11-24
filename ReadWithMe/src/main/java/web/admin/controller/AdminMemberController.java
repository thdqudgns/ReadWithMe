package web.admin.controller;

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
import web.util.Paging;

@Controller
public class AdminMemberController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	@Autowired private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String Member(Paging paramData, Model model, HttpServletRequest req) {
		
		Paging paging = adminMemberService.getPaging(paramData);
		
		List<HashMap<String,Object>> memberList = adminMemberService.getMemberList(paging, req);
				
		logger.info("memberList {}", memberList);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("paging", paging);
		
		return"/admin/member/list";
	}
	
	
	@RequestMapping(value="/admin/prmsnadmin", method=RequestMethod.GET)
	public String PrmsnAdmin() {
		
		
		return"";
	}
}
