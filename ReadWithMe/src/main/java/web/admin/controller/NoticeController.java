package web.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.admin.service.face.NoticeService;
import web.user.dto.Notice;
import web.util.Paging;

@Controller
public class NoticeController {

	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	// 서비스 객체
	@Autowired private NoticeService noticeService;
	
	// 공지사항 목록
	@RequestMapping(value="/admin/notice")
	public String NoticeList(Paging paramData, Model model) {
		logger.info("/admin/notice");
		
		// 페이징 계산
		Paging paging = noticeService.getPaging( paramData );
		
		List<Notice> list = noticeService.list(paging);
		
		for(Notice n : list) {
			logger.info("{}", n);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "admin/notice/notice";
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/admin/notice/view")
	public String Noticeview(Notice viewNotice, Model model, HttpSession sessino) {
		
		if( viewNotice.getBoard_no() < 1 ) {
			return "redirect:/admin/notice";
		}
		
		viewNotice = noticeService.view(viewNotice);
		
		model.addAttribute("viewNotice", viewNotice);
		
		return "admin/notice/view";
	}
	
	// 공지사항 글쓰기
	@RequestMapping(value="/admin/notice/write", method=RequestMethod.GET)
	public void NoticeWrite() {}
	
	@RequestMapping(value="/admin/notice/write", method=RequestMethod.POST)
	public String NoticeWriteProc(Notice notice) {
		logger.info("{}" , notice);
		
		noticeService.write(notice);
		
		return "redirect:/admin/notice";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.GET)
	public String NoticeUpdate(Notice notice, Model model) {
		
		
		if(notice.getBoard_no() < 1 ) {
			return "redirect:/admin/notice";
		}
		
		notice = noticeService.view(notice);
		
		model.addAttribute("view", notice);
		
		
		return "admin/notice/update";
	}
	
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.POST)
	public String NoticeUpdateProc(Notice notice) {
		
		logger.info("{}", notice);
		
		noticeService.update(notice);
		
		return "redirect:/admin/notice?board_no=" + notice.getBoard_no() ;
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/admin/notice/delete", method=RequestMethod.GET)
	public String NoticeDelete(Notice notice) {
		
		if( notice.getBoard_no() < 1 ) {
			return "redirect: /admin/notice";
		}
		
		noticeService.delete(notice);
		
		return "redirect:/admin/notice";
	}
}






















