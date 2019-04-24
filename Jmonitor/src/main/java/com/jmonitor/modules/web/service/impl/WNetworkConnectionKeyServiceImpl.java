package com.jmonitor.modules.web.service.impl;

import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.entity.NetworkConnectionKey;
import com.jmonitor.modules.sys.entity.Pods;
import com.jmonitor.modules.sys.entity.Servers;
import com.jmonitor.modules.sys.mapper.NetworkConnectionKeyMapper;
import com.jmonitor.modules.sys.request.NetParm;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.jmonitor.modules.sys.service.INetworkConnectionKeyService;
import com.jmonitor.modules.sys.service.IPodsService;
import com.jmonitor.modules.sys.service.IServersService;
import com.jmonitor.modules.web.entity.ServerEntity;
import com.jmonitor.modules.web.service.WNetworkConnectionKeyService;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Console;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xujinma
 * @since 2019-03-04
 */
@Service
public class WNetworkConnectionKeyServiceImpl extends ServiceImpl<NetworkConnectionKeyMapper, NetworkConnectionKey> implements WNetworkConnectionKeyService {
	@Autowired
	private IServersService serversServiceImpl;
	
	@Autowired
	private IPodsService podsServiceImpl;
	
	@Autowired
	private ILoadbalancersService loadbalancersService;
	
	@Override
	public List<ServerEntity> selectServerInfo() {
		List<Servers> servers = serversServiceImpl.lambdaQuery().select(Servers::getServerid,Servers::getServername).eq(Servers::getStatus, "Running").list();
		List<ServerEntity> ls = servers.stream().map(s->{
			ServerEntity se=new ServerEntity();
			se.setKeyId(s.getServerid());
			se.setName(s.getServername());
			se.setType("server");
			return se;
				}).collect(Collectors.toList());
		
		List<Pods> pods = podsServiceImpl.lambdaQuery().select(Pods::getPodid,Pods::getName).eq(Pods::getPhase, "Running").ne(Pods::getStatus, "invalid").list();
		List<ServerEntity> lp = pods.stream().map(p->{
			ServerEntity se=new ServerEntity();
			se.setKeyId(p.getPodid());
			se.setName(p.getName());
			se.setType("pods");
			return se;
				}).collect(Collectors.toList());
		
		List<Loadbalancers> loadbalancers = loadbalancersService.lambdaQuery().select(Loadbalancers::getLoadbalancerid,Loadbalancers::getLoadbalancername).eq(Loadbalancers::getStatus, "active").list();
		List<ServerEntity> ll = loadbalancers.stream().map(l->{
			ServerEntity se=new ServerEntity();
			se.setKeyId(l.getLoadbalancerid());
			se.setName(l.getLoadbalancername());
			se.setType("loadbalancers");
			return se;
				}).collect(Collectors.toList());
	
		ArrayList<ServerEntity> lll = CollUtil.newArrayList();
		lll.addAll(ll);
		lll.addAll(ls);
		lll.addAll(lp);
		return lll;
	}

	@Override
	@Transactional
	public void insertNetConnect(List<String> keyIds) {
		List<NetworkConnectionKey> collect = keyIds.stream().map(k->{
			NetworkConnectionKey nc=new NetworkConnectionKey();
			nc.setKeyId(k);
			nc.setStatus(true);
			return nc;
		}).collect(Collectors.toList());
		this.saveBatch(collect);
	}

	@Override
	@Transactional
	public void delNetConnect(List<String> keyIds) {
		this.lambdaUpdate().in(NetworkConnectionKey::getKeyId, keyIds).remove();
	}


}
