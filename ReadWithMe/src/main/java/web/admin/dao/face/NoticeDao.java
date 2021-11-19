package web.admin.dao.face;

import java.util.List;

import web.user.dto.FileTb;
import web.user.dto.Notice;
import web.user.dto.Notice_file;
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

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewNotice - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileTb selectNoticefileByNoticeno(Notice viewNotice);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param notice_file - 삽입할 첨부파일 정보
	 */
	public void insertFileIntoNotice_file(Notice_file notice_file);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param file_no - 조회할 파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileTb selectNoticefileByFileno(int file_no);

	/**
	 * 첨푸파일 정보를 삽입한다
	 * 
	 * @param fileTb - 삽입할 첨부파일 정보
	 */
	public void insertFileIntoFileTb(FileTb fileTb);

	/**
	 * 게시글의 첨부파일을 삭제한다
	 * 
	 * @param notice - 첨부파일을 삭제할 게시글 객체
	 */
	public void deleteFile(Notice notice);

	/**
	 * 게시글의 첨부파일을 삭제한다
	 * 
	 * @param notice - 첨부파일을 삭제할 게시글 객체
	 */
	public void deleteFileTb(Notice notice);

	/**
	 * 선택된 게시글을 게시글 번호를 이용하여 삭제한다
	 * 
	 * @param no - 선택된 게시글의 번호
	 */
	public void deleteByBoardno(String no);

}
