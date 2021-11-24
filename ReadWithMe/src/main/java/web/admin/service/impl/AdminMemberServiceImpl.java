package web.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.AdminMemberDao;
import web.admin.service.face.AdminMemberService;
import web.util.Paging;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberService.class);
	@Autowired private AdminMemberDao adminMemberDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		int totalCount = adminMemberDao.selectCntAll();

		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> getMemberList(Paging paging, HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		
		if( req.getParameter("selectBox") != "" && req.getParameter("selectBox") != null ) {
			logger.info("req.getParameter(\"selectBox\") {}", req.getParameter("selectBox"));
			map.put("selectBox", req.getParameter("selectBox") );
		}
		
		if( req.getParameter("search") != "" && req.getParameter("search") != null ) {
			logger.info("req.getParameter(\"search\") {}", req.getParameter("seach"));
			map.put("search", req.getParameter("search") );
		}
		
		return adminMemberDao.selectMemberList(map);
	}
}
