package web.admin.service.face;

import java.util.List;

import web.user.dto.Notice;
import web.util.Paging;

public interface NoticeService {

	/**
	 * 공지사항 전체 목록 조회
	 * @param paging 
	 * 
	 * @return - 공지사항 전체 목록
	 */
	public List<Notice> list(Paging paging);

	/**
	 * 페이징 처리 
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

}
