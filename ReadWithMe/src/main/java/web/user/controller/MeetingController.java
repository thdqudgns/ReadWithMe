package web.user.controller;

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
import org.springframework.web.multipart.MultipartFile;

import web.user.dto.Meeting;
import web.user.dto.Participation;
import web.user.dto.UserTb;
import web.user.service.face.MeetingService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/meeting")
public class MeetingController {

	private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);
	
	@Autowired private MeetingService meetingService;
	
	// 진행 중 모임
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void MeetingList(Paging paramData, Model model, HttpServletRequest req) {
		logger.info("/meeting/list");
		
		//페이징 계산
		Paging paging = meetingService.getPaging( paramData );
		logger.info("{}", paging);
		
		//모임 목록 조회
		List<HashMap<String, Object>> list = meetingService.list(paging, req);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

//	// 종료된 모임
//	@RequestMapping(value="/endlist", method = RequestMethod.GET)
//	public void MeetingEndList(Paging paramData, Model model) {
//		logger.info("/meeting/endlist");
//		
//		//페이징 계산
//		Paging paging = meetingService.getPaging( paramData );
//		logger.info("{}", paging);
//		
//		//모임 목록 조회
//		List<Meeting> endlist = meetingService.list(paging);
//		for(Meeting m : endlist) {
//			logger.info("{}", m);
//		}
//		
//		model.addAttribute("paging", paging);
//		model.addAttribute("endlist", endlist);
//	}	
	
	// 모임 상세보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String Meetingview(Model model, int no, HttpSession session) {
		logger.info("/meeting/view 파라미터 {}", no);
		
		// 모임 정보 불러오기
		Meeting meeting = meetingService.view(no);
		UserTb user = meetingService.getUser(meeting.getUser_no()); //유저 번호로 유저 정보 조회
		
		// 모임 신청 목록 조회
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		Participation participation = meetingService.getParticipation(user_no, no);
		logger.info("{}", participation);
		
		model.addAttribute("meeting", meeting);
		model.addAttribute("user", user);
		model.addAttribute("participation", participation);
		
		return "user/meeting/view";
	}
	
	// 모임 신청
	@RequestMapping(value="/apply", method=RequestMethod.GET)
	public String apply(Participation participation, HttpSession session) {
		logger.info("{}", participation);
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		participation.setUser_no(user_no);
		
		logger.info("{}", participation);
		
		meetingService.apply(participation);
		
		return "redirect:/mypage/main";
		
	}
	
	// 모임 신청 취소
	@RequestMapping(value="/deleteApply", method=RequestMethod.GET)
	public String deleteApply(Participation participation, HttpSession session) {
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		participation.setUser_no(user_no);
		
		logger.info("{}", participation);
		
		meetingService.deleteApply(participation);
		
		return "redirect:/user/meeting/view?no=" + participation.getMeeting_no();
	}
	
	// 모임 생성
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(Meeting meeting, MultipartFile file, HttpSession session) {
		logger.info("{}", meeting);
		logger.info("{}", file);
		
		meeting.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		logger.info("{}", meeting);
		
		meetingService.write(meeting, file);
		
		return "redirect:/user/meeting/list";
	}
	
	// 모임 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(Meeting meeting) {
		logger.info("/user/meeting/delete [GET]");
		
		meetingService.delete(meeting);
		
		return "redirect:/user/meeting/list";
	}
	
}
