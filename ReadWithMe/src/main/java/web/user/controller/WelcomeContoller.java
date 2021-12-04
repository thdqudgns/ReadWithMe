package web.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.user.dto.Meeting;
import web.user.dto.Notice;
import web.user.dto.Review;
import web.user.service.face.MainService;

@Controller
public class WelcomeContoller {
	
	private static final Logger logger = LoggerFactory.getLogger(WelcomeContoller.class);
	
	@Autowired private MainService mainService;
	
	@RequestMapping(value="/")
	public String main(Model model) {

		
		//모임 목록 조회
		List<Meeting>meetingList = mainService.getMeetingList();
		List<Review>reviewList = mainService.getReviewList();
		List<Notice>noticeList = mainService.getNoticeList();
		
		
		model.addAttribute("list", meetingList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("noticeList", noticeList);

        return "/main";    //메인 페이지로 이동
	}

	


}
