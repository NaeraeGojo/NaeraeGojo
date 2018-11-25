package kr.or.ddit.aop;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.ReflectionUtils.FieldCallback;

// 빈으로 자동 등록
// <bean name="loggerInjector" class="kr.or.ddit.aop.LoggerInjector">

// BeanPostProcessor : 스프링 프레임웍은 default로 BeanPostProcessor를
//						구현한 특정 빈클래스를 활용한다
//						(설정파일에 선언된 빈의 인스턴스 화 시에 활용) 빈이 10개면 10번 활용
@Component
public class LoggerInjector implements BeanPostProcessor {

	
	// 금번 인스턴스화를 진행할 빈 클래스 내 전역변수들 중에서
	// @Loggable이 전역변수 상단에 선언된 대상이 존재하는지 검증하고 
	// 존재하면 해당 전역변수에 LoggerFactory 인스턴스를 주입.
	@Override
	public Object postProcessBeforeInitialization(final Object beanObject, String beanName)
			throws BeansException {
		// 설정 파일에 선언된 개별 빈의 인스턴스 시작 전에 매번 콜백
		// org.springframework.utils
		ReflectionUtils.doWithFields(beanObject.getClass(), new FieldCallback() {
			// 취득한 전역변수들을 순환하면서 콜백
			@Override
			public void doWith(Field field) throws IllegalArgumentException,
					IllegalAccessException {
				// 전역변수 private 접근 지정자인경우 접근하기 위해서
				ReflectionUtils.makeAccessible(field);
				// @Loggable 이 붙어있는 경우 if문으로 진입
				if(field.getAnnotation(Loggable.class) != null){
					Logger logger = LoggerFactory.getLogger(beanObject.getClass());
					field.set(beanObject, logger);
				}
			}
		});
		return beanObject;
	}

	
	// Object : 이번에 인스턴스화 된 빈 오브젝트
	// String : 이번에 인스턴스 화 된 빈 클래스의 이름
	@Override
	public Object postProcessAfterInitialization(Object beanObject, String beanName)
			throws BeansException {
		//설정 파일에 선언된 개별 빈의 인스턴스 종료 후에 매번 콜백
		
		// null 리턴하면 인스터스화 취소함 -> 오브젝트 리턴시켜야함
		return beanObject;
	}
	
}
