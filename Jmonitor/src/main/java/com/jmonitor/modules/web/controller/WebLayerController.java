package com.jmonitor.modules.web.controller;



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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.web.service.WGroupService;
import com.jmonitor.modules.web.service.WLayerService;
import com.jmonitor.modules.web.service.WRuleService;

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
@RequestMapping("/jmonitor/layer")
public class WebLayerController extends SuperController {
	
	@Autowired
	private WLayerService layerServiceImpl;
	
	@Autowired
	private WGroupService groupServiceImpl;

	@Autowired
	private WRuleService ruleServiceImpl;
	
	@ApiOperation(value = "跳转到layer页")
    @GetMapping
	public ModelAndView returnTolayer(ModelAndView model) {
		model.setViewName("layer/layer");
		return model;
	}
	
	@ApiOperation(value = "跳转到editlayer页")
	@GetMapping("/toLayer")
    public ModelAndView toEdit(@RequestParam(value="id",required = false)String id, ModelAndView model) {
		LayerParm layerParm =new LayerParm();
		if(StrUtil.isEmpty(id)) {
			Integer count = layerServiceImpl.lambdaQuery().eq(Layer::getIsdelete, "0").count();
			layerParm.setSort(count);
			model.addObject("api", "/jmonitor/layer/add");
		}else {
			layerParm = layerServiceImpl.getById(id).convert(LayerParm.class);
			model.addObject("api", "/jmonitor/layer/"+id);
		}
        model.addObject("layerParm", layerParm);
        model.setViewName("layer/edit_layer");
        return model;
    }
	
	@ApiOperation(value = "查询所有层级")
	@GetMapping("/list")
	@ResponseBody
    public List<Layer> selectLayer() {
		List<Layer> list = layerServiceImpl.lambdaQuery().eq(Layer::getIsdelete, "0").orderByAsc(Layer::getSort).list();
        return list;
    }
	
	@ApiOperation(value = "新增层级")
    @PostMapping("/add")
	@ResponseBody
	public ApiResponses insertLayer(@ModelAttribute LayerParm layerParm) {
		layerServiceImpl.insertLayer(layerParm);
		return success();
	}
	
	@ApiOperation(value = "修改层级")
    @PostMapping("/{id}")
	@ResponseBody
	public ApiResponses<?> editLayer(@ModelAttribute LayerParm layerParm) {
		layerServiceImpl.updateLayer(layerParm);
		return success();
    }
	
	@ApiOperation(value = "删除层级")
    @DeleteMapping("/{id}")
	@ResponseBody
	@Transactional
	public ApiResponses<?> deleteLayer(@PathVariable(value="id")String id) {
		layerServiceImpl.removeById(id);
		List<Group> groups = groupServiceImpl.lambdaQuery().eq(Group::getLayerId, id).list();
		List<String> groupIds = groups.stream().map(g->g.getId()).collect(Collectors.toList());
		groupServiceImpl.lambdaUpdate().eq(Group::getLayerId, id).remove();
		ruleServiceImpl.lambdaUpdate().in(Rule::getGroupId, groupIds).remove();
		return success();
	
    }
}

