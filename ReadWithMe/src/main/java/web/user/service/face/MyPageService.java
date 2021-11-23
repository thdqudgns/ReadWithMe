package web.user.service.face;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.FileTb;
import web.user.dto.Interest;
import web.user.dto.UserTb;

public interface MyPageService {

	/**
	 * 회원 탈퇴
	 * @param user_no
	 */
	public void wthdrUser(int user_no);

	/**
	 * 현재 비밀번호가 일치하는지 확인
	 * @param prsntPw
	 * @return
	 */
	public int userPwCheck(UserTb user);

	/**
	 * 비밀번호 변경
	 * @param user
	 */
	public void pwChange(UserTb user);

	/**
	 * 프로필 변경 위해 회원 프로필 가져오기
	 * @param user - user_no이 들어있는 DTO
	 * @return
	 */
	public UserTb getUserProfile(UserTb user);

	/**
	 * 프로필 변경 위해 회원 관심분야 가져오기
	 * @param user - user_no이 들어있는 DTO
	 * @return
	 */
	public Interest getUserInterest(UserTb user);

	/**
	 * 프로필 변경 위해 회원 프로필 가져오기
	 * @param user - user_no이 들어있는 DTO
	 * @return
	 */
	public FileTb getUserFile(UserTb user);

	/**
	 * 프로필 변경
	 * @param user - user정보가 들어있는 DTO객체
	 * @param req - interest정보가 들어있음
	 * @param file - 프로필사진객체
	 * @return
	 */
	public void updateProfile(UserTb user, HttpServletRequest req, MultipartFile file);


}
