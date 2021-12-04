package web.admin.dao.face;

import java.util.List;

import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.dto.Inquiry_file;
import web.util.Paging;

public interface InquiryDao {

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 1:1 질문 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<Inquiry> selectAll(Paging paging);

	/**
	 * 1:1 질문을 게시글 번호로 조회하기
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 * @return
	 */
	public Inquiry selectInquiryByBoardno(Inquiry inquiry);

	/**
	 * 댓글 정보 입력
	 * 
	 * @param adminInquiry - 댓글 정보 담은 객체
	 */
	public void insertComment(AdminInquiry adminInquiry);

	/**
	 * 답변 완료 기록 db에 남기기
	 * 
	 * @param adminInquiry - 댓글 정보 담은 객체
	 */
	public void check_reply(AdminInquiry adminInquiry);

	/**
	 * 댓글 수정하기
	 * 
	 * @param adminInquiry - comment_no, content 담은 DTO
	 */
	public void updateComment(AdminInquiry adminInquiry);

	/**
	 * 1:1 질문 삭제
	 * 
	 * @param inquiry - 삭제될 1:1질문 
	 */
	public void delete(Inquiry inquiry);

	/**
	 * 1:1 질문 댓글 삭제
	 * 
	 * @param inquiry - 삭제될 1:1 질문 board_no을 가진 객체
	 */
	public void deleteCommentByBoardno(Inquiry inquiry);

	/**
	 * 1:1 질문 첨부파일 조회
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 * @return
	 */
	public Inquiry_file selectInquiryfileByBoardno(Inquiry inquiry);

	/**
	 * 파일번호로 1:1질문 첨부파일 조회
	 * 
	 * @param file_no - 파일 번호
	 * @return
	 */
	public Inquiry_file selectInquiryfileByFileno(int file_no);
	
	/**
	 * 게시글 번호로 1:1질문 삭제
	 * 
	 * @param no - 게시글 번호
	 */
	public void deleteByBoardno(String no);

	/**
	 * 게시글 번호로 첨부파일 삭제
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 */
	public void deleteFile(Inquiry inquiry);

	/**
	 * 회원 고유 번호로 1:1 질문 조회
	 * 
	 * @param user_no - 회원 고유 번호
	 * @return
	 */
	public List<Inquiry> selectInquiriesByUserNo(int user_no);
	
	
	
}
