package web.admin.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.AdminMemberDao;
import web.admin.service.face.AdminMemberService;
import web.user.dto.Ban;
import web.user.dto.UserTb;
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
	
	@Override
	public List<HashMap<String, Object>> getBanMemberList(Paging paging, HttpServletRequest req) {
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
		
		return adminMemberDao.selectBanMemberList(map);
	}
	
	@Override
	public void setAdmin(UserTb user, HttpServletRequest req) {
		
		if( req.getParameter("val").equals("del") ) {
			adminMemberDao.delAdmin(user);
		} else if ( req.getParameter("val").equals("set") ) {
			adminMemberDao.setAdmin(user);			
		}
		
	}
	
	@Override
	public void banUser(HttpServletRequest req) {

		String[] banUser = req.getParameterValues("memberCheck");
		logger.info("banUser {}", Arrays.toString(banUser));
		
		List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = null;
        
        for(int i=0; i<banUser.length; i++) {
        	 map = new HashMap<>();	        	 
        	 map.put("banUser", Integer.parseInt(banUser[i]));
        	 list.add(map);
        }
        
    
        
        Ban ban = null;
        
        for(int i=1; i<list.size()+1; i++) {
        	ban = new Ban();
        	ban.setUser_no(Integer.parseInt(String.valueOf(list.get(i-1).get("banUser"))));
        	
        	adminMemberDao.insertBan(ban);
        	adminMemberDao.updateUser(ban);
        };
		
	}
	
	@Override
	public void banDeleteUser(HttpServletRequest req) {
		String[] banUser = req.getParameterValues("memberCheck");
		logger.info("banUser {}", Arrays.toString(banUser));
		
		List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = null;
        
        for(int i=0; i<banUser.length; i++) {
        	 map = new HashMap<>();	        	 
        	 map.put("banUser", Integer.parseInt(banUser[i]));
        	 list.add(map);
        }
        
    
        
        Ban ban = null;
        
        for(int i=1; i<list.size()+1; i++) {
        	ban = new Ban();
        	ban.setUser_no(Integer.parseInt(String.valueOf(list.get(i-1).get("banUser"))));
        	
        	logger.info("왜 다 풀립니까 {}", ban);
        	
        	adminMemberDao.deleteBan(ban);
        	adminMemberDao.updateBanUser(ban);
        };
		
	}
	
}
