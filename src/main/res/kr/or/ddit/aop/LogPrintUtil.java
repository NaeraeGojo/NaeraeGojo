package kr.or.ddit.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

// 빈등록 시킴
// <bean name="logPrintUtil" class="kr.or.ddit.aop.LogPrintUtil">
// -><bean name="logPrintAspect" class="kr.or.ddit.aop.LogPrintUtil">
@Component("logPrintAspect")
public class LogPrintUtil {
	//이제 로그 찍어주는 코들르 얘가 가지고 있으면 됨
	@Loggable
	public static Logger logger;
	
	// 스프링 프레임 워크에서 Advice(시점, 언제) : 메서드 호출 전
	//									 메서드 종료 후
	//									 메서드 호출에 의한 익셉션 발생 후
	//									 메서드 호출/종료 페어(둘다)
	
	// joinpoint : org.aspectj.
	public void theWholeJPCallBefore(JoinPoint joinPoint){
		String className = joinPoint.getTarget().getClass().getName();
		// 조인포인트 이름 = 메서드 이름
		String joinpointName = joinPoint.getSignature().getName();
		
		logger.debug("weaving target class : {} - target method : {} 콜백됩니다."
				,className, joinpointName);
	}

	// 종료후 콜백
	public void theWholeJPCallAfter(JoinPoint joinPoint){
		String className = joinPoint.getTarget().getClass().getName();
		// 조인포인트 이름 = 메서드 이름
		String joinpointName = joinPoint.getSignature().getName();
		
		logger.debug("weaving target class : {} - target method : {} 종료됩니다."
				,className, joinpointName);
	}
	
	// 예외 발생 후 콜백 , 익셉션 정보도 얻을 수 있음
	// advice 설정시의 throwing="ex" 속성에 변수이름 넣어줌
	public void theWholeJPCallThrowsAfter(JoinPoint joinPoint, Exception ex){
		String className = joinPoint.getTarget().getClass().getName();
		// 조인포인트 이름 = 메서드 이름
		String joinpointName = joinPoint.getSignature().getName();
		
		logger.debug("weaving target class : {} - target method : {} - {} 익셉션이 발생되었습니다"
				,className, joinpointName, ex.getMessage());
	}
	
	// 호출 전후(페어) 때는 ProceedingJoinPoint가 사용된다.
	public Object theWholeJPCallBeforeNAfter(ProceedingJoinPoint joinPoint) throws Throwable{
		String className = joinPoint.getTarget().getClass().getName();
		// 조인포인트 이름 = 메서드 이름
		String joinpointName = joinPoint.getSignature().getName();
		
		logger.debug("weaving target class : {} - target method : {} 호출 후...."
				,className, joinpointName);
		
		// 여기가 구분자 얘 위로는 호출하고 , 얘 때는 실제 그 메서드가 호출, 얘 밑으로는 종료후 위빙되는 어스펙트
		Object returnValue = joinPoint.proceed();
		
		logger.debug("weaving target class : {} - target method : {} 종료 됩니다."
				,className, joinpointName);
		
		return returnValue;
	}
	
}
