package web.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.AdminFamousDao;
import web.admin.service.face.AdminFamousService;
import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.util.Paging;

@Service
public class AdminFamousServiceImpl implements AdminFamousService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminFamousService.class);
	
	@Autowired private AdminFamousDao adminFamousDao;
	
	@Autowired private HttpSession httpSession;

	@Override
	public Paging getPaging(Paging paramData) {
		//총 게시글 수 조회
		int totalCount = adminFamousDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getFamousList(Paging paging) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
			
		if( (String)httpSession.getAttribute("user_no") != null) {
			map.put("user_no", Integer.parseInt((String)httpSession.getAttribute("user_no"))); //나중에 이걸로 바꿔야함
		}
			
			
		return adminFamousDao.selectList(map);
	}

	@Override
	public int getTotalCntRecommend(Famous_rec recommend) {
		return adminFamousDao.selectTotalCntRecommend(recommend);
	}

	@Override
	public boolean deleteFamous(Famous famous) {
		adminFamousDao.deleteFamous(famous);
		
		if(adminFamousDao.countFamous(famous)  > 0 ) {
			return false;
		} else {
			return true;
		}
	}

}
