package web.admin.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


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
	@Autowired
	private NoticeService noticeService;

	@Autowired
	private ServletContext context;

	// 공지사항 목록
	@RequestMapping(value = "/admin/notice/list", method = RequestMethod.GET)
	public String NoticeList(Notice notice, Paging paramData, Model model) {
		logger.info("/admin/notice");

		logger.info("paramData : {}", paramData);
		
		String search = paramData.getSearch();
		
		// 페이징 계산
		Paging paging = noticeService.getPaging(paramData);
		
		// 타입 번호
		int type_no = notice.getType();
		paging.setType(type_no);
		paging.setSearch(search);

		logger.info("type:{}", type_no);

		List<Notice> list = noticeService.list(paging);

		for (Notice n : list) {
			logger.info("{}", n);
		}

		model.addAttribute("paramData", paramData);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

		return "admin/notice/notice";
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/admin/notice/view")
	public String Noticeview(Notice viewNotice, Model model, HttpSession session) {

		if (viewNotice.getBoard_no() < 1) {

			return "redirect:/admin/notice";
		}

		viewNotice = noticeService.view(viewNotice);


		// 첨부파일 정보 전달
		Notice_file notice_file = noticeService.getAttachFile(viewNotice);
		model.addAttribute("notice_file", notice_file);


		model.addAttribute("viewNotice", viewNotice);

		return "admin/notice/view";
	}

	// 공지사항 글쓰기

	@RequestMapping(value = "/admin/notice/write", method = RequestMethod.GET)
	public void NoticeWrite() {
	}

	@RequestMapping(value = "/admin/notice/write", method = RequestMethod.POST)
	public String NoticeWriteProc(Notice notice, MultipartFile file) {
		logger.info("{}", notice);

		noticeService.write(notice, file);

		return "redirect:/admin/notice/list";
	}

	@RequestMapping(value = "/admin/notice/download")
	public String download(int file_no, Model model) {

		logger.info("{}", file_no);

		Notice_file notice_file = noticeService.getFile(file_no);

		model.addAttribute("noticeFile", notice_file);

		return "noticeDown";
	}


	// 공지사항 수정
	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.GET)
	public String NoticeUpdate(Notice notice, Model model) {


		logger.info("{}", notice);

		// 게시글 번호가 1보다 작으면 목록을 보내기
		if (notice.getBoard_no() < 1) {
			return "redirect:/admin/notice/list";
		}

		// 게시글 상세 정보 전달
		notice = noticeService.view(notice);

		model.addAttribute("view", notice);

		// 게시글 첨부파일 전달
		Notice_file noticefile = noticeService.getAttachFile(notice);
		

		logger.info("noticefile {}", noticefile);
		
		if(noticefile == null) {
			
			boolean isNoticefile = false;
			
			model.addAttribute("isNoticefile", isNoticefile);
			
		} else {
			
			boolean isNoticefile = true;
			
			model.addAttribute("isNoticefile", isNoticefile);
		}
		
		model.addAttribute("noticefile", noticefile);

		return "admin/notice/update";
	}


	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.POST)
	public String NoticeUpdateProc(Notice notice, MultipartFile file) {
		logger.info("{}", notice);

		noticeService.update(notice, file);

		return "redirect:/admin/notice/list?board_no=" + notice.getBoard_no();

	}

	// 공지사항 삭제
	@RequestMapping(value = "/admin/notice/delete", method = RequestMethod.GET)
	public String NoticeDelete(Notice notice, HttpServletRequest req) {

		if (notice.getBoard_no() < 1) {
			return "redirect: /admin/notice/list";
		}
		
		String file_no = req.getParameter("file_no");
		System.out.println("file_no : " + file_no);

		noticeService.delete(notice);

		return "redirect:/admin/notice/list";
	}

	// 공지사항 선택삭제
	@RequestMapping(value = "/admin/notice/delete" , method=RequestMethod.POST)
	public String ajaxTest(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			logger.info("ajaxMsg[i]: {}", ajaxMsg[i]);
			noticeService.deleteChecked(ajaxMsg[i]);
		}

		return "redirect:/admin/notice/list";
	}

	// 공지사항 선택등록
	@RequestMapping(value = "/admin/notice/register")
	public String ajaxRegister(HttpServletRequest req) {

		String[] ajaxMsg = req.getParameterValues("valueArr2");

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			logger.info("ajaxMsg[i]: {}", ajaxMsg[i]);
			noticeService.registerChecked(ajaxMsg[i]);
		}

		return "redirect:/admin/notice/list";
	}

	// 공지사항 선택취소
	@RequestMapping(value = "/admin/notice/cancel")
	public String ajaxCancel(HttpServletRequest req) {

		String[] ajaxMsg = req.getParameterValues("valueArr3");

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			logger.info("ajaxMsg[i]: {}", ajaxMsg[i]);
			noticeService.cancelChecked(ajaxMsg[i]);
		}

		return "redirect:/admin/notice/list";
	}

}















