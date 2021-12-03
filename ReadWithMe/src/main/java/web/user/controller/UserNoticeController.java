package web.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.user.dto.Notice;
import web.user.dto.Notice_file;
import web.user.service.face.UserNoticeService;
import web.util.Paging;

@Controller
public class UserNoticeController {

	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(UserNoticeController.class);
	
	// 서비스 객체
	@Autowired UserNoticeService userNoticeService;
	
	// 공지사항 목록 조회
	@RequestMapping(value="/user/notice/list")
	public String UserNoticeList(Notice notice, Paging paramData, Model model) {
		
		logger.info("/user/notice/list");
		
		String search = paramData.getSearch();
		
		
		//	페이징 계산
		Paging paging = userNoticeService.getPaging(paramData); 
		
		//타입 번호
		int type_no = notice.getType();
		paging.setType(type_no);
		paging.setSearch(search);
		
		logger.info("notice : {}", notice);
		logger.info("type_no : {}", type_no);
		logger.info("paging : {}", paging);
		
		// 공지사항 목록 조회
		List<Notice> list = userNoticeService.list(paging);
		
		//	모델값 전달
		model.addAttribute("paramData", paramData);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "user/notice/list";
	}
	//공지사항 상세보기
	@RequestMapping(value = "/user/notice/view")
	public String UserNoticeView(Notice notice, Model model) {
		
		//잘못된 게시글 번호 경로 차단
		if( notice.getBoard_no() < 1 ) {
			return "redirect:/user/notice/list";
		}
		
		//DTO 멤버필드 확인
		logger.info("notice:{}", notice);
		
		//공지사항 상세보기
		notice = userNoticeService.view(notice);
		
		//첨부파일 정보 전달
		Notice_file notice_file = userNoticeService.getAttachFile(notice);
		
		//모델값 전달
		model.addAttribute("notice_file", notice_file);
		model.addAttribute("notice", notice);
		
		return "user/notice/view";
	}
	
	@RequestMapping(value = "/user/notice/download")
	public String download(int file_no, Model model) {
		
		logger.info("{}", file_no);
		
		Notice_file notice_file = userNoticeService.getFile(file_no);
		
		model.addAttribute("downFile", notice_file);
		
		return "down";
	}
	
}





























