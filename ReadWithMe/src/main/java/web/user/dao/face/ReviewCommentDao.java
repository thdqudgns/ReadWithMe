package web.user.dao.face;

import java.util.List;

import web.user.dto.Review;
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

}
