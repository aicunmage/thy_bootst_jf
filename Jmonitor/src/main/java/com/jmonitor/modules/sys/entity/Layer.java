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
@TableName("sys_layer")
public class Layer extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * 层级名称
     */
    private String name;

    /**
     * 展示名称
     */
    private Integer sort;



}
