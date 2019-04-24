package com.jmonitor.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jmonitor.common.vo.BaseModel;
import com.jmonitor.util.SnowFlakeUtil;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xujinma
 * @since 2019-03-04
 */
@Data
@Accessors(chain = true)
@TableName("sys_network_connection_key")
public class NetworkConnectionKey  {

    private static final long serialVersionUID = 1L;
    
    @TableId(value = "id", type = IdType.INPUT)
    @ApiModelProperty(value = "唯一标识")
    private String id = String.valueOf(SnowFlakeUtil.getFlowIdInstance().nextId());

    /**
     * key值
     */
    private String keyId;

    /**
     * 状态
     */
    private Boolean status;


}
