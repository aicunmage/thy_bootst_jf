package com.jmonitor.modules.web.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baomidou.mybatisplus.extension.service.additional.query.impl.LambdaQueryChainWrapper;
import com.jmonitor.common.response.ApiResponses;
import com.jmonitor.common.vo.DictConstant;
import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.sys.entity.Dict;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.service.IDictService;

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
@RequestMapping("/jmonitor/mulitfun")
public class WebMulitFunController extends SuperController {
	
	@Autowired
	private IDictService dictServiceImpl;

	@ApiOperation(value = "跳转到netconnect页")
	@GetMapping
	public ModelAndView returnToNetConnect(ModelAndView model) {
		model.setViewName("mulitfun/mulitfun");
		return model;
	}

	@ApiOperation(value = "查询默认预警值")
	@GetMapping("/dangerval")
	@ResponseBody
	public String selectDangerval() {
		Dict one = dictServiceImpl.lambdaQuery().eq(Dict::getCode, DictConstant.DANGER_CODE).eq(Dict::getName, "1").eq(Dict::getIsdelete, "0").one();
		return one.getValue();
	}
	
	@ApiOperation(value = "修改预警值")
	@PostMapping("/{dangerval}")
	@ResponseBody
	@Transactional
	public ApiResponses<?> deleteGroup(@PathVariable(value="dangerval")String dangerval) {
		dictServiceImpl.lambdaUpdate().set(Dict::getValue, dangerval).eq(Dict::getCode, DictConstant.DANGER_CODE).eq(Dict::getName, "1").eq(Dict::getIsdelete, "0").update();
		return success();
	
    }
}
