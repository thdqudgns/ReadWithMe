package web.admin.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.FAQ;
import web.user.dto.FileTb;
import web.util.Paging;

public interface FAQService {

	/**
	 * 자주묻는질문 목록 조회
	 * @param paging - 페이징 객체
	 * 
	 * @return 
	 */
	public List<FAQ> list(Paging paging);

	/**
	 * 페이징 처리
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 자주묻는질문 상세보기
	 * 
	 * @param viewFAQ - 자주묻는질문 상세페이지
	 * @return
	 */
	public FAQ view(FAQ viewFAQ);

	/**
	 * 자주묻는질문 글쓰기
	 * 
	 * @param faq - 새로등록할 자주묻는질문 객체
	 * @return
	 */
	public void write(FAQ faq);

	/**
	 * 자주묻는질문 업데이트
	 * 
	 * @param faq - 업데이트할 자주묻는질문
	 */
	public void update(FAQ faq);

	/**
	 * 자주묻는질문 삭세
	 * 
	 * @param faq - 삭제할 자주묻는질문
	 */
	public void delete(FAQ faq);

	/**
	 * 자주묻는질문 게시판에서 선택항목 삭제
	 * 
	 * @param no - 게시글 번호
	 */
	public void deleteChecked(String no);

	/**
	 * 자주묻는질문 게시판에서 선택항목 등록
	 * 
	 * @param no - 게시글 번호
	 */
	public void registerChecked(String no);

	/**
	 * 자주묻는질문 게시판에서 선택항목 등록취소
	 * 
	 * @param string - 게시글 번호
	 */
	public void cancelChecked(String no);
	
	/**
	 * 자주묻는질문 선택 항목 조회
	 * 
	 * @return 자주묻는질문 선택 항목
	 */
	public List<FAQ> getSelected();

}
