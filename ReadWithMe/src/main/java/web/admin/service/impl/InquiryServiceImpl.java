package web.admin.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.InquiryDao;
import web.admin.service.face.InquiryService;
import web.user.dto.Inquiry;
import web.util.Paging;

@Service
public class InquiryServiceImpl implements InquiryService{

	//	DAO 객체
	@Autowired private InquiryDao inquiryDao;
	
	//	서블릿 컨텍스트 객체
	@Autowired private ServletContext context;
	
	//	페이징 처리
	@Override
	public Paging getPaging(Paging paramData) {
		
		//	총 게시글 수 조회
		int totalCount = inquiryDao.selectCntAll(paramData);
		
		//	페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	//	1:1 질문 전체 조회
	@Override
	public List<Inquiry> list(Paging paging) {
		
		return inquiryDao.selectAll(paging);
		
	}
	
	//	1:1 질문 상세보기
	@Override
	public Inquiry view(Inquiry inquiry) {
		
		return inquiryDao.selectInquiryByBoardno(inquiry);
	}
	
}






















