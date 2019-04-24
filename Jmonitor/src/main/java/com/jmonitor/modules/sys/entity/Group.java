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
@TableName("sys_group")
public class Group extends BaseModel {

    private static final long serialVersionUID = 1L;

    private String layerId;

    /**
     * 父id
     */
    private String parentId;

    /**
     * 组名
     */
    private String name;

    /**
     * 默认展示图片类型
     */
    private Integer defPicType;

    /**
     * 是否合并
     */
    private Boolean isMerge;

    /**
     * 合并用命类型
     */
    private Integer mgeNameType;

    /**
     * 合并名
     */
    private String mgeName;

    /**
     * 顺序
     */
    private Integer sort;

    /**
     * 类型
     */
    private String type;

}
