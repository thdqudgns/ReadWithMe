package web.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.Meeting;
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
	
	// 모임 상세보기
	@RequestMapping(value="/view")
	public String view(Meeting viewMeeting, Model model) {
		logger.info("/meeting/view 파라미터 {}", viewMeeting);
		
		if( viewMeeting.getMeeting_no() < 1 ) {
			return "redirect:/user/meeting/list";
		}
		
		viewMeeting = meetingService.view(viewMeeting);
		logger.info("/Meeting/view 상세보기 {}", viewMeeting);
		
		//모델값 전달
		model.addAttribute("viewMeeting", viewMeeting);
		
		return "user/meeting/view";
	}	
}
