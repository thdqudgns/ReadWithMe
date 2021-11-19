package web.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.admin.dao.face.NoticeDao;
import web.admin.service.face.NoticeService;
import web.user.dto.FileTb;
import web.user.dto.Notice;
import web.user.dto.Notice_file;
import web.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {

	// Dao 객체
	@Autowired private NoticeDao noticeDao;
	@Autowired private ServletContext context;
	
	// 전체 목록 조회
	@Override
	public List<Notice> list(Paging paging) {
		
		return noticeDao.selectAll(paging);
	}
	
	// 페이징 처리
	@Override
	public Paging getPaging(Paging paramData) {
		
		// 총 게시글 수 조회
		int totalCount = noticeDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	@Override
	public Notice view(Notice viewNotice) {
		
		return noticeDao.selectNoticeByBoardno(viewNotice);
	}
	
	@Override
	public void write(Notice notice, MultipartFile file) {
		
		if( "".equals(notice.getBoard_title())) {
			notice.setBoard_title("(제목없음)");
		}
		
		noticeDao.insertNotice(notice);
		
		//----------------------------------------------
		
		// 빈 파일
		if(file.getSize() <= 0) {
			return;
		}
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		// 저장될 파일의 이름 생성하기
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일 객체
		File dest = new File(storedPath, storedName);
		
		try {
			file.transferTo(dest); // 업로드 파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		
		//-----------------------------------------------------------
		
		Notice_file notice_file = new Notice_file();
		notice_file.setBoard_no(notice.getBoard_no());
		
		FileTb fileTb = new FileTb();
		fileTb.setOrigin_name(originName);
		fileTb.setThumbnail_url(storedName);
		
		noticeDao.insertFileIntoFileTb(fileTb);
		noticeDao.insertFileIntoNotice_file(notice_file);
		
		
	}

	@Override
	public void update(Notice notice, MultipartFile file) {
		
		if("".equals(notice.getBoard_title())) {
			notice.setBoard_title("(제목없음)");
		}
		
		noticeDao.update(notice);	
		
		//-------------------------------------------
		
		if(file.getSize() <= 0 ) {
			return;
		}
		
		//	파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");
		
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
		
		Notice_file notice_file = new Notice_file();
		notice_file.setBoard_no(notice.getBoard_no());
		
		FileTb fileTb = new FileTb();
		fileTb.setOrigin_name(originName);
		fileTb.setThumbnail_url(storedName);
		
		noticeDao.deleteFileTb(notice);
		noticeDao.deleteFile(notice);
		
		noticeDao.insertFileIntoNotice_file(notice_file);
		noticeDao.insertFileIntoFileTb(fileTb);
		
	}
	
	@Override
	public void delete(Notice notice) {
		
		noticeDao.deleteFileTb(notice);
		noticeDao.deleteFile(notice);
		noticeDao.delete(notice);
		
	}
	
	@Override
	public FileTb getAttachFile(Notice viewNotice) {
		return noticeDao.selectNoticefileByNoticeno(viewNotice);
	}
	
	@Override
	public FileTb getFile(int file_no) {
		return noticeDao.selectNoticefileByFileno(file_no);
	}
	
	// 선택된 게시글 삭제
	@Override
	public void deleteChecked(String no) {
		noticeDao.deleteByBoardno(no);
	}
	
}
















