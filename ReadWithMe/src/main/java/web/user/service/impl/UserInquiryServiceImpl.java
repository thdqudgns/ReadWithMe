package web.user.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.admin.dao.face.InquiryDao;
import web.user.dao.face.AdminInquiryDao;
import web.user.dao.face.UserInquiryDao;
import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.dto.Inquiry_file;
import web.user.dto.UserTb;
import web.user.service.face.UserInquiryService;
import web.util.Paging;

@Service
public class UserInquiryServiceImpl implements UserInquiryService{
	
	@Autowired private UserInquiryDao userInquiryDao;
	@Autowired private AdminInquiryDao adminInquiryDao;
	@Autowired private ServletContext context;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = userInquiryDao.selectCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Inquiry> list(Paging paging) {
		return userInquiryDao.selectAll(paging);
	}
	
	@Override
	public Inquiry view(Inquiry inquiry) {
		return userInquiryDao.selectInquiryByBoardno(inquiry);
	}
	
	@Override
	public void write(Inquiry inquiry, MultipartFile file) {
		
		//제목 작성 안할 시 "(제목없음)" 입력
		if("".equals(inquiry.getBoard_title())) {
			inquiry.setBoard_title("(제목없음)");
		}
		
		userInquiryDao.insertInquiry(inquiry);
		
		//------------------------------------------
		
		//	빈 파일
		if(file.getSize() <= 0 ) {
			return;
		}
		
		//	파일이 저장될 경로
		String storedPath = "C:\\Users\\ant19\\git\\ReadWithMe\\ReadWithMe\\src\\main\\webapp\\resources" + "inquiryImage/";
		
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//	저장될 파일의 이름 생성하기
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//	저장할 파일 객체
		File dest = new File(storedPath, storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//----------------------------------------------
		
		Inquiry_file inquiry_file = new Inquiry_file();
		
		inquiry_file.setBoard_no(inquiry.getBoard_no());
		inquiry_file.setOrigin_name(originName);
		inquiry_file.setStored_name(storedName);
		
		userInquiryDao.insertFile(inquiry_file);
		
	}
	
	
	
	@Override
	public void insertComment(AdminInquiry adminInquiry) {
		adminInquiryDao.insertComment(adminInquiry);
		adminInquiryDao.check_notreply(adminInquiry);
	}
	
	@Override
	public List<AdminInquiry> getCommentList(Inquiry inquiry) {
		return adminInquiryDao.selectComment(inquiry);
	}
	
	//	댓글 삭제
	@Override
	public boolean deleteComment(AdminInquiry adminInquiry) {
		adminInquiryDao.deleteComment(adminInquiry);	//	댓글 삭제
		
		if(adminInquiryDao.countComment(adminInquiry) > 0 ) {	
			return false;
		} else {
			return true;
		}
	}
	
	//	선택된 1:1질문 삭제
	@Override
	public void deleteChecked(String no) {
		
		Inquiry inquiry = new Inquiry();
		inquiry.setBoard_no(Integer.parseInt(no));
		
		userInquiryDao.deleteCommentByBoardno(no);
		userInquiryDao.deleteFile(inquiry);
		userInquiryDao.deleteByBoardno(no);
	}
	
	//	1:1질문 수정
	@Override
	public void update(Inquiry inquiry, MultipartFile file) {
		if("".equals(inquiry.getBoard_title())) {
			inquiry.setBoard_title("(제목없음)");
		}
		userInquiryDao.update(inquiry);
		
		//-----------------------------------
		
		if(file.getSize() <= 0 ) {
			return;
		}
		
		String storedPath = "C:\\Users\\ant19\\git\\ReadWithMe\\ReadWithMe\\src\\main\\webapp\\resources" + "inquiryImage/";
		
		//	폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if (!stored.exists()) {
			stored.mkdir();
		}
		
		//	원본 파일 이름 알아내기
		String originName = file.getOriginalFilename();
		
		//	원본 파이 이름에 UUID 추가하기 (파일명이 중복되지 않도록 설정)
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//	저장될 파일 정보 객체
		File dest = new File( stored, storedName);
		
		try {
			//	업로드된 파일을 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		Inquiry_file inquiry_file = new Inquiry_file();
		inquiry_file.setBoard_no(inquiry.getBoard_no());
		
		inquiry_file.setOrigin_name(originName);
		inquiry_file.setStored_name(storedName);
		
		userInquiryDao.deleteFile(inquiry);
		userInquiryDao.insertFile(inquiry_file);
		
	}
	
	
	
	
	//	1:1질문 삭제
	@Override
	public void delete(Inquiry inquiry) {
		userInquiryDao.deleteFile(inquiry);
		userInquiryDao.delete(inquiry);
	}
	
	@Override
	public Inquiry_file getAttachFile(Inquiry inquiry) {
		return userInquiryDao.selectInquiryfileByBoardno(inquiry);
	}
	
	@Override
	public Inquiry_file getFile(int file_no) {
		return userInquiryDao.selectInquiryfileByFileno(file_no);
	}
	
	@Override
	public UserTb userInfo(int user_no) {
		return userInquiryDao.selectUserInfoByUserNo(user_no);
	}
	
}


















