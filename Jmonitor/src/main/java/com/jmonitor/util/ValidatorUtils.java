package com.jmonitor.util;


import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import com.jmonitor.config.exception.JmonitorException;

import java.util.Set;

/**
 * hibernate-validator校验工具类
 *
 * 参考文档：http://docs.jboss.org/hibernate/validator/5.4/reference/en-US/html_single/
 *
 * @author xujinma
 */
public class ValidatorUtils {
    private static Validator validator;

    static {
        validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    /**
     * 校验对象
     * @param object        待校验对象
     * @param groups        待校验的组
     * @throws RRException  校验不通过，则报RmisException异常
     */
    public static void validateEntity(Object object, Class<?>... groups)
            throws JmonitorException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object, groups);
        if (!constraintViolations.isEmpty()) {
            StringBuilder msg = new StringBuilder();
            for(ConstraintViolation<Object> constraint:  constraintViolations){
                msg.append(constraint.getMessage()).append(" ");
            }
            throw new JmonitorException(msg.toString());
        }
    }
}
