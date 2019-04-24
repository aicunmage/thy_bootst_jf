package com.jmonitor.modules.sys.request;


import java.util.List;

import com.jmonitor.common.vo.Convert;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@ApiModel
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class DataTableRequest {
	private String action;
	
	private List<GroupParm> data;
    
}
