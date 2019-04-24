package com.jmonitor.modules.sys.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.time.LocalDateTime;
import com.jmonitor.common.vo.BaseModel;
import com.jmonitor.common.vo.TreeNode;

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
public class GroupTreeDTO extends TreeNode {

    private static final long serialVersionUID = 1L;

    private String layerId;

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


}
