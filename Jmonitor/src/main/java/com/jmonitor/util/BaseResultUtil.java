package com.jmonitor.util;

import lombok.Data;

import java.util.Date;

import cn.hutool.http.HttpStatus;

/**
 * 返回数据
 * 
 * @author xujinma
 * @param <T>
 */
@Data
public class BaseResultUtil {
	private static final long serialVersionUID = 1L;
	
    /**
     * 返回时间
     */
	private Date resultDate = new Date();
	
	/**
	 * 返回结果码
	 */
	private int code;
	
	/**
	 * 返回信息
	 */
	private String msg;
	
	/**
	 * 返回数据
	 */
	private Object data;
	
	public static BaseResultUtil getSuccessResponse() {
		return getSuccessResponse(new Date());
	}
	
	public static BaseResultUtil getSuccessResponse(String message) {
		return getSuccessResponse(HttpStatus.HTTP_OK,message,new Date());
	}
	
	public static <T> BaseResultUtil getSuccessResponse(T data) {
		return getSuccessResponse(null,data);
	}
	
	public static <T> BaseResultUtil getSuccessResponse(String msg,T data){
		return getSuccessResponse(HttpStatus.HTTP_OK,msg,data);
	}
	
	public static <T> BaseResultUtil getSuccessResponse(int code, String msg,T data){
		BaseResultUtil response = new BaseResultUtil();
		response.setCode(code);
		response.setMsg(msg);
		response.setData(data);
		return response;
	}
	
	public static BaseResultUtil getFailResponse() {
		return getFailResponse(HttpStatus.HTTP_INTERNAL_ERROR,null);
	}
	
	public static BaseResultUtil getFailResponse(String msg) {
		return getFailResponse(HttpStatus.HTTP_INTERNAL_ERROR,msg);
	}
	
	public static BaseResultUtil getFailResponse(int code,String msg) {
		return getFailResponse(code,msg,null);
	}
	
	public static <T> BaseResultUtil getFailResponse(int code, String msg,T data) {
		BaseResultUtil response = new BaseResultUtil();
		response.setCode(code);
		response.setMsg(msg);
		response.setData(data);
		return response;
	}
}
