package web.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.service.face.UserInquiryService;
import web.util.Paging;

@Controller
public class UserInquiryController {

	//Service 연결
	@Autowired private UserInquiryService userInquiryService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserInquiryController.class);
	
	//1:1 질문 게시판 조회
	@RequestMapping(value="/user/inquiry/list")
	public String UserInquiryList(Paging paramData, Inquiry inquiry, Model model) {
		
		//페이징 처리
		Paging paging = userInquiryService.getPaging(paramData);
		
		//1:1질문 게시판
		List<Inquiry> list = userInquiryService.list(paging);
		
		//모델값 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "user/inquiry/list";
	}
	
	//1:1질문 상세보기
	@RequestMapping(value="/user/inquiry/view")
	public String UserInquiryView(Inquiry inquiry, Model model) {
		
		//잘못된 게시글 번호로 게시글 조회 차단
		if( inquiry.getBoard_no() < 1 ) {
			return "redirect:/user/inquiry/list";
		}
		
		//상세보기
		inquiry = userInquiryService.view(inquiry);
		
		//댓글 리스트 전달
		AdminInquiry adminInquiry = new AdminInquiry();
		List<AdminInquiry> commentList = userInquiryService.getCommentList(inquiry);
		model.addAttribute("commentList", commentList);
		
		//모델값 전달
		model.addAttribute("inquiry", inquiry);
		
		return "user/inquiry/view";
	}
	
	//1:1질문 글쓰기
	@RequestMapping(value="/user/inquiry/write", method=RequestMethod.GET)
	public String UserInquiryWrite() {
		return "user/inquiry/write";
	}
	
	@RequestMapping(value="/user/inquiry/write", method=RequestMethod.POST)
	public String UserInquiryWriteProc(Inquiry inquiry) {
		logger.info("{}", inquiry);
		
		userInquiryService.write(inquiry);
	
		return "redirect:/user/inquiry/list";
	}
}





















