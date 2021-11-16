package web.user.service.face;

import javax.servlet.http.HttpServletRequest;

import web.user.dto.UserTb;
import web.user.dto.Social_account;
import web.user.dto.UserAuth;

public interface LoginService {

	/**
	 * id pw가 맞는지 비교한다
	 * @param user - id pw가 담긴 DTO
	 * @return 일치하면 true 아니면 false
	 */
	public boolean login(UserTb member);

	public void naverLogin(Social_account social);

	public void googleLogin(Social_account social);

	public void findId(UserTb user);

	public void findPw(UserTb user);

	/**
	 * 회원가입
	 * @param user - 신규 고객 정보가 들어있는 DTO
	 * @param req - 고객의 관심분야가 들어있음
	 * @return 
	 */
	public boolean join(UserTb user, HttpServletRequest req);

	/**
	 * 아이디 중복 체크
	 * @param id - 고객이 입력한 아이디
	 * @return
	 */
	public int userIdCheck(String id);

	/**
	 * 닉네임 중복 체크
	 * @param nick - 고객이 입력한 닉네임
	 * @return
	 */
	public int userNickCheck(String nick);

	/**
	 * 회원의 닉네임 조회
	 * 
	 * @param user - 닉네임을 조회하려는 사용자 정보
	 * @return 사용자의 닉네임
	 */
	public String getNick(String user);

	/**
	 * 회원의 유저번호 조회
	 * @param user - 유저번호를 조회하려는 사용자 정보
	 * @return 사용자의 유저번호
	 */
	public String getUserNo(String user);

	/**
	 * 회원의 레벨 조회
	 * @param user - 유저번호를 조회하려는 사용자 정보
	 * @return 사용자의 레벨
	 */
	public String getUserLv(String user);
	/**
	 * kakao아이디가 존재하는지 확인
	 * @param user - 고객의 아이디가 담긴 DTO객체
	 * @return
	 */
	public boolean getKakaoId(UserTb user);
	
	/**
	 * 카카오 소셜 로그인
	 * @param user - 기본 정보가 들어있음
	 * @return
	 */
	public boolean kakaoLogin(UserTb user);

	/**
	 * 회원가입
	 * @param user - kakao 신규 고객 정보가 들어있는 DTO
	 * @param req - 고객의 관심분야가 들어있음
	 * @return 
	 */
	public boolean KakaoJoin(UserTb snsUser, HttpServletRequest req);

	/**
	 * 메일 전송
	 * @param user - 입력받은 이메일
	 * @return 
	 */
	public boolean create(UserAuth user);

	/**
	 * 인증확인했을 때 요청확인
	 * @param email
	 */
	public void userAuth(String email);





}
