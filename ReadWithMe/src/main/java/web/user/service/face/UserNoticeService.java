package web.user.service.face;

import java.util.List;

import web.user.dto.Notice;
import web.user.dto.Notice_file;
import web.util.Paging;

public interface UserNoticeService {

	/**
	 * 페이징 계산
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 공지사항 목록 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<Notice> list(Paging paging);

	/**
	 * 게시글 번호를 이용하여 공지사항 상세보기 조회
	 * 
	 * @param notice - 게시글 번호를 가진 공지사항 DTO 객체
	 * @return
	 */
	public Notice view(Notice notice);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param notice - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public Notice_file getAttachFile(Notice notice);

	/**
	 * 파일번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param file_no - 조회할 파일 번호
	 * @return 첨부파일 정보
	 */
	public Notice_file getFile(int file_no);

}
