package com.jmonitor.modules.sys.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
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
public class Loadbalancers extends Model<Loadbalancers> {

    private static final long serialVersionUID = 1L;

    private String guid;

    @TableField("loadbalancerid")
    private String loadbalancerid;

    private String loadbalancername;

    private String privateip;

    private String publicip;

    private String regionid;

    private String masterzoneid;

    private String slavezoneid;

    private String status;

    private LocalDateTime createtime;

    private String md5;


    @Override
    protected Serializable pkVal() {
        return this.guid;
    }

}
