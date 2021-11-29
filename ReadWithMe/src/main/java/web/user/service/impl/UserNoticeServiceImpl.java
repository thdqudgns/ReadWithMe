package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.UserNoticeDao;
import web.user.dto.Notice;
import web.user.dto.Notice_file;
import web.user.service.face.UserNoticeService;
import web.util.Paging;

@Service
public class UserNoticeServiceImpl implements UserNoticeService{

	@Autowired UserNoticeDao userNoticeDao;
	
	//	페이징 처리
	@Override
	public Paging getPaging(Paging paramData) {
		
		//	총 게시글 수 조회
		int totalCount = userNoticeDao.selectCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	//	공지사항 목록 조회
	@Override
	public List<Notice> list(Paging paging) {
		
		return userNoticeDao.selectAll(paging);
	}
	
	//공지사항 상세보기 조회 
	@Override
	public Notice view(Notice notice) {
		
		userNoticeDao.hit(notice);
		
		return userNoticeDao.selectNoticeByBoardno(notice);
	}
	
	//게시글번호를 이용하여 첨부파일 정보 조회
	@Override
	public Notice_file getAttachFile(Notice notice) {
		return userNoticeDao.selectNoticefileByNoticeno(notice);
	}
	
	//파일번호를 이용하여 첨부파일 정보 조회
	@Override
	public Notice_file getFile(int file_no) {
		return userNoticeDao.selectNoticefileByFileno(file_no);
	}
}


















