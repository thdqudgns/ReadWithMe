package web.admin.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.InquiryDao;
import web.admin.service.face.InquiryService;
import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.dto.Inquiry_file;
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
	
	@Override
	public void insertComment(AdminInquiry adminInquiry) {
			inquiryDao.insertComment(adminInquiry);	//	댓글 정보 DB에 입력
//			inquiryDao.check_reply(adminInquiry);	//	답변 완료
	}
	
	@Override
	public void checkReply(AdminInquiry adminInquiry) {
		inquiryDao.check_reply(adminInquiry);
	}
	
	@Override
	public void updateComment(AdminInquiry adminInquiry) {
		inquiryDao.updateComment(adminInquiry);
		
	}
	
	@Override
	public void delete(Inquiry inquiry) {
		inquiryDao.deleteCommentByBoardno(inquiry);
		inquiryDao.delete(inquiry);
	}
	
	@Override
	public Inquiry_file getAttachFile(Inquiry inquiry) {
		return inquiryDao.selectInquiryfileByBoardno(inquiry);
	}
	
	@Override
	public Inquiry_file getFile(int file_no) {
		return inquiryDao.selectInquiryfileByFileno(file_no);
	}
	
	@Override
	public void deleteChecked(String no) {
		
		Inquiry inquiry = new Inquiry();
		inquiry.setBoard_no(Integer.parseInt(no));
		
		
		inquiryDao.deleteCommentByBoardno(inquiry);
		inquiryDao.deleteFile(inquiry);
		inquiryDao.deleteByBoardno(no);
		
	}
	
	@Override
	public List<Inquiry> getHisInquiries(int user_no) {
		return inquiryDao.selectInquiriesByUserNo(user_no);
	}
	
}






















