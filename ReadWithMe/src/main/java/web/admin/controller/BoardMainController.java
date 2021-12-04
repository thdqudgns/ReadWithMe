package web.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.admin.service.face.FAQService;
import web.admin.service.face.InquiryService;
import web.admin.service.face.NoticeService;
import web.user.dto.FAQ;
import web.user.dto.Inquiry;
import web.user.dto.Notice;

@Controller
public class BoardMainController {

	@Autowired NoticeService noticeService;
	@Autowired FAQService faqService;
	@Autowired InquiryService inquiryService;
	
	@RequestMapping(value="/notice")
	public String BoardMain(Notice notice, FAQ faq, Inquiry inquiry, Model model, HttpSession session) {
		
//		if( session.getAttribute("user_no") != null ) {
			
//			int user_no = (int) session.getAttribute("user_no");
		
			int user_no = 1;
			
			//	유저번호로 1:1질문 리스트 조회
			List<Inquiry> inquiryList = inquiryService.getHisInquiries(user_no);
			
//		}
		
		// 선택된 항목의 게시글 불러오기
		List<Notice> noticeList = noticeService.getSelected();
		
		List<FAQ> faqList = faqService.getSelected();
		
//		List<Inquiry> inquiryList = inquiryService.getSelected();
		
		
		//	모델값 전달
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("faqList", faqList);
		model.addAttribute("inquiryList", inquiryList);
		
		return "board_main";
	}
	
}
