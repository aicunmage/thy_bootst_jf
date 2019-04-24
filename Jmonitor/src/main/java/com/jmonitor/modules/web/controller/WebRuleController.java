package com.jmonitor.modules.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.entity.Pods;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.entity.Servers;
import com.jmonitor.modules.sys.request.DataTableRequest;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.sys.service.IGroupService;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.jmonitor.modules.sys.service.IPodsService;
import com.jmonitor.modules.sys.service.IRuleService;
import com.jmonitor.modules.sys.service.IServersService;
import com.jmonitor.modules.web.service.WGroupService;
import com.jmonitor.modules.web.service.WLayerService;
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
@RequestMapping("/jmonitor/rule")
public class WebRuleController extends SuperController {
	@Autowired
	private WLayerService layerServiceImpl;

	@Autowired
	private WGroupService groupServiceImpl;

	@Autowired
	private WRuleService ruleServiceImpl;
	
	@Autowired
	private IServersService serversServiceImpl;
	
	@Autowired
	private IPodsService podsServiceImpl;
	
	@Autowired
	private ILoadbalancersService loadbalancersService;

	@ApiOperation(value = "跳转到editrule页")
	@GetMapping("/toRule")
	public ModelAndView toEdit(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "groupId", required = false) String groupId, ModelAndView model) {
		List<Group> groups = groupServiceImpl.lambdaQuery().eq(Group::getIsdelete, "0").list();

		RuleParm ruleParm = new RuleParm();
		if (StrUtil.isEmpty(id)) {// 新增
			ruleParm.setGroupId(groupId);
			ruleParm.setRuleType(1);
			model.addObject("api", "/jmonitor/rule/add");
		} else {// 修改
			ruleParm = ruleServiceImpl.getById(id).convert(RuleParm.class);
			model.addObject("api", "/jmonitor/rule/" + id);
		}
		model.addObject("groups", groups);
		model.addObject("ruleParm", ruleParm);
		model.setViewName("group/edit_rule");
		return model;
	}

	@ApiOperation(value = "查询规则信息")
	@GetMapping("/list")
	@ResponseBody
	public List<Rule> selectRule(@RequestParam(value = "groupId") String groupId,
			@RequestParam(value = "layerId") String layerId) {
		// groupId未定义 则查询当前层级下的所有规则
		List<Rule> rules = CollUtil.newArrayList();
		if (StrUtil.equals(groupId, "undefined")) {
			List<Group> list = groupServiceImpl.lambdaQuery().select(Group::getId).eq(Group::getLayerId, layerId)
					.eq(Group::getIsdelete, "0").list();
			if (CollUtil.isNotEmpty(list)) {
				List<String> groupIds = list.stream().map(g -> g.getId()).collect(Collectors.toList());
				rules = ruleServiceImpl.lambdaQuery().in(Rule::getGroupId, groupIds).eq(Rule::getIsdelete, "0").list();
			}
		} else {
			rules = ruleServiceImpl.lambdaQuery().eq(Rule::getIsdelete, "0").eq(Rule::getGroupId, groupId).list();
		}
		return rules;
	}

	@ApiOperation(value = "匹配规则")
	@GetMapping("/math")
	@ResponseBody
	public List selectRuleByMath(@RequestParam(value = "math") String math,
			@RequestParam(value = "ruleType") Integer ruleType) {
		Console.log(math);
		String msg;
		Integer num;
		switch (ruleType) {
			case 1:
				List<Servers> servers = serversServiceImpl.lambdaQuery().apply("servername regexp {0}", math).eq(Servers::getStatus, "Running").list();
				num = servers.size();
				msg = servers.stream().map(Servers::getServername).reduce((a,b)->StrUtil.format("{},{}", a,b)).get();
				break;
			case 2:
				List<Pods> pods = podsServiceImpl.lambdaQuery().apply("name regexp {0}", math).eq(Pods::getPhase, "Running").ne(Pods::getStatus, "invalid").list();
				num = pods.size();
				msg = pods.stream().map(Pods::getName).reduce((a,b)->StrUtil.format("{},{}", a,b)).get();
				break;
			default:
				List<Loadbalancers> loadbalancers = loadbalancersService.lambdaQuery().apply("loadbalancername regexp {0}", math).eq(Loadbalancers::getStatus, "active").list();
				num = loadbalancers.size();
				msg = loadbalancers.stream().map(Loadbalancers::getLoadbalancername).reduce((a,b)->StrUtil.format("{},{}", a,b)).get();
				break;
		}
		ArrayList<Object> l = CollUtil.newArrayList();
		l.add(msg);
		l.add(num);
		return l;
	}

	@ApiOperation(value = "新增规则")
	@PostMapping("/add")
	@ResponseBody
	public ApiResponses insertRule(@ModelAttribute RuleParm ruleParm) {
		ruleServiceImpl.insertRule(ruleParm);
		return success();
	}

	@ApiOperation(value = "修改规则")
	@PostMapping("/{id}")
	@ResponseBody
	public ApiResponses<?> editRule(@ModelAttribute RuleParm ruleParm) {
		ruleServiceImpl.updateRule(ruleParm);
		return success();
	}

	@ApiOperation(value = "删除规则")
	@DeleteMapping("/{id}")
	@ResponseBody
	public ApiResponses<?> deleteRule(@PathVariable(value = "id") String id) {
		ruleServiceImpl.lambdaUpdate().eq(Rule::getId, id).remove();
		return success();

	}
}
