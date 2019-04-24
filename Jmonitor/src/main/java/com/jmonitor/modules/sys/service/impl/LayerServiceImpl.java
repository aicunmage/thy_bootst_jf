package com.jmonitor.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jmonitor.common.vo.CommonConstant;
import com.jmonitor.common.vo.DictConstant;
import com.jmonitor.modules.sys.dto.GroupInfoDto;
import com.jmonitor.modules.sys.dto.LayerGroupInfoDto;
import com.jmonitor.modules.sys.entity.Dbs;
import com.jmonitor.modules.sys.entity.Dict;
import com.jmonitor.modules.sys.entity.Group;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.entity.Loadbalancers;
import com.jmonitor.modules.sys.entity.NetworkConnectionKey;
import com.jmonitor.modules.sys.entity.Pic;
import com.jmonitor.modules.sys.entity.Pods;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.entity.Servers;
import com.jmonitor.modules.sys.mapper.LayerMapper;
import com.jmonitor.modules.sys.service.IDbsService;
import com.jmonitor.modules.sys.service.IDictService;
import com.jmonitor.modules.sys.service.IGroupService;
import com.jmonitor.modules.sys.service.ILayerService;
import com.jmonitor.modules.sys.service.ILoadbalancersService;
import com.jmonitor.modules.sys.service.INetworkConnectionKeyService;
import com.jmonitor.modules.sys.service.IPicService;
import com.jmonitor.modules.sys.service.IPodsService;
import com.jmonitor.modules.sys.service.IRuleService;
import com.jmonitor.modules.sys.service.IServersService;
import com.jmonitor.util.InfluxServiceUtil;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.influxdb.dto.QueryResult;
import org.influxdb.dto.QueryResult.Result;
import org.influxdb.dto.QueryResult.Series;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 * @author xujinma
 * @since 2019-01-21
 */
@Slf4j
@Service
public class LayerServiceImpl extends ServiceImpl<LayerMapper, Layer> implements ILayerService {

	@Autowired
	private IGroupService groupServiceImpl;
	
	@Autowired
	private IRuleService ruleServiceImpl;
	
	@Autowired
	private IPicService picServiceImpl;
	
	@Autowired
	private IServersService serversServiceImpl;
	
	@Autowired
	private IPodsService podsServiceImpl;
	
	@Autowired
	private ILoadbalancersService loadbalancersService;
	
	@Autowired
	private IDbsService dbsService;
	
	@Autowired
	private InfluxServiceUtil influxServiceUtil;
	
	@Autowired
	private INetworkConnectionKeyService iNetworkConnectionKeyServiceImpl;
	
	@Autowired
	private IDictService dictServiceImpl;
	
	@Override
	public List<LayerGroupInfoDto> selectGroup() {
		ArrayList<LayerGroupInfoDto> lres = CollUtil.newArrayList();
		List<Layer> layers = this.lambdaQuery().eq(Layer::getIsdelete, CommonConstant.STATUS_NORMAL).orderByAsc(Layer::getSort).list();
		
		//遍历每一个层级 查每个层级对应的组
		layers.stream().forEach(layer->{
			
			List<Group> groups = groupServiceImpl.lambdaQuery().eq(Group::getLayerId, layer.getId()).eq(Group::getIsdelete, CommonConstant.STATUS_NORMAL).orderByAsc(Group::getSort).list();
			
			ArrayList<GroupInfoDto> res = CollUtil.newArrayList();
			//遍历每一个组  查每个组对应的规则以及图片等信息
			groups.stream().forEach(group->{
				
				try {
					List<Pic> pics = picServiceImpl.lambdaQuery().eq(Pic::getGroupId, group.getId())
							.eq(Pic::getIsdelete, CommonConstant.STATUS_NORMAL)
							.list();
					
					List<Rule> rules = ruleServiceImpl.lambdaQuery().eq(Rule::getGroupId, group.getId())
							.eq(Rule::getIsdelete, CommonConstant.STATUS_NORMAL)
							.list();
					
					String groupShowName=group.getName();
					if(group.getIsMerge() && (group.getMgeNameType()==CommonConstant.MEGER_NAME_TYPE_MEGERNAME)) {
						groupShowName=group.getMgeName();
					}
					
					HashMap<String, Object> countMap = CollUtil.newHashMap();
					//遍历每个规则  查每个规则对应的服务器以及容器信息
					rules.stream().forEach(rule->{
						//根据规则类型匹配对应的服务器  或者容器
						if(rule.getRuleType()==CommonConstant.RULE_TYPE_SERVER) {
							List<Servers> servers = serversServiceImpl.lambdaQuery().apply("servername regexp {0}", rule.getMath()).list();
							long sersNormalCount = servers.stream().filter(server->StrUtil.equals(server.getStatus(), "Running")).count();
							countMap.put("sersCount", Convert.toLong(countMap.get("sersCount"), 0L)+sersNormalCount);
							countMap.put("sersNormalCount", Convert.toLong(countMap.get("sersNormalCount"), 0L)+sersNormalCount);
						}else if(rule.getRuleType()==CommonConstant.RULE_TYPE_POD) {
							List<Pods> pods = podsServiceImpl.lambdaQuery().apply("name regexp {0}", rule.getMath()).list();
							long podsNormalCount = pods.stream().filter(pod->StrUtil.equals(pod.getPhase(), "Running") && !StrUtil.equals(pod.getStatus(), "invalid")).count();
							countMap.put("podsCount", Convert.toLong(countMap.get("podsCount"), 0L)+podsNormalCount);
							countMap.put("podsNormalCount", Convert.toLong(countMap.get("podsNormalCount"), 0L)+podsNormalCount);
						}else if(rule.getRuleType()==CommonConstant.RULE_TYPE_LOADBALANCERS) {
							List<Loadbalancers> loadbalancers = loadbalancersService.lambdaQuery().apply("loadbalancername regexp {0}", rule.getMath()).list();
							long lodsNormalCount = loadbalancers.stream().filter(loadbalancer->StrUtil.equals(loadbalancer.getStatus(), "active")).count();
							countMap.put("lodsCount", Convert.toLong(countMap.get("lodsCount"), 0L)+lodsNormalCount);
							countMap.put("lodsNormalCount", Convert.toLong(countMap.get("lodsNormalCount"), 0L)+lodsNormalCount);
						}
						//规则对应的服务器或容器不存在
						if(Convert.toLong(countMap.get("sersCount"), 0L)+Convert.toLong(countMap.get("podsCount"),0L)+Convert.toLong(countMap.get("lodsCount"),0L)==0) {
//							log.info("该规则下没有对应服务器或容器，规则name为："+rule.getName());
							return;
						}
					});
					
					GroupInfoDto lgiDto=new GroupInfoDto();
					lgiDto.setGroupId(group.getId());
					lgiDto.setIsMerge(group.getIsMerge());
					lgiDto.setGroupShowName(groupShowName);
					lgiDto.setType(group.getType());
					lgiDto.setSersCount(Convert.toInt(countMap.get("sersCount"),0));
					lgiDto.setPodsCount(Convert.toInt(countMap.get("podsCount"),0));
					lgiDto.setLodsCount(Convert.toInt(countMap.get("lodsCount"),0));
//					lgiDto.setPicPath(picPath);
					res.add(lgiDto);
					
				} catch (Exception e) {
					log.error("组内规则或图片查询异常",e);
				}
			});
			
			LayerGroupInfoDto layerGroupInfoDto=new LayerGroupInfoDto();
			layerGroupInfoDto.setLayerId(layer.getId());
			layerGroupInfoDto.setLayerName(layer.getName());
			layerGroupInfoDto.setGroupInfoDtos(res);
			
			lres.add(layerGroupInfoDto);
		});
		return lres;
	}

	@Override
	public List<HashMap<String, Object>> selectGroupRelation() {
		List<Group> groups = groupServiceImpl.lambdaQuery().select(Group::getId,Group::getParentId).eq(Group::getIsdelete, CommonConstant.STATUS_NORMAL).orderByAsc(Group::getParentId).list();
		List<HashMap<String, Object>> collect=new ArrayList<HashMap<String,Object>>();
		groups.stream()
		.filter(g->!StrUtil.equals(g.getParentId(), "0"))
		.forEach(g->{
			List<String> parentIds = StrUtil.splitTrim(g.getParentId(), ",");
			if(CollUtil.isEmpty(parentIds)) {
				return;
			}else if(parentIds.size()==1) {
				HashMap<String, Object> countMap = CollUtil.newHashMap();
				countMap.put("source", g.getParentId());
				countMap.put("target", g.getId());
				collect.add(countMap);
			}else if(parentIds.size()>1) {
				for (String parentId : parentIds) {
					HashMap<String, Object> countMap = CollUtil.newHashMap();
					countMap.put("source", parentId);
					countMap.put("target", g.getId());
					collect.add(countMap);
				}
			}
		});
		return collect;
	}

	@Override
	public List<HashMap<String, Object>> selectAssets() {
		ArrayList<HashMap<String, Object>> reList = CollUtil.newArrayList();
		
		Integer serverCount = serversServiceImpl.lambdaQuery().eq(Servers::getStatus, "Running").count();
		HashMap<String, Object> mapone = CollUtil.newHashMap();
		mapone.put("name", "服务器");
		mapone.put("count", serverCount);
		
		Integer lodCount = loadbalancersService.lambdaQuery().eq(Loadbalancers::getStatus, "active").count();
		HashMap<String, Object> maptwo = CollUtil.newHashMap();
		maptwo.put("name", "负载均衡");
		maptwo.put("count", lodCount);
		
		Integer dataCount = dbsService.lambdaQuery().eq(Dbs::getStatus, "Running").count();
		HashMap<String, Object> mapthree = CollUtil.newHashMap();
		mapthree.put("name", "数据库");
		mapthree.put("count", dataCount);
		
		reList.add(mapone);
		reList.add(maptwo);
		reList.add(mapthree);
		return reList;
	}
	
	@Override
	public List<HashMap<String, Object>> selectNetworkConnections() {
		String networkConnectionsSql="";
		List<NetworkConnectionKey> nets = iNetworkConnectionKeyServiceImpl.lambdaQuery().eq(NetworkConnectionKey::getStatus, true).list();
		if(CollUtil.isEmpty(nets)) {
			networkConnectionsSql="SELECT mean(value) FROM networkConnections where  time >= now()-20h  group by time(1h) fill(0) order by time desc limit 12";
		}else {
			Optional<String> reduce = nets.stream().map(a-> "id='"+a.getKeyId()+"'").reduce((a,b)->a+" or "+b);
			networkConnectionsSql=StrUtil.format("SELECT mean(value) FROM networkConnections where {} and time >= now()-20h  group by time(1h) fill(0) order by time desc limit 12", reduce.get());
		}
		
		QueryResult results = influxServiceUtil.querySql(networkConnectionsSql);
		Result oneResult = results.getResults().get(0);
		if (oneResult.getSeries() != null) {
			List<List<Object>> valueList = oneResult.getSeries().stream().map(Series::getValues).collect(Collectors.toList()).get(0);
			if (valueList != null && valueList.size() > 0) {
				  List<HashMap<String, Object>> collect = valueList.stream().map(v->{
					HashMap<String, Object> map = CollUtil.newHashMap();
					map.put("time", DateUtil.format(DateUtil.parseUTC(ObjectUtil.toString(v.get(0))), DatePattern.NORM_DATETIME_MINUTE_PATTERN));
					map.put("value", v.get(1));
					return map;
					}).collect(Collectors.toList());
				  CollUtil.reverse(collect);
				return collect;
			}
		}
		return CollUtil.newArrayList();
	}
	
	@Override
	public List<HashMap<String, Object>> selectTopNCpuUsedPercent() {
		QueryResult results = influxServiceUtil.querySql("SELECT top(value,id,10),type FROM cpuUsedPercent  where time >=now()-10m  order by time desc");
		Result oneResult = results.getResults().get(0);
		if (oneResult.getSeries() != null) {
			List<List<Object>> valueList = oneResult.getSeries().stream().map(Series::getValues).collect(Collectors.toList()).get(0);
			if (valueList != null && valueList.size() > 0) {
				return valueList.stream().map(v->{
					
					String serverName="类型异常";
					String ip="";
					String type = StrUtil.toString(v.get(3));
					if(StrUtil.equals(type, "server")) {
						Servers servers = serversServiceImpl.lambdaQuery().eq(Servers::getServerid, v.get(2)).one();
						serverName=servers.getServername();
						ip=servers.getPrivateip();
					}else if(StrUtil.equals(type, "database")) {
						Dbs dbs = dbsService.lambdaQuery().eq(Dbs::getDatabaseid, v.get(2)).one();
						serverName=dbs.getDescription();
						ip="";
					}
					
					HashMap<String, Object> map = CollUtil.newHashMap();
					map.put("name", serverName);
					map.put("ip", ip);
					map.put("type", type);
					map.put("value", v.get(1));
					return map;
				}).sorted((o1,o2)->{
					if(Convert.toFloat(o1.get("value"),(float) 0L)-Convert.toFloat(o2.get("value"),(float) 0L)>=0) {
						return -1;
					}
					return 1;
				}).collect(Collectors.toList());
			}
		}
		return CollUtil.newArrayList();
	}

	@Override
	public List<HashMap<String, Object>> selectMeanCpuUsedPercent() {
		QueryResult results = influxServiceUtil.querySql("SELECT mean(value)  FROM cpuUsedPercent  group by time(1m) order by time desc limit 2");
		Result oneResult = results.getResults().get(0);
		if (oneResult.getSeries() != null) {
			List<List<Object>> valueList = oneResult.getSeries().stream().map(Series::getValues).collect(Collectors.toList()).get(0);
			if (valueList != null && valueList.size() > 0) {
				return valueList.stream().filter(v->!ObjectUtil.isNull(v.get(1))).map(v->{
					HashMap<String, Object> map = CollUtil.newHashMap();
					map.put("time", DateUtil.format(DateUtil.parse(ObjectUtil.toString(v.get(0)),"yyyy-MM-dd'T'HH:mm:ss'Z'"), DatePattern.NORM_DATETIME_MINUTE_PATTERN));
					map.put("value", v.get(1));
					return map;
				}).limit(1).collect(Collectors.toList());
			}
		}
		return CollUtil.newArrayList();
	}

	@Override
	public List<HashMap<String, Object>> selectMeanMemoryUsedPercent() {
		QueryResult results = influxServiceUtil.querySql("SELECT mean(value)  FROM memoryUsedPercent  group by time(1m) order by time desc limit 2");
		Result oneResult = results.getResults().get(0);
		if (oneResult.getSeries() != null) {
			List<List<Object>> valueList = oneResult.getSeries().stream().map(Series::getValues).collect(Collectors.toList()).get(0);
			if (valueList != null && valueList.size() > 0) {
				return valueList.stream().filter(v->!ObjectUtil.isNull(v.get(1))).map(v->{
					HashMap<String, Object> map = CollUtil.newHashMap();
					map.put("time", DateUtil.format(DateUtil.parse(ObjectUtil.toString(v.get(0)),"yyyy-MM-dd'T'HH:mm:ss'Z'"), DatePattern.NORM_DATETIME_MINUTE_PATTERN));
					map.put("value", v.get(1));
					return map;
				}).limit(1).collect(Collectors.toList());
			}
		}
		return CollUtil.newArrayList();
	}

	@Override
	public List<HashMap<String, Object>> selectDangerCpu() {
		Dict one = dictServiceImpl.lambdaQuery().eq(Dict::getCode, DictConstant.DANGER_CODE).eq(Dict::getName, "1").eq(Dict::getIsdelete, "0").one();
		QueryResult results = influxServiceUtil.querySql("SELECT top(value,id,10),type FROM cpuUsedPercent  where time >=now()-10m and value >= "+one.getValue() );
		Result oneResult = results.getResults().get(0);
		if (oneResult.getSeries() != null) {
			List<List<Object>> valueList = oneResult.getSeries().stream().map(Series::getValues).collect(Collectors.toList()).get(0);
			if (valueList != null && valueList.size() > 0) {
				return valueList.stream().map(v->{
					String serverName="类型异常";
					String ip="";
					String type = StrUtil.toString(v.get(3));
					if(StrUtil.equals(type, "server")) {
						Servers servers = serversServiceImpl.lambdaQuery().eq(Servers::getServerid, v.get(2)).one();
						serverName=servers.getServername();
						ip=servers.getPrivateip();
					}else if(StrUtil.equals(type, "database")) {
						Dbs dbs = dbsService.lambdaQuery().eq(Dbs::getDatabaseid, v.get(2)).one();
						serverName=dbs.getDescription();
						ip="";
					}
					
					HashMap<String, Object> map = CollUtil.newHashMap();
					map.put("name", serverName);
					map.put("ip", ip);
					map.put("type", v.get(3));
					map.put("value", v.get(1));
					return map;
				}).sorted((o1,o2)->{
					if(Convert.toFloat(o1.get("value"),(float) 0L)-Convert.toFloat(o2.get("value"),(float) 0L)>=0) {
						return -1;
					}
					return 1;
				}).collect(Collectors.toList());
			}
		}
		return CollUtil.newArrayList();
	}

}
	
