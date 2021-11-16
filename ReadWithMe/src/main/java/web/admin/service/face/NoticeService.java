package web.admin.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.FileTb;
import web.user.dto.Notice;
import web.user.dto.Notice_file;
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
	 * @param file - 첨부파일 정보 DTO
	 */
	public void write(Notice notice, MultipartFile file);
	
	/**
	 * 공지사항 수정
	 * 
	 * @param notice - 수정된 공지사항 객체
	 * @param file - 파일 업로드 객체
	 */
	public void update(Notice notice, MultipartFile file);

	/**
	 * 공지사항 삭제
	 * 
	 * @param notice - 삭제될 공지사항 객체
	 */
	public void delete(Notice notice);

	/**
	 * 게시글번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param viewNotice - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public FileTb getAttachFile(Notice viewNotice);

	/**
	 * 파일번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param file_no - 조회할 파일 번호
	 * @return 첨부파일 정보
	 */
	public FileTb getFile(int file_no);

}
