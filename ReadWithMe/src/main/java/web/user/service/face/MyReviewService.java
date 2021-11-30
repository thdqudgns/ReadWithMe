package web.user.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.util.Paging;

public interface MyReviewService {

	Paging getPaging(Paging paramData);

	List<Review> getMyReviewList(Paging paging);
	//list
	

	Review view(Review viewReview);

	Review_file getAttachFile(Review viewReview);

	boolean isRecommend(Review_rec recommend);

	Object getTotalCntRecommend(Review_rec recommend);

	List<Rv_cmt> getCommentList(Review viewReview);
	//view
	

	Review_file getFile(int file_no);
	//download
	

	void update(Review review, MultipartFile file);

	void delete(Review review);
	//delete
	

	boolean review_rec(Review_rec review_rec);

	int getTotalCntReview_rec(Review_rec review_rec);
	//recommend

}
