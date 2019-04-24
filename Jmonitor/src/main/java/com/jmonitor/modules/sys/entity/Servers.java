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
public class Servers extends Model<Servers> {

    private static final long serialVersionUID = 1L;

    private String guid;

    private String serverid;

    private String servername;

    private String status;

    private Integer cpu;

    private Integer memory;

    private String privateip;

    private String publicip;

    private String dyncip;

    private String regionid;

    private String zoneid;

    private String ostype;

    private String osname;

    private LocalDateTime creationtime;

    private LocalDateTime starttime;

    private LocalDateTime expiredtime;

    private String md5;


    @Override
    protected Serializable pkVal() {
        return this.guid;
    }

}
