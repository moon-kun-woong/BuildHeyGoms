package com.application.BuildHeyGoms;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect	
public class LoggingAdvice {

	private static Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);

	/*
	@Around("execution(void com.spring.training.*.service.*.*(..))")
	public void logginServiceMethodRunningTime(ProceedingJoinPoint pjp) throws Throwable {

		long startTime = System.currentTimeMillis();
		pjp.proceed();
		long endTime = System.currentTimeMillis();
		logger.info(pjp.getSignature().getName() +  " / " + (endTime-startTime) + "s" );

	}
	*/
	
	
	

}
