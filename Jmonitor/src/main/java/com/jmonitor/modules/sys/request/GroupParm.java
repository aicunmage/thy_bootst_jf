package com.jmonitor.modules.sys.request;


import com.jmonitor.common.vo.Convert;
import com.jmonitor.modules.sys.entity.Group;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@ApiModel
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class GroupParm extends Group{
	private String action;
}
