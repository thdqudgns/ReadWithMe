package web.user.dao.face;

import java.util.List;

import web.user.dto.Inquiry;
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

}
