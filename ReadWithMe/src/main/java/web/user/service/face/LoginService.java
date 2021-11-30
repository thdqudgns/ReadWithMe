package web.user.service.face;

import javax.servlet.http.HttpServletRequest;

import web.user.dto.UserTb;
import web.user.dto.Social_account;
import web.user.dto.Ban;
import web.user.dto.EmailAuth;
import web.user.dto.PhoneAuth;

public interface LoginService {

	/**
	 * id pw가 맞는지 비교한다
	 * @param user - id pw가 담긴 DTO
	 * @return 일치하면 true 아니면 false
	 */
	public boolean login(UserTb member);

	/**
	 * 비밀번호 찾기 위해 이메일주소(혹은 핸드폰번호)와 아이디가 일치하는지 확인
	 * @param user - 이메일,핸드폰번호,아이디가 담겨있는 DTO
	 * @return 일치하면 true 아니면 false
	 */
	public boolean findPw(UserTb user);

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
	 * 이메일 중복 체크
	 * @param email - 고객이 입력한 이메일
	 * @return
	 */	
	public int userEmailCheck(String email);

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
	public boolean create(EmailAuth user);

	/**
	 * 인증확인했을 때 요청확인
	 * @param user
	 */
	public void userAuth(UserTb user);

	/**
	 * 핸드폰 번호랑 인증번호랑 저장 
	 * @param user
	 * @param random
	 */
	public void savePhoneRegister(UserTb user, String random);

	/**
	 * 고객이 입력한 인증번호 맞는지확인 
	 * @param phoneAuth - 번호와 인증번호 들어있음
	 * @return
	 */
	public boolean phoneRegister(PhoneAuth phoneAuth);

	/**
	 * naver아이디가 존재하는지 확인
	 * @param user - 고객의 아이디가 담긴 DTO객체
	 * @return
	 */
	public boolean getNaverId(UserTb user);

	/**
	 * 임시 비밀번호를 발송
	 * @param user
	 * @return
	 */
	public void sendPwByEmail(UserTb user);

	/**
	 * 임시 비밀번호를 발송
	 * @param user
	 * @return
	 */
	public void sendPwByPhone(UserTb user);

	/**
	 * 입력받은 이메일 혹은 핸드폰 번호로 id찾기
	 * @param user
	 * @return
	 */
	public String findId(UserTb user);

	/**
	 * 입력받은 이메일주소 확인
	 * @param user
	 * @return
	 */
	public void findEmail(UserTb user);

	/**
	 * 유저 제재 상태 확인시켜주기 위함
	 * @param user_no
	 * @return
	 */
	public Ban banUser(int user_no);

	/**
	 * 현재 제재 상태인지 확인 (날짜 비교)
	 * @param user_no
	 * @return
	 */
	public boolean isBan(int user_no);





}
