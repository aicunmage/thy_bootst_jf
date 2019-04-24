package com.jmonitor.modules.sys.request;


import com.jmonitor.modules.sys.entity.Rule;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@ApiModel
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class RuleParm extends Rule{

}
