package web.user.dao.face;

import java.util.List;

import web.user.dto.Inquiry;
import web.user.dto.Inquiry_file;
import web.user.dto.UserTb;
import web.util.Paging;

public interface UserInquiryDao {

	/**
	 * 게시판 전체 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 1:1질문 게시판 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<Inquiry> selectAll(Paging paging);

	/**
	 * 1:1질문 글쓰기
	 * 
	 * @param inquiry - 1:1질문 DTO 객체
	 */
	public void insertInquiry(Inquiry inquiry);

	/**
	 * 게시글 번호로 1:1질문 상세보기 조회
	 * 
	 * @param inquiry - 게시글 번호를 지닌 DTO 객체
	 * @return
	 */
	public Inquiry selectInquiryByBoardno(Inquiry inquiry);

	/**
	 * 1:1 질문을 삭제한다
	 * 
	 * @param inquiry - board_no을 담은 객체
	 */
	public void delete(Inquiry inquiry);

	/**
	 * 선택된 1:1질문 삭제
	 * 
	 * @param no - 게시글 번호
	 */
	public void deleteByBoardno(String no);

	/**
	 * 선택된 1:1 질문 댓글 삭제
	 * 
	 * @param no - 게시글 번호
	 */
	public void deleteCommentByBoardno(String no);

	/**
	 * 1:1 질문 수정
	 * 
	 * @param inquiry - 수정된 1:1 질문 객체
	 */
	public void update(Inquiry inquiry);

	/**
	 * 파일 첨부하기
	 * 
	 * @param inquiry_file - 첨부할 파일
	 */
	public void insertFile(Inquiry_file inquiry_file);

	/**
	 * 게시글 번호를 이용하여 첨부파일 조회
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 * @return
	 */
	public Inquiry_file selectInquiryfileByBoardno(Inquiry inquiry);

	/**
	 * 파일번호를 이용하여 첨부파일 조회
	 * 
	 * @param file_no - 파일번호를 가진 객체
	 * @return
	 */
	public Inquiry_file selectInquiryfileByFileno(int file_no);

	/**
	 * 게시글 번호로 첨부파일 삭제
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 */
	public void deleteFile(Inquiry inquiry);

	/**
	 * 회원정보 조회
	 * 
	 * @param user_no - 회원고유번호
	 * @return
	 */
	public UserTb selectUserInfoByUserNo(int user_no);

}
