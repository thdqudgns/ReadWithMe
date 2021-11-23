package web.user.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.FileTb;
import web.user.dto.Interest;
import web.user.dto.ToDoList;
import web.user.dto.UserTb;
import web.util.Paging;

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

	/**
	 * todolist 작성
	 * @param toDoList
	 */
	public void toDoListWrite(ToDoList toDoList);

	/**
	 * 페이징 계산
	 * @param paramData
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 전체 게시글 목록 불러오기
	 * @param paging - 페이징 객체
	 * @param session - user_no들어있음
	 * @return 전체 게시글 목록
	 */
	public List<HashMap<String, Object>> getToDoList(Paging paging, HttpSession session);


}
