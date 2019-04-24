package com.jmonitor.modules.web.service;

import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.request.RuleParm;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
public interface WRuleService extends IService<Rule> {

	void insertRule(RuleParm ruleParm);

	void updateRule(RuleParm ruleParm);

}
