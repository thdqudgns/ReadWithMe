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

}
