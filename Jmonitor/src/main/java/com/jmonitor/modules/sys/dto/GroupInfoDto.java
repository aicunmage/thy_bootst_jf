package com.jmonitor.modules.sys.dto;

import lombok.Data;

@Data
public class GroupInfoDto {
	
	private String groupId;
	
	private Boolean isMerge;
	
	private String groupShowName;
	
	private String type;
	
	private Integer sersCount;
	
	private Integer podsCount;
	
	private Integer lodsCount;
	
//	private String picPath;

}
