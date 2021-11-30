//package web.aop;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.After;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//
//@Aspect
//@Component
//public class LogAdvice {
//	
//	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
//	
//	@Before("within(web.user.controller.*)") //어느 위치에 적용시킬 것인가를 적는다. *은 클래스 와일드카드이기 때문에 face나 impl패키지까지 포함시키려면 ..으로 적어야 한다. 모든 패키지를 포함한다는 뜻이다.
//	public void logBefore(JoinPoint joinPoint) {
////		logger.info("---- BEFORE ----");
//		logger.debug("================================");
//		logger.debug("------------ START ------------");
//		logger.debug("[class] {}", joinPoint.getTarget().getClass());
//		logger.debug("[method] {}", joinPoint.getSignature().getName() + "()");
//	}
//
//	@After("within(web.user.controller.*)") //어느 위치에 적용시킬 것인가를 적는다
//	public void logAfter() {
////		logger.info("---- AFTER ----");
//		logger.debug("------------ END ------------");
//		logger.debug("================================");
//	}
//	
//	@Around("within(web.user.service..*)")
//	public Object logAround(ProceedingJoinPoint joinPoint) {
//		
//		//실행 전 시간 체크 				//@Before
//		long beforeTime = System.currentTimeMillis();
//		
//		Object obj = null;
//		try {
//			obj = joinPoint.proceed(); 		//메소드 실행. proceed로 원본 코드랑 왕래한다.
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//		
//		//실행 후 시간 체크					// @After
//		long afterTime = System.currentTimeMillis();
//		
//		logger.debug("[소요시간] {}ms", afterTime-beforeTime);
//		
//		return obj;
//		
//	}
//
//	@Before("within(web.admin.controller.*)") //어느 위치에 적용시킬 것인가를 적는다. *은 클래스 와일드카드이기 때문에 face나 impl패키지까지 포함시키려면 ..으로 적어야 한다. 모든 패키지를 포함한다는 뜻이다.
//	public void logBeforeAd(JoinPoint joinPoint) {
////		logger.info("---- BEFORE ----");
//		logger.debug("================================");
//		logger.debug("------------ START ------------");
//		logger.debug("[class] {}", joinPoint.getTarget().getClass());
//		logger.debug("[method] {}", joinPoint.getSignature().getName() + "()");
//	}
//	
//	@After("within(web.admin.controller.*)") //어느 위치에 적용시킬 것인가를 적는다
//	public void logAfterAd() {
////		logger.info("---- AFTER ----");
//		logger.debug("------------ END ------------");
//		logger.debug("================================");
//	}
//	
//	@Around("within(web.admin.service..*)")
//	public Object logAroundAd(ProceedingJoinPoint joinPoint) {
//		
//		//실행 전 시간 체크 				//@Before
//		long beforeTime = System.currentTimeMillis();
//		
//		Object obj = null;
//		try {
//			obj = joinPoint.proceed(); 		//메소드 실행. proceed로 원본 코드랑 왕래한다.
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//		
//		//실행 후 시간 체크					// @After
//		long afterTime = System.currentTimeMillis();
//		
//		logger.debug("[소요시간] {}ms", afterTime-beforeTime);
//		
//		return obj;
//		
//	}
//	
//}

























