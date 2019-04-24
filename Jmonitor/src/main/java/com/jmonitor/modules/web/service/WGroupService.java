package com.jmonitor.modules.web.service;

import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.request.GroupParm;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
public interface WGroupService extends IService<Group> {

	void insertGroup(GroupParm groupParm);

	void updateGroup(GroupParm groupParm);

}
