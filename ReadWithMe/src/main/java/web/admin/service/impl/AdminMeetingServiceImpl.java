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

import web.admin.dao.face.AdminMeetingDao;
import web.admin.service.face.AdminMeetingService;
import web.user.dto.Ban;
import web.user.dto.Meeting;
import web.util.Paging;
@Service
public class AdminMeetingServiceImpl implements AdminMeetingService {
	private static final Logger logger = LoggerFactory.getLogger(AdminMeetingService.class);
	@Autowired private AdminMeetingDao adminMeetingDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		int totalCount = adminMeetingDao.selectCntAll();

		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	@Override
	public List<HashMap<String, Object>> getMeetingList(Paging paging, HttpServletRequest req) {
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
		
		List<HashMap<String, Object>> list = adminMeetingDao.selectMeetingList(map);
				
//		HashMap<String, Object> map1 = null;
//		 List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
//		 
//		for(int i=0; i<meetingList.size(); i++) {			
//			String js = String.valueOf(meetingList.get(i).get("MEETING_NO"));
//			map1 = new HashMap<>();
//			map1.put("MEETING_NO", js );
//			map1.put("CNT", adminMeetingDao.selectCntUser(js) );
//			list.add(map1);
//		};
//		
//		logger.info("listlist {}", list);
		
		return list;
	}
	

	
	@Override
	public void approvalMeeting(HttpServletRequest req) {
		
		String[] Meetings = req.getParameterValues("memberCheck");
		logger.info("Meetings {}", Arrays.toString(Meetings));
		
		List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = null;
        
        for(int i=0; i<Meetings.length; i++) {
        	 map = new HashMap<>();	        	 
        	 map.put("Meetings", Integer.parseInt(Meetings[i]));
        	 list.add(map);
        }
        
        for(int i=1; i<list.size()+1; i++) {
        	Meeting meeting = new Meeting();
        	meeting.setMeeting_no(Integer.parseInt(String.valueOf(list.get(i-1).get("Meetings"))));
        	
        	adminMeetingDao.updateMeeting(meeting);
        };
		
	}
	@Override
	public void deleteMeeting(HttpServletRequest req) {
		String[] Meetings = req.getParameterValues("memberCheck");
		logger.info("Meetings {}", Arrays.toString(Meetings));
		
		List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = null;
        
        for(int i=0; i<Meetings.length; i++) {
        	 map = new HashMap<>();	        	 
        	 map.put("Meetings", Integer.parseInt(Meetings[i]));
        	 list.add(map);
        }
        
    
        
        for(int i=1; i<list.size()+1; i++) {
        	Meeting meeting = new Meeting();
        	meeting.setMeeting_no(Integer.parseInt(String.valueOf(list.get(i-1).get("Meetings"))));
        	
        	adminMeetingDao.deleteMeeting(meeting);
        };
	}

}
