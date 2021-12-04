package web.user.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.dto.Inquiry_file;
import web.user.dto.UserTb;
import web.util.Paging;

public interface UserInquiryService {

	/**
	 * 페이징 처리
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 1:1질문 게시판 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<Inquiry> list(Paging paging);

	/**
	 * 1:1질문 글쓰기
	 * 
	 * @param inquiry - 글을 작성한 데이터를 포함한 DTO 객체
	 * @param file - 업로드 파일
	 */
	public void write(Inquiry inquiry, MultipartFile file);

	/**
	 * 1:1질문 상세보기
	 * 
	 * @param inquiry - 게시글 번호를 지닌 DTO 객체
	 * @return
	 */
	public Inquiry view(Inquiry inquiry);

	/**
	 * 새로운 댓글을 삽입한다
	 * 
	 * @param adminInquiry - 입력된 댓글 정보
	 */
	public void insertComment(AdminInquiry adminInquiry);

	/**
	 * 댓글 목록을 조회한다
	 * 
	 * @param inquiry - 댓글을 조회할 게시글 정보
	 * @return 조회된 댓글 목록
	 */
	public List<AdminInquiry> getCommentList(Inquiry inquiry);

	/**
	 * 댓글을 삭제한다
	 * 
	 * @param adminInquiry - 삭제하려는 댓글의 정보
	 * @return 삭제 성공 여부
	 */
	public boolean deleteComment(AdminInquiry adminInquiry);

	/**
	 * 선택된 1:1 질문 삭제
	 * 
	 * @param no - 게시글 번호
	 */
	public void deleteChecked(String no);

	/**
	 * 1:1질문 수정
	 * 
	 * @param inquiry - 수정된 1:1질문 객체
	 * @param file - 수정 업로드 파일
	 */
	public void update(Inquiry inquiry, MultipartFile file);

	/**
	 * 1:1 질문 삭제
	 * 
	 * @param inquiry - 삭제할 1:1 질문 객체
	 */
	public void delete(Inquiry inquiry);

	/**
	 * 게시글 번호로 첨부파일 조회
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 * @return
	 */
	public Inquiry_file getAttachFile(Inquiry inquiry);

	/**
	 * 파일번호를 이용하여 첨부파일 조회
	 * 
	 * @param file_no - 파일번호
	 * @return
	 */
	public Inquiry_file getFile(int file_no);
	
	/**
	 * 회원정보 조회
	 * 
	 * @param user_no - 회원고유번호
	 * @return
	 */
	public UserTb userInfo(int user_no);

}
