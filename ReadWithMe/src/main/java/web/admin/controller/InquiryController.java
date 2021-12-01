package web.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.admin.service.face.InquiryService;
import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.service.face.UserInquiryService;
import web.util.Paging;

//	1:1 질문
@Controller
public class InquiryController {

	//	로그 객체
	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
	
	//	서비스 객체
	@Autowired private InquiryService inquiryService;
	@Autowired private UserInquiryService userInquiryService;
	
	
	//	전체 질문 조회
	@RequestMapping(value="/admin/inquiry/list")
	public String InquiryList(Paging paramData, Model model) {
		
		logger.info("/admin/inquiry/list");
		
		// 검색어 추출
		String search = paramData.getSearch();
		
		// 페이징 처리
		Paging paging = inquiryService.getPaging(paramData);
		
		//	페이징 객체에 검색어 삽입
		paging.setSearch(search);
		
		//	게시판 조회
		List<Inquiry> list = inquiryService.list(paging);
		
		//	모델값 전달
		model.addAttribute("paramData", paramData);
		model.addAttribute("paging", paging);
		model.addAttribute("inquiry", list);
		
		
		return "admin/inquiry/list";
		
	}
	
	
	//	질문 상세보기
	@RequestMapping(value="/admin/inquiry/view", method=RequestMethod.GET)
	public String InquiryView(Inquiry inquiry, Model model) {
		
		//	0 또는 음수의 게시글 번호로 게시글 접근 시도시 차단
		if (inquiry.getBoard_no() < 1 ) {
			return "redirect: /admin/inquiry/list";
		}
		
		inquiry = inquiryService.view(inquiry);
		
		//	댓글 리스트 전달
		AdminInquiry adminInquiry = new AdminInquiry();
		List<AdminInquiry> commentList = userInquiryService.getCommentList(inquiry);
		model.addAttribute("commentList", commentList);
		
		//	모델값 전달
		model.addAttribute("inquiry", inquiry);
		
		return "admin/inquiry/view";
	}
	
	//	답변 완료 로직
	@RequestMapping(value = "/admin/inquiry/check_reply", method=RequestMethod.POST)
	public void CheckReply(HttpServletRequest req, AdminInquiry adminInquiry) {
		
		int data_for_board_no = Integer.parseInt(req.getParameter("data_for_board_no"));
		
		adminInquiry.setBoard_no(data_for_board_no);
		
		inquiryService.checkReply(adminInquiry);
	}
	
	//	1:1질문 수정
	@RequestMapping( value = "/admin/inquiry/update", method = RequestMethod.GET)
	public String InquiryUpdate(Inquiry inquiry, Model model) {
		
		logger.info("{}", inquiry);
		
		//	게시글 번호가 1보다 작으면 목록을 보내기
		if(inquiry.getBoard_no() < 1 ) {
			return "redirect:/admin/inquiry/list";
		}
		
		//	게시글 상세 정보 전달
		inquiry = userInquiryService.view(inquiry);
		
		//	모델값 전달
		model.addAttribute("inquiry", inquiry);
		
		return "admin/inquiry/update";
	}
	
	@RequestMapping( value = "/admin/inquiry/update", method = RequestMethod.POST)
	public String InquiryUpdateProc(Inquiry inquiry) {
		
		inquiryService.update(inquiry);
		
		return "redirect:/admin/inquiry/list?board_no=" + inquiry.getBoard_no();
	}
	
	//	1:1질문 삭제
	@RequestMapping(value = "/admin/inquiry/delete" , method = RequestMethod.GET)
	public String InquiryDelete(Inquiry inquiry) {
		
		if(inquiry.getBoard_no() < 1 ) {
			return "redirect: /admin/inquiry/list";
		}
		
		inquiryService.delete(inquiry);
		
		return "redirect:/admin/inquiry/list";
	}
	
}
















