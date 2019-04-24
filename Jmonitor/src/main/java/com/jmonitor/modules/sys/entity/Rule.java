package com.jmonitor.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.time.LocalDateTime;
import com.jmonitor.common.vo.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_rule")
public class Rule extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * 组id
     */
    private String groupId;

    /**
     * 正则
     */
    private String math;

    /**
     * 展示用名
     */
    private String name;

    /**
     * 规则对应服务器类型
     */
    private Integer ruleType;


}
