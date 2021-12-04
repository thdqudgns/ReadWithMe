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

		return "redirect:/admin/notice";
	}

	@RequestMapping(value = "/admin/notice/download")
	public String download(int file_no, Model model) {

		logger.info("{}", file_no);

		Notice_file notice_file = noticeService.getFile(file_no);

		model.addAttribute("downFile", notice_file);

		return "down";
	}


	// 공지사항 수정
	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.GET)
	public String NoticeUpdate(Notice notice, Model model) {


		logger.info("{}", notice);

		// 게시글 번호가 1보다 작으면 목록을 보내기
		if (notice.getBoard_no() < 1) {
			return "redirect:/admin/notice";
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

		return "redirect:/admin/notice?board_no=" + notice.getBoard_no();

	}

	// 공지사항 삭제
	@RequestMapping(value = "/admin/notice/delete", method = RequestMethod.GET)
	public String NoticeDelete(Notice notice, HttpServletRequest req) {

		if (notice.getBoard_no() < 1) {
			return "redirect: /admin/notice";
		}
		
		String file_no = req.getParameter("file_no");
		System.out.println("file_no : " + file_no);

		noticeService.delete(notice);

		return "redirect:/admin/notice";
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

		return "redirect:/admin/notice";
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

		return "redirect:/admin/notice";
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

		return "redirect:/admin/notice";
	}

	// 이미지업로드
	@RequestMapping(value = "/admin/notice/fileupload", method = RequestMethod.POST)
	public void fileUpload(HttpServletRequest req, HttpServletResponse resp, 
			MultipartHttpServletRequest multiFile,
			@RequestParam MultipartFile upload) throws Exception {

		//	랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//	인코딩
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		try {
		
		//	파일 이름 가져오기
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		
		//	이미지 경로 생성
		String path = "C:\\Users\\ant19\\git\\ReadWithMe\\ReadWithMe\\src\\main\\webapp\\resources" + "ckImage/";
		String ckUploadPath = path + uid + "_" + fileName;
		File folder = new File(path);
		
		//	해당 디렉토리 확인
		if(!folder.exists()) {
			try {
			folder.mkdirs();	//	폴더 생성
			} catch(Exception e) {
				e.getStackTrace();
			}
		}
		
		out = new FileOutputStream(new File(ckUploadPath));
		out.write(bytes);
		out.flush();	//	outputStream에 저장된 데이터를 전송하고 초기화
		
		String callback = req.getParameter("CKEditorFuncNum");
		printWriter = resp.getWriter();
		String fileUrl = "/admin/notice/filesubmit?uid=" + uid + "&fileName=" + fileName;
		
		//	업로드시 메시지 출력
		printWriter.println( "{\"filename\" : \"" + fileName + "\",\"uploaded\" : 1, \"url\":\"" +  fileUrl + "\"}");
		printWriter.flush();
		
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if( out != null ) { out.close(); }
				if( printWriter != null ) {printWriter.close(); }
			} catch(IOException e ) { e.printStackTrace(); }
		}
		return;
		
	}
	
	@RequestMapping( value = "/admin/notice/filesubmit")
	public void ckSubmit(@RequestParam(value = "uid") String uid,
			@RequestParam(value = "fileName") String fileName,
			HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		
		//	서버에 저장된 이미지 경로
		String path = "C:\\Users\\ant19\\git\\ReadWithMe\\ReadWithMe\\src\\main\\webapp\\resources" + "ckImage/";
		
		String sDirPath = path + uid + "_" + fileName;
		
		File imgFile = new File(sDirPath);
		
		//	사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if(imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;
			
			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;
			
			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = resp.getOutputStream();
				
				while((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}
				
				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();
			
			} catch(IOException e) {
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}	
	}
}















