package com.jmonitor.modules.web.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.entity.NetworkConnectionKey;
import com.jmonitor.modules.sys.entity.Pods;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.entity.Servers;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.NetParm;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.jmonitor.modules.sys.service.IPodsService;
import com.jmonitor.modules.sys.service.IServersService;
import com.jmonitor.modules.web.entity.ServerEntity;
import com.jmonitor.modules.web.service.WGroupService;
import com.jmonitor.modules.web.service.WLayerService;
import com.jmonitor.modules.web.service.WNetworkConnectionKeyService;
import com.jmonitor.modules.web.service.WRuleService;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.StrUtil;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * @author xujinma
 * @since 2019-01-21
 */
@Slf4j
@ApiOperation(value = "跳转服务")
@Controller
@RequestMapping("/jmonitor/netconnect")
public class WebNetConnectController extends SuperController {
	
	@Autowired
	private WNetworkConnectionKeyService wNetworkConnectionKeyServiceImpl;

	@ApiOperation(value = "跳转到netconnect页")
	@GetMapping
	public ModelAndView returnToNetConnect(ModelAndView model) {
		model.setViewName("netconnect/netconnect");
		return model;
	}

	@ApiOperation(value = "查询所有待选实例信息")
	@GetMapping("/list/wait")
	@ResponseBody
	public List<ServerEntity> selectWaitAll() {
		List<ServerEntity> allInfos=wNetworkConnectionKeyServiceImpl.selectServerInfo();
		List<NetworkConnectionKey> nets = wNetworkConnectionKeyServiceImpl.lambdaQuery().eq(NetworkConnectionKey::getStatus, "1").list();
		List<String> keyIds = nets.stream().map(n->n.getKeyId()).collect(Collectors.toList());
		List<ServerEntity> waitInfos = allInfos.stream().filter(i->!CollUtil.contains(keyIds, i.getKeyId())).collect(Collectors.toList());
		return waitInfos;
	}
	
	@ApiOperation(value = "查询所有待选实例信息")
	@GetMapping("/list/ok")
	@ResponseBody
	public List<ServerEntity> selectOkAll() {
		List<ServerEntity> allInfos=wNetworkConnectionKeyServiceImpl.selectServerInfo();
		List<NetworkConnectionKey> nets = wNetworkConnectionKeyServiceImpl.lambdaQuery().eq(NetworkConnectionKey::getStatus, "1").list();
		List<String> keyIds = nets.stream().map(n->n.getKeyId()).collect(Collectors.toList());
		List<ServerEntity> okInfos = allInfos.stream().filter(i->CollUtil.contains(keyIds, i.getKeyId())).collect(Collectors.toList());
		return okInfos;
	}
	
	@ApiOperation(value = "新增层级")
    @PostMapping("/add")
	@ResponseBody
	public ApiResponses<Void> insertNetConnect(@RequestBody List<String> keyIds) {
		wNetworkConnectionKeyServiceImpl.insertNetConnect(keyIds);
		return success();
	}
	
	@ApiOperation(value = "新增层级")
    @PostMapping("/del")
	@ResponseBody
	public ApiResponses<Void> delNetConnect(@RequestBody List<String> keyIds) {
		wNetworkConnectionKeyServiceImpl.delNetConnect(keyIds);
		return success();
	}
}
