package web.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.admin.dao.face.FAQDao;
import web.admin.service.face.FAQService;
import web.user.dto.FAQ;
import web.util.Paging;

@Service
public class FAQServiceImpl implements FAQService{

	//	DAO 객체
	@Autowired private FAQDao faqDao;
	
	//	서블릿 컨텍스트 객체
	@Autowired private ServletContext context;
	
	//	자주묻는질문 목록
	@Override
	public List<FAQ> list(Paging paging) {
		
		return faqDao.selectAllFaq(paging);
	}
	
	//	페이징 처리
	@Override
	public Paging getPaging(Paging paramData) {

		//	총 게시글 수 조회
		int totalCount = faqDao.selectCntAll(paramData);
		
		//	페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	//	자주묻는질문 상세보기
	@Override
	public FAQ view(FAQ viewFAQ) {
		return faqDao.selectFAQbyBoardno(viewFAQ);
	}
	
	//	자주묻는질문 글쓰기
	@Override
	public void write(FAQ faq) {
		
		//	제목입력 없을 시 "(제목없음)" 대입
		if("".equals(faq.getBoard_title())) {
			faq.setBoard_title("(제목없음)");
		}
		
		faqDao.insertFAQ(faq);
			
	}
	
	//	자주묻는질문 업데이트
	@Override
	public void update(FAQ faq) {
		
		if("".equals(faq.getBoard_title())) {
			faq.setBoard_title("(제목없음)");
		}
		
		faqDao.update(faq);
		
	}
	
	//	자주묻는질문 삭제
	@Override
	public void delete(FAQ faq) {
		
		faqDao.delete(faq);
		
	}
	
	//자주묻는질문 선택항목 삭제
	@Override
	public void deleteChecked(String no) {
		faqDao.deleteByBoardno(no);
	}
	
	//자주묻는질문 선택항목 등록
	@Override
	public void registerChecked(String no) {
		faqDao.registerByBoardno(no);
	}
	
	//자주묻는질문 선택항목 등록취소
	@Override
	public void cancelChecked(String no) {
		faqDao.updateToCancelByBoardno(no);
	}
	
}




























