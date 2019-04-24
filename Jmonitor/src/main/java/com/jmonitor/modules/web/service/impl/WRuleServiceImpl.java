package com.jmonitor.modules.web.service.impl;

import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.mapper.RuleMapper;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.web.service.WRuleService;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
@Service
public class WRuleServiceImpl extends ServiceImpl<RuleMapper, Rule> implements WRuleService {

	@Override
	@Transactional
	public void insertRule(RuleParm ruleParm) {
		ruleParm.setCreateUser("xjm");
		ruleParm.setUpdateUser("xjm");
		boolean save = this.save(ruleParm);
	}

	@Override
	@Transactional
	public void updateRule(RuleParm ruleParm) {
		Rule rule = this.getById(ruleParm.getId());
		CopyOptions copyOptions = CopyOptions.create().setIgnoreNullValue(false).setIgnoreCase(true)
		.setIgnoreProperties("id","createUser","createTime","updateUser","updateTime");
		BeanUtil.copyProperties(ruleParm, rule, copyOptions);
//		BeanUtil.copyProperties(ruleParm, rule, "id","createUser","createTime","updateUser","updateTime");
		this.updateById(rule);
	}

	
}
