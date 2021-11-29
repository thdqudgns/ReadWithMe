package web.admin.dao.face;

import java.util.List;

import web.user.dto.FAQ;
import web.util.Paging;

public interface FAQDao {

	/**
	 * 자주묻는질문 목록 조회
	 * @param paging - 페이징 객체
	 * 
	 * @return
	 */
	public List<FAQ> selectAllFaq(Paging paging);

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 자주묻는질문 상세보기 조회
	 * 
	 * @param viewFAQ - 자주묻는질문 상세페이지
	 * @return
	 */
	public FAQ selectFAQbyBoardno(FAQ viewFAQ);

	/**
	 * 새로 등록할 자주묻는질문 데이터베이스에 저장
	 * 
	 * @param faq - 새로 등록할 자주묻는질문
	 */
	public void insertFAQ(FAQ faq);

	/**
	 * 자주묻는질문 수정
	 * 
	 * @param faq - 수정된 자주묻는질문
	 */
	public void update(FAQ faq);

	/**
	 * 자주묻는질문 삭제
	 * 
	 * @param faq - 삭제할 자주묻는질문
	 */
	public void delete(FAQ faq);

	/**
	 * 자주묻는질문 선택항목 삭제
	 * 
	 * @param no - 게시글 번호
	 */
	public void deleteByBoardno(String no);

	/**
	 * 자주묻는질문 선택항목 등록
	 * 
	 * @param no - 게시글 번호
	 */
	public void registerByBoardno(String no);

	/**
	 * 자주묻는질문 선택항목 등록취소
	 * 
	 * @param no - 게시글 번호
	 */
	public void updateToCancelByBoardno(String no);

}
