package web.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.user.dto.FileTb;
import web.user.dto.Interest;
import web.user.dto.ToDoList;
import web.user.dto.UserTb;
import web.user.service.face.MyPageService;
import web.util.Paging;

@Controller
public class MyPageMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageMainController.class);
	@Autowired MyPageService myPageService;
	
	@RequestMapping(value="/mypage/main")
	public String myPageMain() {
		logger.info("/mypage/main");
		
		return "user/mypage/main";
	}
	
	// --------------------------------------- 회원 탈퇴 ---------------------------------------
	@RequestMapping(value="/mypage/wthdr", method = RequestMethod.GET)
	public String Wthdr() {		
		return "user/mypage/profile/wthdr";
	}
	
	@RequestMapping(value="/mypage/wthdr", method = RequestMethod.POST)
	public String WthdrProc(HttpSession session) {		
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		System.out.println(user_no);
		myPageService.wthdrUser(user_no);
		session.invalidate();	
		return "user/mypage/profile/wthdrEnd";
	}
	
	// --------------------------------------- 비밀번호 변경---------------------------------------
	
	@RequestMapping(value="/pwchange", method = RequestMethod.GET)
	public String PwChange() {
		return "user/mypage/profile/pwChange";
	}
	
	@RequestMapping(value="/pwchange", method = RequestMethod.POST)
	public String PwChangeProc(UserTb user, HttpSession session) {
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		user.setUser_no(user_no);
		logger.info("user {}", user);
		myPageService.pwChange(user);
		
		return "user/mypage/profile/pwChangeEnd";
	}
	
	@RequestMapping(value="/pwCheck", method = RequestMethod.GET)
	@ResponseBody
	public int PwCheck(@RequestParam("prsntPw") String prsntPw, UserTb user, HttpSession session) {
		logger.info(prsntPw);

		user.setPassword(prsntPw);

		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		user.setUser_no(user_no);
		int res = myPageService.userPwCheck(user);
		
		logger.info("res {}", res);
		
		return res;
	}
	
	
	@RequestMapping(value="/pwCheck1", method = RequestMethod.GET)
	@ResponseBody
	public int PwCheck1(@RequestParam("password") String password, UserTb user, HttpSession session) {
		logger.info(password);
		
		user.setPassword(password);
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		user.setUser_no(user_no);
		int res = myPageService.userPwCheck(user);
		
		logger.info("res {}", res);
		
		return res;
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String Profile(UserTb user, HttpSession session, Model model) {
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		user.setUser_no(user_no);
		
		UserTb userProfile = myPageService.getUserProfile(user);
		Interest userInterest = myPageService.getUserInterest(user);
		FileTb userFile = myPageService.getUserFile(user);
		
		
		model.addAttribute("user", userProfile);
		model.addAttribute("interest", userInterest);
		model.addAttribute("file", userFile);
		
		logger.info("user {}", userProfile);
		logger.info("interest {}", userInterest);
		logger.info("file {}", userFile);
		
		return"user/mypage/profile/profile";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String ProfileProc (UserTb user, HttpSession session, MultipartFile file, HttpServletRequest req) {
	
		user.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		logger.info("user입니다 {}", user);
		
		myPageService.updateProfile(user, req, file);
		
		UserTb userProfile = myPageService.getUserProfile(user);
		Interest userInterest = myPageService.getUserInterest(user);
		
		return"user/mypage/main";
	}
	
	
	// --------------------------------------- To Do List ---------------------------------------
	
	@RequestMapping(value="/todolist", method=RequestMethod.GET)
	public String Todolist(Paging paramData, Model model, HttpSession session) {
		
		Paging paging = myPageService.getPaging(paramData);
		
		List<HashMap<String,Object>> toDoListLS = myPageService.getToDoList(paging, session);
		
		for(HashMap<String,Object> m : toDoListLS) {
			logger.info("{}", m);
		}
		
		logger.info("todolist!! {}", toDoListLS);
		
		model.addAttribute("toDoList", toDoListLS);
		model.addAttribute("paging", paging);
		
		return"user/mypage/todolist/list";
	}
	
	@RequestMapping(value="/todolist", method=RequestMethod.POST)
	public String TodolistProc(HttpSession session, ToDoList toDoList) {	
		
		toDoList.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		logger.info("toDoList {}", toDoList);
		
		myPageService.toDoListWrite(toDoList);
		
		return"redirect:/todolist";
	}

	@RequestMapping(value="/todolist/send", method = RequestMethod.POST)
	@ResponseBody
	public String TodolistSend(@RequestBody int[] checkArr) {
		
		logger.info("checkArr: {}", checkArr);

		return"";
	}
	
	
	
}
