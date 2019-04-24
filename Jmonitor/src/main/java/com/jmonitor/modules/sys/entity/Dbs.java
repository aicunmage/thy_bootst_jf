package com.jmonitor.modules.sys.entity;

import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
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
 * @since 2019-02-18
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Dbs extends Model<Loadbalancers> {

    private static final long serialVersionUID = 1L;

    private String guid;

    private String databaseid;

    private String status;

    private LocalDateTime createtime;

    private String regionid;

    private String zoneid;

    private String description;

    private String networktype;

    private String engine;

    @TableField("engineVersion")
    private String engineVersion;

    private LocalDateTime expiretime;

    private String dbtype;

    private String dbclass;

    private String lockmode;

    private String lockreason;

    private String masterinstanceid;

    private String md5;


}
