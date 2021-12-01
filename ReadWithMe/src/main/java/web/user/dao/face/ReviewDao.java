package web.user.dao.face;

import java.util.List;

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Rpt_board;
import web.util.Paging;

public interface ReviewDao {
	
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

	//==========================================================
	
	// 상세보기 Dao 메소드
	/**
	 * 조회수 1 증가
	 * 
	 * @param viewReview 게시글 번호
	 */
	public void hit(Review viewReview);

	/**
	 * 게시글 번호로 후기 조회하기
	 * 
	 * @param viewReview - 게시글 번호가 담긴 객체
	 * @return 조회된 게시글의 정보
	 */
	public Review selectReviewByReviewNo(Review viewReview);

	/**
	 * 게시글 번호로 파일 번호 조회
	 * 
	 * @param viewReview - 게시글 번호가 담긴 객체
	 * @return - 파일번호객체
	 */
//	public Review_file getFileNo(Review viewReview);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public Review_file selectReviewfileByReviewNo(Review viewReview);

	//==========================================================
	
	//글 작성 메소드
	/**
	 * 글 작성
	 * 
	 * @param review - 글제목, 글내용, 회원번호, 닉네임 정보가 담겨있다.
	 */
	public void insertReview(Review review);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param reviewfile - 삽입할 첨부파일 정보
	 */
	public void insertFile(Review_file reviewfile);
	
	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param fileNo - 조회할 파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public Review_file selectReviewfileByFileno(int file_no);

	//==========================================================

	/**
	 * 게시글정보를 수정
	 * 
	 * @param review - 수정할 내용을 가진 게시글 객체
	 */
	public void update(Review review);

	//==========================================================

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
	 * 마지막에 추가된 행의 글  번호를 조회
	 * 
	 * @return - 글 번호
	 */
	public int lastReviewNo();

	/**
	 * 후기글번호와 함께 신고글에 정보 삽입
	 * 
	 * @param review - 후기글번호가 담긴 객체
	 */
	public void insertReportByReviewNo(Rpt_board review);

	/**
	 * 신고된 글 확인
	 * 
	 * @param review - 명언글 번호, 신고한 회원 번호
	 * @return 데이터 개수
	 */
	public int countReport(Rpt_board review);


}
