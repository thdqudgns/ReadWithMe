package web.user.dao.face;

import java.util.List;

import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;

public interface AdminInquiryDao {

	/**
	 * 새로운 댓글 등록
	 * 
	 * @param adminInquiry - 삽입하려는 댓글 정보
	 */
	public void insertComment(AdminInquiry adminInquiry);

	/**
	 * 댓글 목록을 조회한다
	 * 
	 * @param inquiry - 댓글조회 대상 게시글 정보
	 * @return 조회된 댓글 목록
	 */
	public List<AdminInquiry> selectComment(Inquiry inquiry);

	/**
	 * 댓글 삭제
	 * 
	 * @param adminInquiry - 삭제하려는 댓글 정보
	 */
	public void deleteComment(AdminInquiry adminInquiry);

	/**
	 * 댓글 수 구하기
	 * 
	 * @param adminInquiry - 게시글에 작성된 댓글 개수 구하기
	 * @return 댓글 개수
	 */
	public int countComment(AdminInquiry adminInquiry);

	/**
	 * 답변 안됨 체크하기
	 * 
	 * @param adminInquiry - inquiry의 board_no 을 담은 객체
	 */
	public void check_notreply(AdminInquiry adminInquiry);

}
