/*
 * Copyright (c) 2018-2022 Caratacus, (caratacus@qq.com).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without riction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package com.jmonitor.util;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.MissingServletRequestParameterException;

import com.jmonitor.common.response.FailedResponse;
import com.jmonitor.common.vo.ErrorCode;
import com.jmonitor.common.wrapper.ResponseWrapper;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * response输出工具类
 *
 * @author Caratacus
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Slf4j
public abstract class ResponseUtils {



    /**
     * 获取异常信息
     *
     * @param exception
     * @return
     */
    public static FailedResponse.FailedResponseBuilder exceptionMsg(FailedResponse.FailedResponseBuilder failedResponseBuilder, Exception exception) {
        if (exception instanceof MethodArgumentNotValidException) {
            StringBuilder builder = new StringBuilder("校验失败:");
            List<ObjectError> allErrors = ((MethodArgumentNotValidException) exception).getBindingResult().getAllErrors();
            allErrors.stream().findFirst().ifPresent(error -> {
                builder.append(((FieldError) error).getField()).append("字段规则为").append(error.getDefaultMessage());
                failedResponseBuilder.msg(error.getDefaultMessage());
            });
            failedResponseBuilder.exception(builder.toString());
            return failedResponseBuilder;
        } else if (exception instanceof MissingServletRequestParameterException) {
            StringBuilder builder = new StringBuilder("参数字段");
            MissingServletRequestParameterException ex = (MissingServletRequestParameterException) exception;
            builder.append(ex.getParameterName());
            builder.append("校验不通过");
            failedResponseBuilder.exception(builder.toString()).msg(ex.getMessage());
            return failedResponseBuilder;
        } else if (exception instanceof MissingPathVariableException) {
            StringBuilder builder = new StringBuilder("路径字段");
            MissingPathVariableException ex = (MissingPathVariableException) exception;
            builder.append(ex.getVariableName());
            builder.append("校验不通过");
            failedResponseBuilder.exception(builder.toString()).msg(ex.getMessage());
            return failedResponseBuilder;
        } else if (exception instanceof ConstraintViolationException) {
            StringBuilder builder = new StringBuilder("方法.参数字段");
            ConstraintViolationException ex = (ConstraintViolationException) exception;
            Optional<ConstraintViolation<?>> first = ex.getConstraintViolations().stream().findFirst();
            if (first.isPresent()) {
                ConstraintViolation<?> constraintViolation = first.get();
                builder.append(constraintViolation.getPropertyPath().toString());
                builder.append("校验不通过");
                failedResponseBuilder.exception(builder.toString()).msg(constraintViolation.getMessage());
            }
            return failedResponseBuilder;
        }

        failedResponseBuilder.exception(TypeUtils.castToString(exception));
        return failedResponseBuilder;
    }


    /**
     * 获取Response
     *
     * @return
     */
    public static ResponseWrapper getWrapper(HttpServletResponse response, ErrorCode errorCode) {
        return new ResponseWrapper(response, errorCode);
    }
}
