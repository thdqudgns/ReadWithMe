package web.admin.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import web.admin.dao.face.AdminDao;
import web.admin.service.face.AdminService;
import web.user.dto.Member;
import web.util.Paging;

public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;

	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = adminDao.selectCntAll();		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		return paging;
	}

	@Override
	public List<Member> list(Paging paging) {
		return adminDao.selectAll(paging);
	}
	
	@Override
	public void getUserNo(HttpServletRequest req, HttpSession session) {

		int member = 0;
		String userno = req.getParameter("userno");
		String state = req.getParameter("val");
		
		if(state.equals("set")) {
			member = adminDao.setAdmin(Integer.parseInt(userno));
		} else if(state.equals("del")) {
			member = adminDao.delAdmin(Integer.parseInt(userno));
		} 
		
	}

}
