package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.AdminInquiryDao;
import web.user.dao.face.UserInquiryDao;
import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.service.face.UserInquiryService;
import web.util.Paging;

@Service
public class UserInquiryServiceImpl implements UserInquiryService{
	
	@Autowired private UserInquiryDao userInquiryDao;
	@Autowired private AdminInquiryDao adminInquiryDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = userInquiryDao.selectCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Inquiry> list(Paging paging) {
		return userInquiryDao.selectAll(paging);
	}
	
	@Override
	public Inquiry view(Inquiry inquiry) {
		return userInquiryDao.selectInquiryByBoardno(inquiry);
	}
	
	@Override
	public void write(Inquiry inquiry) {
		
		//제목 작성 안할 시 "(제목없음)" 입력
		if("".equals(inquiry.getBoard_title())) {
			inquiry.setBoard_title("(제목없음)");
		}
		
		userInquiryDao.insertInquiry(inquiry);
	}
	
	@Override
	public void insertComment(AdminInquiry adminInquiry) {
		adminInquiryDao.insertComment(adminInquiry);
		adminInquiryDao.check_notreply(adminInquiry);
	}
	
	@Override
	public List<AdminInquiry> getCommentList(Inquiry inquiry) {
		return adminInquiryDao.selectComment(inquiry);
	}
	
	//	댓글 삭제
	@Override
	public boolean deleteComment(AdminInquiry adminInquiry) {
		adminInquiryDao.deleteComment(adminInquiry);	//	댓글 삭제
		
		if(adminInquiryDao.countComment(adminInquiry) > 0 ) {	
			return false;
		} else {
			return true;
		}
	}
}


















