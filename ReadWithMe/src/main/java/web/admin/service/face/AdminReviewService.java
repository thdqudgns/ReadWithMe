package web.admin.service.face;

import java.util.List;

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.util.Paging;

public interface AdminReviewService {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> getReviewList(Paging paging);

	//상세보기 메소드
	/**
	 * 글 번호로 상세정보들을 불러온다.
	 * 
	 * @param viewReview - 글 번호 객체
	 * @return - 조회된 모든 값들을 반환한다.
	 */
	public Review view(Review viewReview);

	/**
	 * 파일번호로 파일 정보를 불러온다
	 * 
	 * @param fileNo - 파일 번호 객체
	 * @return - 파일 전체정보 객체
	 */
	public Review_file getAttachFile(Review viewReview);

	/**
	 * 총 추천 수를 구한다
	 * 
	 * @param recommend - 추천수를 파악할 게시글 정보
	 * @return 총 추천 수
	 */
	public int getTotalCntRecommend(Review_rec recommend);

	/**
	 * 게시글 번호를 매개로, 해당 게시글의 댓글을 같이 조회한다.
	 * 
	 * @param viewReview - 게시글 번호
	 * @return - 댓글 목록 반환
	 */
	public List<Rv_cmt> getCommentList(Review viewReview);

	//파일 다운로드
	/**
	 * 파일번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param fileNo - 조회할 파일 번호
	 * @return 첨부파일 정보
	 */
	public Review_file getFile(int file_no);

	//글 삭제 메소드
	/**
	 * 게시글 + 첨부파일 삭제 처리
	 * 
	 * @param review - 삭제할 게시글의 게시글번호 객체
	 */
	public void delete(Review review);

	//댓글 삭제
	/**
	 * 댓글을 삭제한다
	 * 
	 * @param comment - 삭제하려는 댓글의 정보
	 * @return 삭제 성공 여부
	 */
	public boolean deleteComment(Rv_cmt comment);

}
