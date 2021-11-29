package web.user.controller;

import java.util.List;

//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.user.dto.Meeting;
//import web.user.dto.Participation;
import web.user.service.face.MeetingService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/meeting")
public class MeetingController {

	private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);
	
	@Autowired private MeetingService meetingService;
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void MeetingList(Paging paramData, Model model) {
		logger.info("/meeting/list");
		
		//페이징 계산
		Paging paging = meetingService.getPaging( paramData );
		logger.info("{}", paging);
		
		//모임 목록 조회
		List<Meeting> list = meetingService.list(paging);
		for(Meeting m : list) {
			logger.info("{}", m);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	// 모임 검색
	
	
	// 모임 상세보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String Meetingview(Model model, int no) {
		logger.info("/meeting/view 파라미터 {}", no);
		
		Meeting meeting = meetingService.view(no);
		model.addAttribute("meeting", meeting);
		
		return "user/meeting/view";
	}
	
	// 모임 신청하기
//	@RequestMapping(value="/apply", method=RequestMethod.POST)
//	public String apply(Participation participation, HttpSession session) {
//		logger.info("{}", participation);
//		
//		if (meeting.meeting_personnel() > 0) {
//			participation.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
//			participation.setMeetion_no(Integer.parseInt((String) session.getAttribute("setMeeting_no")));
//			logger.info("{}", participation);
//			
//			meetingService.apply(participation); // 모임 신청
//			meeting.getmeeting_personnel(meeting.getmeeting_personnel() - 1); // 인원 수 - 1
//		} else {
//			return "redirect:/user/meeting/list";
//		}
//	}
	
	// 모임 생성
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(Meeting meeting, MultipartFile file, HttpSession session) {
		logger.info("{}", meeting);
		logger.info("{}", file);
		
		meeting.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
//		meeting.setEmail((String) session.getAttribute("email"));
		logger.info("{}", meeting);
		
		meetingService.write(meeting, file);
		
		return "redirect:/user/meeting/list";
	}
	
	// 모임 삭제
//	@RequestMapping(value="/delete", method=RequestMethod.GET)
//	public String deleteProcess(Meeting meeting) {
//		meetingService.delete(meeting);
//		
//		return "redirect:/user/meeting/list";
//	}
	
}
