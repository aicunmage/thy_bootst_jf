package com.jmonitor.modules.web.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.jmonitor.common.vo.SuperController;
import com.jmonitor.modules.web.entity.User;
import com.jmonitor.util.JCacheUtil;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * @author xujinma
 * @since 2019-01-21
 */
@Slf4j
@ApiOperation(value = "web服务")
@Controller
@RequestMapping(value="/jmonitor")
public class LoginController extends SuperController {
	
	@ApiOperation(value = "跳转登陆页面")
    @GetMapping
	public ModelAndView index(ModelAndView model) {
		model.setViewName("login");
		model.addObject(new User());
		model.addObject("time", "时间："+DateUtil.format(DateUtil.date(), DatePattern.PURE_DATE_PATTERN));
		return model;
	}
	
	@ApiOperation(value = "登入")
    @PostMapping(value="/login")
	public ModelAndView login(ModelAndView model,@ModelAttribute User user) {
		String date = DateUtil.format(DateUtil.date(), DatePattern.PURE_DATE_PATTERN);
		if(!StrUtil.equals(user.getAccount(), "admin") || !StrUtil.equals(user.getPassword(), date)) {
			model.addObject("msg", "账号或密码不正确");
			model.setViewName("login");
			return model;
		}
		model.addObject("user", user);
		model.setViewName("index");
		//将用户设置到缓存  默认一天
		JCacheUtil.setCache("user", user);
		return model;
	}
	
	@ApiOperation(value = "登出")
    @GetMapping(value="/logout")
	public ModelAndView returnToLogin(ModelAndView model) {
		model.setViewName("redirect:/");
		return model;
	}
}

