package web.user.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.user.dao.face.MyPageDao;
import web.user.dto.FileTb;
import web.user.dto.Interest;
import web.user.dto.Meeting;
import web.user.dto.ToDoList;
import web.user.dto.UserTb;
import web.user.service.face.MyPageService;
import web.util.MailHandler;
import web.util.Paging;


@Service
public class MyPageServiceInpl implements MyPageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageService.class);
	@Autowired	MyPageDao myPageDao;
	@Autowired PasswordEncoder passwordEncoder;
	@Autowired ServletContext context;
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public void wthdrUser(int user_no) {
		myPageDao.deleteUser(user_no);		
	}
	
	@Override
	public int userPwCheck(UserTb user) {
		
		String pw = user.getPassword();
				
		logger.info("입력받은 비밀번호"+pw);

		String password = myPageDao.selectPwByUser_no(user);
		
		logger.info("실제 비밀번호"+password);
		
		if(passwordEncoder.matches(pw, password)) {
			logger.info("비밀번호 일치");
			user.setPassword(password);
		}else {
			logger.info("비밀번호 불일치");
		}  
	  
		int res = myPageDao.selectCntPwMtc(user);
		logger.info("res!! {}:", res);
		
		return myPageDao.selectCntPwMtc(user);
	}
	
	@Override
	public void pwChange(UserTb user) {
		
		String encPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encPassword);
		logger.info("암호화된 비밀번호 : "+user.getPassword());
		
		myPageDao.updatePw(user);
		
	}
	
	@Override
	public UserTb getUserProfile(UserTb user) {
		return myPageDao.selectUserByUser_no(user);
	}
	
	@Override
	public Interest getUserInterest(UserTb user) {
		return myPageDao.selectInterestByUser_no(user);
	}
	
	@Override
	public FileTb getUserFile(UserTb user) {
		
		List<Integer> fileno = new ArrayList<Integer>();
		fileno = myPageDao.selectFileByUser_no(user);
		
		
		int file_no = fileno.get(0);
		logger.info("file_no {}", file_no);
		
		return myPageDao.selectFileByfile_no(file_no);
	}
	
	
	@Override
	public void updateProfile(UserTb user, HttpServletRequest req, MultipartFile file) {

		String[] interests = req.getParameterValues("interest");
		
		myPageDao.updateMember(user);
		
		Interest interest = new Interest();
		
		interest.setUser_no( user.getUser_no() );
		
		logger.info("interest입니다 {}", interests);
	
		if( interests.length == 1 ) {
			
			interest.setInterest(interests[0]);
			logger.info("interests확인 {}", interest);
			
		} else if( interests.length == 2 ) {
			
			interest.setInterest(interests[0]);
			interest.setInterest2(interests[1]);
			logger.info("interests확인1 {}", interest);
			
		} else if( interests.length == 3 ) {
			
			interest.setInterest(interests[0]);
			interest.setInterest2(interests[1]);
			interest.setInterest3(interests[2]);
			logger.info("interests확인2 {}", interest);
			
		}
		
		myPageDao.updateInterest(interest);
		
		//--------------------------------------------
		
		//빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
	
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		UUID uuid = UUID.randomUUID(); //랜덤 UUID
		String uid = uuid.toString().split("-")[0]; //8자리 uuid
		
		//저장될 파일의 이름 생성하기
		String originName = file.getOriginalFilename();
		int dotIndex = originName.lastIndexOf(".");
		String extention = originName.substring(dotIndex);
		String stored = originName.substring(0, dotIndex) + "_" + uid + extention; //원본파일명_uid
		
		//저장할 파일 객체
		File dest = new File(storedPath, stored);
		
		try {
			file.transferTo(dest); //업로드 파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------------------
		
		FileTb profileFile = new FileTb();
		profileFile.setUser_no(user.getUser_no());
		profileFile.setOrigin_name(originName);
		profileFile.setStored_name(stored);
		profileFile.setUrl(storedPath);
		
		myPageDao.insertFile(profileFile);		
		
	}
	
	@Override
	public void toDoListWrite(ToDoList toDoList) {
		myPageDao.insertToDoList(toDoList);		
	}
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = myPageDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> getToDoList(Paging paging, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);		
		map.put("user_no", Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		
		return myPageDao.selectToDoList(map);
		
	}
	
	@Override
		public void sendToDoList(HttpServletRequest req) {
			logger.info("sendToDoList()");
			
			String[] todolists = req.getParameterValues("toDoListCheck");
			logger.info("todolists {}", Arrays.toString(todolists));
			
			List<Map<String, Object>> list = new ArrayList<>();
	        Map<String, Object> map = null;
	        
	        for(int i=0; i<todolists.length; i++) {
	        	 map = new HashMap<>();	        	 
	        	 map.put("todolist", myPageDao.selectToDoListByListNo(Integer.parseInt(todolists[i])));
	        	 list.add(map);
	        }
	        
	    
	        
	        ToDoList toDoList = null;
	        
	        for(int i=1; i<list.size()+1; i++) {
	        	toDoList = new ToDoList();
	        	toDoList = (ToDoList) list.get(i-1).get("todolist");
	        	logger.info("과연 {}", toDoList);
	        	
	        	try {
	        		MailHandler sendMail = new MailHandler(mailSender);
	        		sendMail.setSubject("[To Do List]");
	        		sendMail.setText( 
	        				"<h1>!To Do List!</h1> [ " +
	        				toDoList.getBookname()+ " ] 을 읽고 회원님이 다짐해주신 목표는 [ "+
	        				toDoList.getList_content() + " ] 입니다!<br>" +
	        				"이룰 수 있게 노력하는 하루가 되었으면 좋겠습니다!");
	        		sendMail.setFrom("anzu.only@gmail.com", "Read With Me");
	        		sendMail.setTo(myPageDao.selectEmailByUserNo(toDoList));
	        		sendMail.send();
	        	} catch (MessagingException | UnsupportedEncodingException e) {
	        		e.printStackTrace();
	        	}
	        	
	        }
	        
			
			
		}
	
	@Override
	public void deleteToDoList(HttpServletRequest req) {

		String[] todolists = req.getParameterValues("toDoListCheck");
		
		List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = null;
        
        for(int i=0; i<todolists.length; i++) {
        	 map = new HashMap<>();	        	 
        	 map.put("todolist", myPageDao.selectToDoListByListNo(Integer.parseInt(todolists[i])));
        	 list.add(map);
        }
        
    
        
        ToDoList toDoList = null;
        
        for(int i=1; i<list.size()+1; i++) {
        	toDoList = new ToDoList();
        	toDoList = (ToDoList) list.get(i-1).get("todolist");
        	logger.info("삭제를 위한.. {}", toDoList);
        	
        	myPageDao.deleteToDoList(toDoList.getList_no());
        	
        }
		
	}
	
	
	@Override
	public List<Meeting> getMeeting(UserTb user) {	
		
		List<Meeting> list = new ArrayList<Meeting>();
		
		List<Meeting> meetingList1 = myPageDao.selectMeetingHosted(user);
		logger.info("user!!!!!!!!!!{}", user);
		
		
		logger.info("확인 {}", myPageDao.selectMeetingNoByUser_no(user));
		int user_no = myPageDao.selectMeetingNoByUser_no(user);
		logger.info("user_no!!!!!!!!!!{}", user_no);
		List<Meeting> meetingList2 = myPageDao.selectMeetingAttend(user_no);
		
		for(Meeting mList1 : meetingList1) {
			logger.info("mList1{}", mList1);
			
			list.add(mList1);
		};
		
		for(Meeting mList2 : meetingList2) {
			logger.info("mList2{}", mList2);
			
			list.add(mList2);
		};
		
		for(Meeting list2 : list) {
			logger.info("list2list2{}", list2);
		};
		
		return list;
	}
	
	
}
