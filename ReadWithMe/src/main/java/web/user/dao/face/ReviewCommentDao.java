package web.user.dao.face;

import java.util.List;

import web.user.dto.Review;
import web.user.dto.Rpt_cmt;
import web.user.dto.Rv_cmt;

public interface ReviewCommentDao {

	/**
	 * 게시글 번호를 매개로, 해당 게시글의 댓글을 같이 조회한다.
	 * 
	 * @param viewReview - 게시글 번호
	 * @return - 댓글 목록 반환
	 */
	public List<Rv_cmt> selectComment(Review viewReview);

	/**
	 * 신규 댓글 삽입
	 * @param comment - 삽입하려는 댓글 정보
	 */
	public void insertComment(Rv_cmt comment);

	/**
	 * 댓글 삭제
	 * @param comment - 삭제하려는 댓글 정보
	 */
	public void deleteComment(Rv_cmt comment);

	/**
	 * 댓글 수 구하기
	 * @param comment - 게시글에 작성된 댓글 개수 구하기
	 * @return 댓글 개수
	 */
	public int countComment(Rv_cmt comment);

	/**
	 * 댓글 수정
	 * 
	 * @param comment - 댓글 객체
	 * @return
	 */
	public int updateReviewComment(Rv_cmt comment);

	/**
	 * 후기 댓글번호와 함께 신고글에 정보 삽입
	 * 
	 * @param comment - 후기 댓글번호가 담긴 객체
	 */
	public void insertReportCommentByReviewNo(Rpt_cmt comment);

	/**
	 * 신고된 댓글 확인
	 * 
	 * @param comment - 명언글 번호, 신고한 회원 번호
	 * @return 데이터 개수
	 */
	public int countReportComment(Rpt_cmt comment);

}
