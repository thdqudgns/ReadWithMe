package web.user.dao.face;

import java.util.List;

import web.user.dto.Notice;
import web.user.dto.Notice_file;
import web.util.Paging;

public interface UserNoticeDao {

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 게시글 전체 목록 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Notice> selectAll(Paging paging);

	/**
	 * 게시글 번호를 이용한 공지사항 상세보기 조회
	 * 
	 * @param notice - 게시글 번호를 가진 공지사항 DTO 객체
	 * @return
	 */
	public Notice selectNoticeByBoardno(Notice notice);

	/**
	 * 조회수 증가
	 * 
	 * @param notice - 게시글 번호를 가진 공지사항 DTO 객체
	 */
	public void hit(Notice notice);

	/**
	 * 게시글 번호를 이용하여 업로드된 첨부파일 정보 조회
	 * 
	 * @param notice - 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public Notice_file selectNoticefileByNoticeno(Notice notice);

	/**
	 * 파일번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param file_no - 조회할 파일 번호
	 * @return 첨부파일 정보
	 */
	public Notice_file selectNoticefileByFileno(int file_no);

}
