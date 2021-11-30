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


//import web.dto.Boardfile;

public class DownloadView extends AbstractView {

	private static final Logger logger = LoggerFactory.getLogger(DownloadView.class);

	@Autowired private ServletContext context;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		//모델값 가져오기

		Notice_file file = (Notice_file) model.get("downFile");
		
		if(file != null) {
		
		logger.info("{}", file);
				
		//업로드된 파일 객체
		File src = new File(context.getRealPath("upload"), file.getStored_name());

		
		//파일 입력 스트림
		FileInputStream fis = new FileInputStream(src);
		


		//응답 헤더 설정
		response.setContentType("application/octet-stream");
		response.setContentLength((int) src.length());
		response.setCharacterEncoding("UTF-8");
		String outputName = URLEncoder.encode(file.getOrigin_name(), "UTF-8");


		logger.info(outputName);

		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		

		//서버 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		//클라이언트로 파일 전송
		FileCopyUtils.copy(fis, out);

		}

		
		
		
		Inquiry_file file2 = (Inquiry_file)model.get("downFile2");
		
		if(file2 != null) {
		
		logger.info("{}", file2);
		File src2 = new File(context.getRealPath("upload"), file2.getStored_name());
		FileInputStream fis2 = new FileInputStream(src2);
		
		response.setContentType("application/octet-stream");
		response.setContentLength((int)src2.length());
		response.setCharacterEncoding("UTF-8");
		String outputName2 = URLEncoder.encode(file2.getOrigin_name(), "UTF-8");
		
		logger.info(outputName2);
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName2 + "\"");
		
		OutputStream out2 = response.getOutputStream();
		
		FileCopyUtils.copy(fis2, out2);
		}

	}
	
}
















