package com.jmonitor.modules.web.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.influxdb.dto.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jmonitor.common.enums.ErrorCodeEnum;
import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.CacheConstant;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.sys.dto.GroupInfoDto;
import com.jmonitor.modules.sys.dto.GroupTreeDTO;
import com.jmonitor.modules.sys.dto.LayerGroupInfoDto;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.modules.sys.service.impl.LayerServiceImpl;
import com.jmonitor.modules.web.entity.User;
import com.jmonitor.util.ApiAssert;
import com.jmonitor.util.InfluxServiceUtil;
import com.jmonitor.util.JCacheUtil;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.thread.ThreadUtil;
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
@RequestMapping(value="/jmonitor")
public class PageController extends SuperController {
	
	@Autowired
	private ILayerService layerServiceImpl;
	
	@ApiOperation(value = "跳转到index页")
    @GetMapping(value="/index")
	public ModelAndView returnToIndex(ModelAndView model) {
		Object user = JCacheUtil.getCache("user");
		model.addObject("user", user);
		model.setViewName("index");
		return model;
	}
	
	@ApiOperation(value = "跳转到pageContent页")
    @GetMapping(value="/pageContent")
	public ModelAndView returnTopageContent(ModelAndView model) {
//		List<HashMap<String, Object>> networkconnections = layerServiceImpl.selectNetworkConnections();
//		List<HashMap<String, Object>> meancpuL = layerServiceImpl.selectMeanCpuUsedPercent();
//		List<HashMap<String, Object>> meanmemory = layerServiceImpl.selectMeanMemoryUsedPercent();
		List<HashMap<String, Object>> networkconnections = (List<HashMap<String, Object>>) JCacheUtil.getCache(CacheConstant.CACHE_NETWORKCON);
		if(CollUtil.isEmpty(networkconnections)) {
			networkconnections = layerServiceImpl.selectNetworkConnections();
			JCacheUtil.setCacheByTime(CacheConstant.CACHE_NETWORKCON, networkconnections,DateUnit.WEEK.getMillis());
		}
		List<HashMap<String, Object>> meancpuL = (List<HashMap<String, Object>>) JCacheUtil.getCache(CacheConstant.CACHE_CPU);
		if(CollUtil.isEmpty(meancpuL)) {
			meancpuL = layerServiceImpl.selectMeanCpuUsedPercent();
			JCacheUtil.setCacheByTime(CacheConstant.CACHE_CPU, meancpuL,DateUnit.WEEK.getMillis());
		}
		List<HashMap<String, Object>> meanmemory = (List<HashMap<String, Object>>) JCacheUtil.getCache(CacheConstant.CACHE_MEMORY);
		if(CollUtil.isEmpty(meanmemory)) {
			meanmemory = layerServiceImpl.selectMeanMemoryUsedPercent();
			JCacheUtil.setCacheByTime(CacheConstant.CACHE_MEMORY, meanmemory,DateUnit.WEEK.getMillis());
		}
		
		model.addObject("influx_connect", CollUtil.isEmpty(networkconnections)?"0":Convert.toLong(networkconnections.get(0).get("value"), 0L));
		model.addObject("influx_meancpu", CollUtil.isEmpty(meancpuL)?"0":Convert.toLong(meancpuL.get(0).get("value")));
		model.addObject("influx_meanmemory", CollUtil.isEmpty(meanmemory)?"0":Convert.toLong(meanmemory.get(0).get("value")));
		model.setViewName("pageContent");
		return model;
	}
	
}

