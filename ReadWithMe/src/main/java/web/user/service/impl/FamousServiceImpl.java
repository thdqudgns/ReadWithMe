package web.user.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.FamousDao;
import web.user.dao.face.Famous_recDao;
import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.user.dto.Rpt_board;
import web.user.service.face.FamousService;
import web.util.Paging;

@Service
public class FamousServiceImpl implements FamousService {
	
	private static final Logger logger = LoggerFactory.getLogger(FamousService.class);
	
	@Autowired private FamousDao famousDao;
	@Autowired private Famous_recDao famous_recDao;
	
	@Autowired private HttpSession httpSession;
;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = famousDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

//	@Override
//	public List<Famous> getFamousListO(Paging paging) {
//		return famousDao.selectListO(paging);
//	}

	@Override
	public List<HashMap<String, Object>> getFamousList(Paging paging) {
		
	HashMap<String, Object> map = new HashMap<>();
	map.put("paging", paging);
		
	if( String.valueOf(httpSession.getAttribute("user_no")) != null) {
		map.put("user_no", Integer.parseInt(String.valueOf(httpSession.getAttribute("user_no")))); //나중에 이걸로 바꿔야함
	}
//	map.put("user_id", httpSession.getAttribute("user_id") );
		
		
//	return famousDao.selectList(paging);
	return famousDao.selectList(map);
	}

//	@Override
//	public String getIdByUserNo(Famous famous) {
//		return famousDao.getIdByUserNo(famous);
//	}
	
	@Override
	public void insertFamous(Famous famous) {
		famousDao.insertFamous(famous);
	}

	@Override
	public boolean deleteFamous(Famous famous) {
		famousDao.deleteFamous(famous);
		
		if(famousDao.countFamous(famous)  > 0 ) {
			return false;
		} else {
			return true;
		}
		
	}

	@Override
	public boolean isRecommend(Famous_rec recommend) {
		int cnt = famous_recDao.selectCntRecommend(recommend);
		
		if(cnt > 0) { //추천했음
			return true;
			
		} else { //추천하지 않았음
			return false;
			
		}
	}
	
	@Override
	public boolean recommend(Famous_rec recommend) {
		if( isRecommend(recommend) ) { //추천한 상태
			famous_recDao.deleteRecommend(recommend);
			
			return false;
			
		} else { //추천하지 않은 상태
			famous_recDao.insertRecommend(recommend);
			
			return true;
		}
	}

	@Override
	public int getTotalCntRecommend(Famous_rec recommend) {
		return famous_recDao.selectTotalCntRecommend(recommend);
	}

	@Override
	public boolean updateFamous(Famous famous) {
		int res = famousDao.updateFamous(famous);
		
		if( res  > 0 ) {
			return true;
		} else {
			return false;
		}
		
	}

	// 신고 정보 삽입
	@Override
	public boolean insertReportByFamousNo(Rpt_board famous) {
		
		int count = famousDao.countReport(famous);
		
		if(count  > 0 ) {
			return false;
		} else {
			famousDao.insertReportByFamousNo(famous);
			return true;
		}
	}


//	@Override
//	public String getIdByUserNo(int user_no) {
//		return famousDao.getIdByUserNo2(user_no);
//	}



	
	
	
	
	
	
	
	
	
	
	
}
