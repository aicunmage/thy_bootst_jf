package com.jmonitor.modules.sys.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xujinma
 * @since 2019-01-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Pods extends Model<Pods> {

    private static final long serialVersionUID = 1L;

    private String guid;

    private String podid;

    private String name;

    private String clustername;

    private String namespace;

    private String status;

    private String podip;

    private String hostip;

    private String phase;

    private String reason;

    private LocalDateTime createtime;

    private LocalDateTime starttime;

    private LocalDateTime deletetime;

    private String md5;


    @Override
    protected Serializable pkVal() {
        return this.guid;
    }

}
