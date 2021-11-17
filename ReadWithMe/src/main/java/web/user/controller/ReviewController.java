package web.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import web.user.service.face.ReviewService;

@Controller
public class ReviewController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewService reviewService;

}
