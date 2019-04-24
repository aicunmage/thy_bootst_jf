package com.jmonitor.modules.web.service.impl;

import com.jmonitor.common.vo.CommonConstant;
import com.jmonitor.config.exception.JmonitorException;
import com.jmonitor.modules.sys.dto.GroupInfoDto;
import com.jmonitor.modules.sys.dto.LayerGroupInfoDto;
import com.jmonitor.modules.sys.entity.Dbs;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.entity.NetworkConnectionKey;
import com.jmonitor.modules.sys.entity.Pic;
import com.jmonitor.modules.sys.entity.Pods;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.entity.Servers;
import com.jmonitor.modules.sys.mapper.LayerMapper;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.sys.service.IDbsService;
import com.jmonitor.modules.sys.service.IGroupService;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.jmonitor.modules.sys.service.INetworkConnectionKeyService;
import com.jmonitor.modules.sys.service.IPicService;
import com.jmonitor.modules.sys.service.IPodsService;
import com.jmonitor.modules.sys.service.IRuleService;
import com.jmonitor.modules.sys.service.IServersService;
import com.jmonitor.modules.web.service.WLayerService;
import com.jmonitor.util.InfluxServiceUtil;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.influxdb.dto.QueryResult;
import org.influxdb.dto.QueryResult.Result;
import org.influxdb.dto.QueryResult.Series;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
@Slf4j
@Service
public class WLayerServiceImpl extends ServiceImpl<LayerMapper, Layer> implements WLayerService {

	@Override
	@Transactional
	public void insertLayer(LayerParm layerParm) {
		layerParm.setCreateUser("xjm");
		layerParm.setUpdateUser("xjm");
		List<Layer> list = this.lambdaQuery().eq(Layer::getIsdelete, CommonConstant.STATUS_NORMAL).orderByDesc(Layer::getSort).list();
		layerParm.setSort(CollUtil.isEmpty(list)?0:Convert.toInt(list.get(0).getSort(), 0)+1);
		boolean save = this.save(layerParm);
	}

	@Override
	@Transactional
	public void updateLayer(LayerParm layerParm) {
		Layer layer = this.getById(layerParm.getId());
		CopyOptions copyOptions = CopyOptions.create().setIgnoreNullValue(false).setIgnoreCase(true)
				.setIgnoreProperties("id","createUser","createTime","updateUser","updateTime");
		BeanUtil.copyProperties(layerParm, layer, copyOptions);
		this.updateById(layer);
	}
	

}
	
