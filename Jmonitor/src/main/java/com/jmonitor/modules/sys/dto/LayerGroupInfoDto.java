package com.jmonitor.modules.sys.dto;

import java.util.List;

import lombok.Data;

@Data
public class LayerGroupInfoDto {
	
    private String layerName;
	
	private String layerId;
	
	private List<GroupInfoDto> groupInfoDtos;

}
