package com.jmonitor.modules.sys.service.impl;

import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.mapper.LoadbalancersMapper;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-09
 */
@Service
public class LoadbalancersServiceImpl extends ServiceImpl<LoadbalancersMapper, Loadbalancers> implements ILoadbalancersService {

}
