package web.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeContoller {
	
	@RequestMapping(value="/")
	public String main(HttpServletRequest req) {
		
        //베스트 리뷰
//        List<Review> bestPosts = reviewService.getBestPosts();
//        if (!bestPosts.isEmpty()) {
//            req.setAttribute("bestPosts", bestPosts);
//        }

        //공지 & 이벤트
//        Map<Integer, List<Notice>> map = noticeService.getNotice();
//        req.setAttribute("notices", map.get(notice.TYPE_NOTICE));
//        req.setAttribute("events", map.get(notice.TYPE_EVENT));
		
		
		return "/main";
	}
	
	

}
