package web.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.NoticeDao;
import web.admin.service.face.NoticeService;
import web.user.dto.Notice;
import web.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {

	// Dao 객체
	@Autowired
	private NoticeDao noticeDao;
	
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
	public void write(Notice notice) {
		
		if( "".equals(notice.getBoard_title())) {
			notice.setBoard_title("(제목없음)");
		}
		
		noticeDao.insertNotice(notice);
		
	}
	
}
