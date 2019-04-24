package com.jmonitor.modules.web.service.impl;

import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.mapper.GroupMapper;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.web.service.WGroupService;

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
public class WGroupServiceImpl extends ServiceImpl<GroupMapper, Group> implements WGroupService {

	@Override
	@Transactional
	public void insertGroup(GroupParm groupParm) {
		groupParm.setCreateUser("xjm");
		groupParm.setUpdateUser("xjm");
		boolean save = this.save(groupParm);
	}

	@Override
	@Transactional
	public void updateGroup(GroupParm groupParm) {
		Group group = this.getById(groupParm.getId());
		CopyOptions copyOptions = CopyOptions.create().setIgnoreNullValue(false).setIgnoreCase(true)
				.setIgnoreProperties("id","createUser","createTime","updateUser","updateTime");
		BeanUtil.copyProperties(groupParm, group,copyOptions);
		this.updateById(group);
	}
}
