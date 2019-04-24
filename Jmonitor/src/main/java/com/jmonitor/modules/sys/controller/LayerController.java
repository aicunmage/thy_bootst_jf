package com.jmonitor.modules.sys.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.influxdb.dto.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.jmonitor.common.enums.ErrorCodeEnum;
import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.sys.dto.GroupInfoDto;
import com.jmonitor.modules.sys.dto.GroupTreeDTO;
import com.jmonitor.modules.sys.dto.LayerGroupInfoDto;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.util.ApiAssert;
import com.jmonitor.util.InfluxServiceUtil;

import cn.hutool.core.collection.CollUtil;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
@Slf4j
@RestController
@RequestMapping("/sys/layer")
public class LayerController extends SuperController {
	
	@Autowired
	private ILayerService layerServiceImpl;
	
	@ApiOperation(value = "查询所有分组信息")
    @GetMapping
	public ApiResponses<List<LayerGroupInfoDto>> selectGroup() {
		
		List<LayerGroupInfoDto> infos = layerServiceImpl.selectGroup();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, infos);
		return success(infos);
	}
	
	@ApiOperation(value = "查询所有分组信息关系")
    @GetMapping(value="/relation")
	public ApiResponses<List<HashMap<String, Object>>> selectGroupRelation() {
		
		List<HashMap<String, Object>> infos = layerServiceImpl.selectGroupRelation();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, infos);
		return success(infos);
	}
	
	@ApiOperation(value = "资产查询")
    @GetMapping(value="/assets")
	public ApiResponses selectAssets() {
		List<HashMap<String, Object>> countMap = layerServiceImpl.selectAssets();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, countMap);
		return success(countMap);
	}
	
	@ApiOperation(value = "并发数量查询")
    @GetMapping(value="/connect")
	public ApiResponses<List> selectNetworkConnections() {
		
		List<HashMap<String, Object>> connections = new ArrayList<HashMap<String,Object>>();
		try {
			connections = layerServiceImpl.selectNetworkConnections();
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
//		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, connections);
		return success(connections);
	}
	
	@ApiOperation(value = "负载资源topN查询")
    @GetMapping(value="/topncpu")
	public ApiResponses<List<HashMap<String, Object>>> selectTopNCpuUsedPercent() {
		List<HashMap<String, Object>> selectTopNCpuUsedPercent = layerServiceImpl.selectTopNCpuUsedPercent();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, selectTopNCpuUsedPercent);
		return success(selectTopNCpuUsedPercent);
	}
	
	@ApiOperation(value = "cup整体负载查询")
    @GetMapping(value="/meancpu")
	public ApiResponses<List<HashMap<String, Object>>> selectMeanCpuUsedPercent() {
		List<HashMap<String, Object>> selectMeanCpuUsedPercent = layerServiceImpl.selectMeanCpuUsedPercent();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, selectMeanCpuUsedPercent);
		return success(selectMeanCpuUsedPercent);
	}
	
	@ApiOperation(value = "内存整体负载查询")
    @GetMapping(value="/meanmemory")
	public ApiResponses<List<HashMap<String, Object>>> selectMeanMemoryUsedPercent() {
		List<HashMap<String, Object>> selectMeanMemoryUsedPercent = layerServiceImpl.selectMeanMemoryUsedPercent();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, selectMeanMemoryUsedPercent);
		return success(selectMeanMemoryUsedPercent);
	}
	
	@ApiOperation(value = "告警资源查询")
    @GetMapping(value="/dangercpu")
	public ApiResponses<List<HashMap<String, Object>>> selectDangerCpu() {
		List<HashMap<String, Object>> selectDangerCpu = layerServiceImpl.selectDangerCpu();
		ApiAssert.notEmpty(ErrorCodeEnum.RETURN_FAILE, selectDangerCpu);
		return success(selectDangerCpu);
	}
}

