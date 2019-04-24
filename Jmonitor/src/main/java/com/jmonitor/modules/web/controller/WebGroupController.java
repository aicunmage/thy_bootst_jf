package com.jmonitor.modules.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baomidou.mybatisplus.extension.service.additional.query.impl.LambdaQueryChainWrapper;
import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.service.IGroupService;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.modules.sys.service.IRuleService;
import com.jmonitor.modules.web.service.WGroupService;
import com.jmonitor.modules.web.service.WLayerService;
import com.jmonitor.modules.web.service.WRuleService;

import cn.hutool.core.collection.CollUtil;
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
@RequestMapping("/jmonitor/group")
public class WebGroupController extends SuperController {
	@Autowired
	private WLayerService layerServiceImpl;

	@Autowired
	private WGroupService groupServiceImpl;

	@Autowired
	private WRuleService ruleServiceImpl;

	@ApiOperation(value = "跳转到group页")
	@GetMapping
	public ModelAndView returnTolayer(ModelAndView model) {
		List<Layer> layers = layerServiceImpl.lambdaQuery().eq(Layer::getIsdelete, "0").orderByAsc(Layer::getSort)
				.list();
		model.addObject("layers", layers);
		model.setViewName("group/group");
		return model;
	}

	@ApiOperation(value = "跳转到editgroup页")
	@GetMapping("/toGroup")
	public ModelAndView toEdit(@RequestParam(value = "id", required = false) String id,@RequestParam(value = "layerId", required = false) String layerId, ModelAndView model) {
		List<Layer> layers = layerServiceImpl.lambdaQuery().eq(Layer::getIsdelete, "0").orderByAsc(Layer::getSort).list();
		
		List<Group> groups = groupServiceImpl.lambdaQuery().eq(Group::getIsdelete, "0").list();
		ArrayList<Object> gls = CollUtil.newArrayList();
		Group g=new Group();
		g.setId("0");
		g.setName("顶层");
		gls.add(g);
		gls.addAll(groups);
		
		GroupParm groupParm = new GroupParm();
		if (StrUtil.isEmpty(id)) {// 新增
			groupParm.setLayerId(layerId);
			Integer groupNum = groupServiceImpl.lambdaQuery().eq(Group::getLayerId, layerId).eq(Group::getIsdelete, "0").count();
			groupParm.setSort(groupNum);
			groupParm.setParentId("0");
			model.addObject("api", "/jmonitor/group/add");
		} else {// 修改
			groupParm = groupServiceImpl.getById(id).convert(GroupParm.class);
			model.addObject("api", "/jmonitor/group/" + id);
		}
		model.addObject("layers", layers);
		model.addObject("groups", gls);
		model.addObject("groupParm", groupParm);
		model.setViewName("group/edit_group");
		return model;
	}

	@ApiOperation(value = "查询分组信息")
	@GetMapping("/list")
	@ResponseBody
	public List<Group> selectGroup(@RequestParam(value = "layerId" , required = false) String layerId) {
		LambdaQueryChainWrapper<Group> lambdaQuery = groupServiceImpl.lambdaQuery();
	    lambdaQuery.eq(Group::getIsdelete, "0");
		if(StrUtil.isNotEmpty(layerId)) {
			lambdaQuery.eq(Group::getLayerId, layerId);
		}
		List<Group> list = lambdaQuery.orderByAsc(Group::getLayerId, Group::getSort).list();
		return list;
	}
	
	@ApiOperation(value = "新增组")
    @PostMapping("/add")
	@ResponseBody
	public ApiResponses insertGroup(@ModelAttribute GroupParm groupParm) {
		groupServiceImpl.insertGroup(groupParm);
		return success();
	}

	@ApiOperation(value = "修改层组")
    @PostMapping("/{id}")
	@ResponseBody
	public ApiResponses<?> editGroup(@ModelAttribute GroupParm groupParm) {
		groupServiceImpl.updateGroup(groupParm);
		return success();
    }
	
	@ApiOperation(value = "删除组")
    @DeleteMapping("/{id}")
	@ResponseBody
	public ApiResponses<?> deleteGroup(@PathVariable(value="id")String id) {
		ruleServiceImpl.lambdaUpdate().eq(Rule::getGroupId, id).remove();
		groupServiceImpl.lambdaUpdate().eq(Group::getId, id).remove();
		return success();
	
    }
}
