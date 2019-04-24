package com.jmonitor.common.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jmonitor.util.SnowFlakeUtil;

import cn.hutool.core.date.DateUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author xujinma
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public abstract class BaseModel extends Convert implements Serializable{

    private static final long serialVersionUID = 1L;

    
    @TableId(value = "id", type = IdType.INPUT)
    @ApiModelProperty(value = "唯一标识")
    private String id = String.valueOf(SnowFlakeUtil.getFlowIdInstance().nextId());

    @ApiModelProperty(value = "创建者")
    private String createUser;

    @JsonFormat( pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createTime=DateUtil.date();

    @ApiModelProperty(value = "更新者")
    private String updateUser;

    @JsonFormat( pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新时间")
    private Date updateTime=DateUtil.date();

    @ApiModelProperty(value = "删除标志 默认0")
    private Integer isdelete = CommonConstant.STATUS_NORMAL;
}
