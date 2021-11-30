package web.user.dao.face;

import java.util.List;

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.util.Paging;

public interface MyReviewDao {

	List<Review> selectList(Paging paging);

	int selectCntAll(Paging paramData);

	//----------------------------------------------

	void hit(Review viewReview);

	Review selectReviewByReviewNo(Review viewReview);

	Review_file selectReviewfileByReviewNo(Review viewReview);
	
	//----------------------------------------------

	Review_file selectReviewfileByFileno(int file_no);

	//----------------------------------------------
	
	void update(Review review);

	//----------------------------------------------
	
	void deleteFile(Review review);

	void insertFile(Review_file reviewfile);

	//----------------------------------------------
	
	void delete(Review review);
	
	

	
}
