package web.user.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.FamousDao;
import web.user.dto.Famous;
import web.user.service.face.FamousService;
import web.util.Paging;

@Service
public class FamousServiceImpl implements FamousService {
	
	private static final Logger logger = LoggerFactory.getLogger(FamousService.class);
	@Autowired private FamousDao famousDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = famousDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<Famous> getFamousList(Paging paging) {
		return famousDao.selectList(paging);
	}

}
