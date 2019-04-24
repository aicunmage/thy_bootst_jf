package com.jmonitor.modules.sys.service.impl;

import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.mapper.GroupMapper;
import com.jmonitor.modules.sys.service.IGroupService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
@Service
public class GroupServiceImpl extends ServiceImpl<GroupMapper, Group> implements IGroupService {

}
