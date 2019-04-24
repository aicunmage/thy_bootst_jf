package com.jmonitor.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
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
 * @since 2019-03-25
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dict")
public class Dict extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * code
     */
    private String code;

    /**
     * key值
     */
    private String name;
    
    

    private String value;

    /**
     * 备注
     */
    private String remark;



}
