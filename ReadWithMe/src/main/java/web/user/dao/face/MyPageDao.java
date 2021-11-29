package web.user.dao.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.FileTb;
import web.user.dto.Interest;
import web.user.dto.Meeting;
import web.user.dto.ToDoList;
import web.user.dto.UserTb;
import web.util.Paging;

public interface MyPageDao {

	/**
	 * 회원탈퇴
	 * @param user_no
	 */
	public void deleteUser(int user_no);
	
	/**
	 * 비밀번호 변경 위해 현재 비밀번호 확인
	 * @param user
	 * @return
	 */
	public String selectPwByUser_no(UserTb user);

	/**
	 * 비밀번호 변경 위해 현재 비밀번호가 맞는지 확인
	 * @param user
	 * @return
	 */
	public int selectCntPwMtc(UserTb user);

	/**
	 * 비밀번호 변경
	 * @param user
	 */
	public void updatePw(UserTb user);

	/**
	 * user_no으로 user프로필 정보 가져오기
	 * @param user
	 * @return
	 */
	public UserTb selectUserByUser_no(UserTb user);

	/**
	 * user_no으로 interest정보 가져오기
	 * @param user
	 * @return
	 */
	public Interest selectInterestByUser_no(UserTb user);

	/**
	 * user_no으로 가장 최근 file정보 가져오기
	 * @param user
	 * @return 가장 최근 fileno
	 */
	public List<Integer> selectFileByUser_no(UserTb user);
	
	/**
	 * file_no으로 file전체정보 가져오기
	 * @param fileno
	 * @return
	 */
	public FileTb selectFileByfile_no(int fileno);
	/**
	 * 프로필 수정
	 * @param user
	 */
	public void updateMember(UserTb user);

	/**
	 * 프로필 수정(관심분야)
	 * @param interest
	 */
	public void updateInterest(Interest interest);

	/**
	 * 프로필 사진 추가
	 * @param profileFile
	 */
	public void insertFile(FileTb profileFile);

	/**
	 * todolist 추가
	 * @param toDoList
	 */
	public void insertToDoList(ToDoList toDoList);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 페이징을 적용하여  todolist 조회

	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HashMap<String, Object>> selectToDoList(HashMap<String, Object> map);

	/**
	 * list_no으로 todolist 조회
	 * @param list_no
	 * @return
	 */
	public ToDoList selectToDoListByListNo(int list_no);

	/**
	 * userno으로 email조회
	 * @param toDoList
	 * @return
	 */
	public String selectEmailByUserNo(ToDoList toDoList);

	/**
	 * list_no으로 todolist 삭제
	 * @param list_no
	 */
	public void deleteToDoList(int list_no);

	/**
	 * 주최한 모임 조회
	 * @param map
	 * @return
	 */
	public List<Meeting> selectMeetingHosted(UserTb user);

	/**
	 * 참여한 모임 조회
	 * @param map
	 * @return
	 */
	public List<Meeting> selectMeetingAttend(int user_no);

	/**
	 * 참여한 모임의 meetingno을 user_no이용하여 구함
	 * @param user_no
	 * @return
	 */
	public int selectMeetingNoByUser_no(UserTb user);




}
