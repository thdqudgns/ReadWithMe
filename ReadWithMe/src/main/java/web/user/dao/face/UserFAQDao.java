package web.user.dao.face;

import java.util.List;

import web.user.dto.FAQ;
import web.util.Paging;

public interface UserFAQDao {

	/**
	 * 전체 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 자주묻는질문 게시판 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<FAQ> selectAll(Paging paging);

	/**
	 * 게시글 번호로 자주묻는질문 상세보기 조회 
	 * 
	 * @param faq - 게시글 번호를 지닌 자주묻는질문 DTO 객체
	 * @return
	 */
	public FAQ selectFAQByBoardno(FAQ faq);

	/**
	 * 조회수 증가
	 * 
	 * @param faq - board_no 을 담은 객체
	 */
	public void hit(FAQ faq);

}
