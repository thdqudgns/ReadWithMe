package web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.user.dto.Inquiry_file;
import web.user.dto.Notice_file;
import web.user.dto.Notice_file;

//import web.dto.Boardfile;

public class NoticeDownloadView extends AbstractView {

	private static final Logger logger = LoggerFactory.getLogger(NoticeDownloadView.class);

	@Autowired private ServletContext context;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		//모델값 가져오기
		Notice_file notice_file = (Notice_file) model.get("noticeFile");
		logger.info("{}", notice_file);
		
		//업로드된 파일 객체
		File src = new File(context.getRealPath("upload"), notice_file.getStored_name());
		
		//파일 입력 스트림
		FileInputStream fis = new FileInputStream(src);
		
		
		//응답 헤더 설정
		response.setContentType("application/octet-stream");
		response.setContentLength((int) src.length());
		response.setCharacterEncoding("UTF-8");
		String outputName = URLEncoder.encode(notice_file.getOrigin_name(), "UTF-8");
		logger.info(outputName);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		
		//서버 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		//클라이언트로 파일 전송
		FileCopyUtils.copy(fis, out);
	}
	
}
















