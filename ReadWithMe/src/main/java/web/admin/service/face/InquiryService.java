package web.admin.service.face;

import java.util.List;

import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.util.Paging;

public interface InquiryService {

	/**
	 * 페이징 처리
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 1:1 질문 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return 
	 */
	public List<Inquiry> list(Paging paging);

	/**
	 * 1:1 질문 상세보기
	 * 
	 * @param inquiry - 게시글 번호를 가지고 있는 객체
	 * @return
	 */
	public Inquiry view(Inquiry inquiry);

	/**
	 * 관리자 댓글 작성
	 * 
	 * @param adminInquiry - 댓글 정보를 담은 객체
	 */
	public void insertComment(AdminInquiry adminInquiry);

	/**
	 * 답변 완료 체크하기
	 *  
	 * @param adminInquiry - inquiry의 board_no 을 담은 객체
	 */
	public void checkReply(AdminInquiry adminInquiry);

	/**
	 * 댓글 수정하기
	 * 
	 * @param adminInquiry - comment_no, content 을 담은 DTO
	 */
	public void updateComment(AdminInquiry adminInquiry);

	/**
	 * 1:1질문 수정
	 * 
	 * @param inquiry - 수정할 1:1질문 객체
	 */
	public void update(Inquiry inquiry);

	/**
	 * 1:1질문 삭제
	 * 
	 * @param inquiry - 삭제할 1:1질문 객체
	 */
	public void delete(Inquiry inquiry);

}
