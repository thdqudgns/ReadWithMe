package web.user.dao.face;

import web.user.dto.UserTb;
import web.user.dto.Interest;
import web.user.dto.Social_account;
import web.user.dto.UserAuth;

public interface LoginDao {

	public void join(UserTb user);

	public void login(UserTb user);

	public void naverLogin(Social_account social);

	public void googleLogin(Social_account social);

	public void kakaoLogin(Social_account social);

	public void selectIdByEmail(UserTb user);

	public void selectPwById(UserTb user);

	/**
	 * id가 존재하는 값인지 확인한다
	 * @param id - 조회하려는 회원의 id
	 * @return 
	 */
	public int selectCntById(String id);

	/**
	 * nick 이 존재하는 값인지 확인한다
	 * @param nick - 조회하려는 회원의 nick
	 * @return
	 */
	public int selectCntByNick(String nick);

	/**
	 * 회원 가입
	 * @param user
	 */
	public void insertMember(UserTb user);

	/**
	 * 회원가입 시 관심분야 추가
	 * @param interest
	 */
	public void insertInterest(Interest interest);

	/**
	 * id와 pw가 맞는지 확인
	 * @param member - id, pw가 담긴 DTO객체
	 * @return 맞으면 1 아니면 0
	 */
	public int selectCnt(UserTb user);

	/**
	 * id를 이용하여 nick을 조회한다
	 * 
	 * @param user - 조회하려는 회원의 id를 가진 DTO객체
	 * @return 조회된 nick
	 */
	public String selectNickByUser(String user);

	/**
	 * id를 이용하여 userno을 조회한다
	 * 
	 * @param user - 조회하려는 회원의 id를 가진 DTO객체
	 * @return 조회된 userno
	 */
	public String selectUserNoByUser(String user);

	/**
	 * id를 이용하여 userLv을 조회한다
	 * 
	 * @param user - 조회하려는 회원의 id를 가진 DTO객체
	 * @return 조회된 userLv
	 */
	public String selectUserLvByUser(String user);
	
	/**
	 * DB에 저장된 암호화 비밀번호 확인
	 * @param user
	 * @return
	 */
	public String gerUserPw(UserTb user);

	/**
	 * 소셜 회원 가입
	 * @param user
	 */
	public void insertKakaoMember(UserTb user);

	/**
	 * 이미 존재하는 이메일인지 확인
	 * @param user
	 * @return
	 */
	public int selectCntByEmail(UserAuth user);

	/**
	 * 이메일인증위한 고객이메일/인증키값
	 * @param user
	 */
	public void createAuthKey(UserAuth user);

	/**
	 * 이메일 인증 확인
	 * @param email
	 */
	public void userAuth(String email);




}
