package com.jmonitor.config.exception;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.jmonitor.util.BaseResultUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * 异常处理器
 * 
 * @author xujinma
 */
@Slf4j
@RestControllerAdvice
public class JmonitorExceptionHandler {
	
	/**
	 * 自定义异常
	 */
	@ExceptionHandler(JmonitorException.class)
	public BaseResultUtil handleRRException(JmonitorException e){
		log.error(e.getMessage(), e);
		return BaseResultUtil.getFailResponse(e.getCode(), e.getMessage());
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public BaseResultUtil handleDuplicateKeyException(DuplicateKeyException e){
		log.error(e.getMessage(), e);
		return BaseResultUtil.getFailResponse("数据库中已存在该记录");
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public BaseResultUtil handleMAVException(MethodArgumentNotValidException e){
		String errorMessage = e.getBindingResult().getFieldError().getDefaultMessage();
		log.error(e.getMessage(), e);
		return BaseResultUtil.getFailResponse(errorMessage);
	}
	@ExceptionHandler(Exception.class)
	public BaseResultUtil handleException(Exception e){
		return BaseResultUtil.getFailResponse(e.getMessage());
	}
}
