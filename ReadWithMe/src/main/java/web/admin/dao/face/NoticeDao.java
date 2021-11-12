package web.admin.dao.face;

import java.util.List;

import web.user.dto.Notice;
import web.util.Paging;

public interface NoticeDao {

	/**
	 * 공지사항 전체 목록 조회
	 * @param paging 
	 * 
	 * @return - 공지사항 전체 목록
	 */
	public List<Notice> selectAll(Paging paging);

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 게시글 번호로 공지사항 상세보기 조회
	 * 
	 * @param viewNotice - 공지사항 객체
	 * @return - 해당 게시글 번호 공지사항 상세정보
	 */
	public Notice selectNoticeByBoardno(Notice viewNotice);
	
	/**
	 * 새로 등록할 공지사항 데이터베이스에 저장
	 * 
	 * @param notice - 새로 등록할 공지사항 객체
	 */
	public void insertNotice(Notice notice);

	/**
	 * 수정된 공지사항 데이터베이스에 저장
	 * 
	 * @param notice - 공지사항 객체
	 */
	public void update(Notice notice);

	/**
	 * 삭제될 공지사항 데이터베이스에서 삭제
	 * 
	 * @param notice - 삭제될 공지사항 객체
	 */
	public void delete(Notice notice);

}
