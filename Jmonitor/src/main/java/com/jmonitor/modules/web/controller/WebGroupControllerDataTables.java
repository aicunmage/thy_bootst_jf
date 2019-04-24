package com.jmonitor.modules.web.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.config.exception.JmonitorException;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.request.DataTableRequest;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.sys.service.IGroupService;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.modules.sys.service.IRuleService;

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
@RequestMapping("/jmonitor/datatables/group")
public class WebGroupControllerDataTables extends SuperController {
	@Autowired
	private ILayerService layerServiceImpl;
	
	@Autowired
	private IGroupService groupServiceImpl;
	
	@Autowired
	private IRuleService ruleServiceImpl;
	
	@ApiOperation(value = "跳转到group页")
    @GetMapping
	public ModelAndView returnTolayer(ModelAndView model) {
		List<Layer> layers = layerServiceImpl.lambdaQuery().eq(Layer::getIsdelete, "0").orderByAsc(Layer::getSort).list();
		model.addObject("layers", layers);
		model.setViewName("/group/group");
		return model;
	}
	
	@ApiOperation(value = "查询分组信息")
	@GetMapping("/one")
	@ResponseBody
	public HashMap<String, Object> selectGroup(@RequestParam(value = "layerId") String layerId) {
		List<Group> list = groupServiceImpl.lambdaQuery().eq(Group::getIsdelete, "0").eq(Group::getLayerId, layerId).orderByAsc(Group::getLayerId,Group::getSort).list();
		HashMap<String, Object> groups = CollUtil.newHashMap();
		groups.put("data", list);
		return groups;
	}
	
	@ApiOperation(value = "新增及规则和图片")
    @GetMapping(value="/rule")
	@ResponseBody
	public HashMap<String, Object> selectRuleInfo(@RequestParam(value = "id") String id) {
		List<Rule> list = ruleServiceImpl.lambdaQuery().eq(Rule::getGroupId, id).eq(Rule::getIsdelete, "0").list();
		HashMap<String, Object> rules = CollUtil.newHashMap();
		rules.put("data", list);
		log.info(JSON.toJSONString(rules));
		return rules;
	}
	
	@ApiOperation(value = "增删改组信息")
    @PostMapping
	@ResponseBody
	@Transactional
	public ApiResponses cudGroup(@ModelAttribute GroupParm data) {
		String action = data.getAction();
		if(StrUtil.equals("remove", action)) {
			//删除操作  删除该组下的所有规则以及组
			Console.log("remove:{}",JSON.toJSONString(data));
			String groupId = data.getId();
			groupServiceImpl.lambdaUpdate().eq(Group::getId, groupId).set(Group::getIsdelete, "1").update();
			ruleServiceImpl.lambdaUpdate().eq(Rule::getGroupId, groupId).set(Rule::getIsdelete, "1").update();
		}else if(StrUtil.equals("create", action)) {
			Console.log("create:{}",JSON.toJSONString(data));
		}else if(StrUtil.equals("edit", action)) {
			Console.log("edit:{}",JSON.toJSONString(data));
		}else {
			throw new JmonitorException("组信息的cru异常");
		}
		return success();
	}
}

