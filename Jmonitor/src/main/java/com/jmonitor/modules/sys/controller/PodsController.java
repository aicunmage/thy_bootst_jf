package com.jmonitor.modules.sys.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.entity.Pods;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.jmonitor.modules.sys.service.IPodsService;

import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;

/**
 * @author xujinma
 * @since 2019-01-09
 */
@Slf4j
@Api(value = "a-ceshi")
@RestController
@RequestMapping("/sys/pods")
public class PodsController {
	
	@Autowired
	private IPodsService iPodsService;
	
	@Autowired
	private ILoadbalancersService iLoadbalancersService;
	
	@GetMapping
	public Map<String,Object> test() {
		Map<String,Object> m=new HashMap();
		List<Pods> list = iPodsService.list();
		List<Loadbalancers> list2 = iLoadbalancersService.list();
		m.put("Pods", list);
		m.put("Loadbalancers", list2);
		return m;
	}

}

