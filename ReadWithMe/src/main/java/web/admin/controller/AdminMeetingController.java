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

import web.admin.service.face.AdminMeetingService;
import web.util.Paging;

@Controller
public class AdminMeetingController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMeetingController.class);
	@Autowired private AdminMeetingService adminMeetingService;
	
	@RequestMapping(value="/admin/meeting", method=RequestMethod.GET)
	public String Member(Paging paramData, Model model, HttpServletRequest req, HttpSession session) {
		
		Paging paging = adminMeetingService.getPaging(paramData);
		
		List<HashMap<String,Object>> meetingList = adminMeetingService.getMeetingList(paging, req);
				
		logger.info("memberList {}", meetingList);

		model.addAttribute("memberList", meetingList);
		model.addAttribute("paging", paging);

		
		return"/admin/meeting/list";
	}
	
	//----------- 모임 승인 / 취소 -------------------
	@RequestMapping(value="/admin/meetingApproval")
	public String MeetingApproval(HttpServletRequest req) {
		logger.info("/admin/meetingApproval");
		adminMeetingService.approvalMeeting(req);
		
		return "redirect:/admin/meeting";
	}
	
	@RequestMapping(value="/admin/meetingDelete")
	public String MeetingDelete(HttpServletRequest req) {
		logger.info("/admin/meetingDelete");
		
		adminMeetingService.deleteMeeting(req);
		
		return "redirect:/admin/meeting";
	}
	
}
