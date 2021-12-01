package web.admin.dao.face;

import java.util.List;

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.util.Paging;

public interface AdminReviewDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> selectList(Paging paging);

	/**
	 * 게시글 번호로 후기 조회하기
	 * 
	 * @param viewReview - 게시글 번호가 담긴 객체
	 * @return 조회된 게시글의 정보
	 */
	public Review selectReviewByReviewNo(Review viewReview);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public Review_file selectReviewfileByReviewNo(Review viewReview);

	/**
	 * 게시글의 전체 추천 수 조회
	 * 
	 * @param recommend - 추천 수를 조회할 게시글 정보
	 * @return 전체 추천 수
	 */
	public int selectTotalCntRecommend(Review_rec recommend);

	/**
	 * 게시글 번호를 매개로, 해당 게시글의 댓글을 같이 조회한다.
	 * 
	 * @param viewReview - 게시글 번호
	 * @return - 댓글 목록 반환
	 */
	public List<Rv_cmt> selectComment(Review viewReview);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param fileNo - 조회할 파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public Review_file selectReviewfileByFileno(int file_no);

	/**
	 * 게시글의 첨부파일을 삭제한다
	 * 
	 * @param review - 첨부파일을 삭제할 게시글 객체
	 */
	public void deleteFile(Review review);

	/**
	 * 게시글정보를 삭제
	 * 
	 * @param review - 삭제할 게시글의 글번호 객체
	 */
	public void delete(Review review);

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


}
