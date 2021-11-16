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
import org.springframework.web.multipart.MultipartFile;

import web.admin.service.face.NoticeService;
import web.user.dto.FileTb;
import web.user.dto.Notice;
import web.user.dto.Notice_file;
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
	public String Noticeview(Notice viewNotice, Model model, HttpSession session) {
		
		if( viewNotice.getBoard_no() < 1 ) {
			return "redirect:/admin/notice";
		}
		
		viewNotice = noticeService.view(viewNotice);
		
		//첨부파일 정보 전달
		FileTb fileTb = noticeService.getAttachFile(viewNotice);
		model.addAttribute("notice_file", fileTb);
		
		model.addAttribute("viewNotice", viewNotice);
		
		return "admin/notice/view";
	}
	
	// 공지사항 글쓰기
	@RequestMapping(value="/admin/notice/write", method=RequestMethod.GET)
	public void NoticeWrite() {}
	
	@RequestMapping(value="/admin/notice/write", method=RequestMethod.POST)
	public String NoticeWriteProc(Notice notice, MultipartFile file) {
		logger.info("{}" , notice);
		
		noticeService.write(notice, file);
		
		return "redirect:/admin/notice";
	}
	
	@RequestMapping(value="/admin/notice/download")
	public String download(int file_no, Model model) {
		
		logger.info("{}", file_no);
		
		FileTb fileTb = noticeService.getFile(file_no);
		
		model.addAttribute("downFile", fileTb);
		
		return "down";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.GET)
	public String NoticeUpdate(Notice notice, Model model) {
		
		logger.info("{}", notice);
		
		// 게시글 번호가 1보다 작으면 목록을 보내기
		if(notice.getBoard_no() < 1 ) {
			return "redirect:/admin/notice";
		}
		
		// 게시글 상세 정보 전달
		notice = noticeService.view(notice);
		
		model.addAttribute("view", notice);
		
		//게시글 첨부파일 전달
		FileTb noticefile = noticeService.getAttachFile(notice);
		model.addAttribute("noticefile", noticefile);
		
		return "admin/notice/update";
	}
	
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.POST)
	public String NoticeUpdateProc(Notice notice, MultipartFile file) {
		logger.info("{}", notice);
		
		noticeService.update(notice, file);
		
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






















