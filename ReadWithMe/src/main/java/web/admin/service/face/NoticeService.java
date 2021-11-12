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

	/**
	 * 공지사항 상페보기 조회
	 * 
	 * @param viewNotice - 공지사항 객체
	 * @return
	 */
	public Notice view(Notice viewNotice);

	/**
	 * 공지사항 글쓰기
	 * 
	 * @param notice - 새로 등록할 공지사항 객체
	 */
	public void write(Notice notice);

}
