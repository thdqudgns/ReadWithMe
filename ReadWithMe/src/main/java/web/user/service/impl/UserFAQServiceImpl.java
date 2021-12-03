package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.UserFAQDao;
import web.user.dto.FAQ;
import web.user.service.face.UserFAQService;
import web.util.Paging;

@Service
public class UserFAQServiceImpl implements UserFAQService{

	//	DAO 연결
	@Autowired private UserFAQDao userFAQDao;
	
	//	페이징 처리
	@Override
	public Paging getPaging(Paging paramData) {
		
		// 총 게시글 수 조회
		int totalCount = userFAQDao.selectCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	//	자주묻는질문 게시판 전체 조회
	@Override
	public List<FAQ> list(Paging paging) {
		
		return userFAQDao.selectAll(paging);
	}
	
	//자주묻는질문 상세보기 조회
	@Override
	public FAQ view(FAQ faq) {
		
		userFAQDao.hit(faq);
		
		return userFAQDao.selectFAQByBoardno(faq);
	}
}
