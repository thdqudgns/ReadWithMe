package web.admin.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class CkEditorController {

	@Autowired private ServletContext context;
	
	// 이미지업로드
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
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
		String path = context.getRealPath("upload") + "ckImage/";
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
		String fileUrl = "/filesubmit?uid=" + uid + "&fileName=" + fileName;
		
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
	
	@RequestMapping( value = "/filesubmit")
	public void ckSubmit(@RequestParam(value = "uid") String uid,
			@RequestParam(value = "fileName") String fileName,
			HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		
		//	서버에 저장된 이미지 경로
		String path = context.getRealPath("upload") + "ckImage/";
		
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
