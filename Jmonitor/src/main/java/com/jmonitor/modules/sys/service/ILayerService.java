package com.jmonitor.modules.sys.service;

import com.jmonitor.modules.sys.dto.GroupTreeDTO;
import com.jmonitor.modules.sys.dto.LayerGroupInfoDto;
import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.request.GroupParm;
import com.jmonitor.modules.sys.request.LayerParm;
import com.jmonitor.modules.sys.request.RuleParm;

import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xujinma
 * @since 2019-01-21
 */
public interface ILayerService extends IService<Layer> {

	List<LayerGroupInfoDto> selectGroup();

	List<HashMap<String, Object>> selectGroupRelation();

	List<HashMap<String, Object>> selectAssets();

	List<HashMap<String, Object>> selectNetworkConnections();

	List<HashMap<String, Object>> selectTopNCpuUsedPercent();

	List<HashMap<String, Object>> selectMeanCpuUsedPercent();

	List<HashMap<String, Object>> selectMeanMemoryUsedPercent();

	List<HashMap<String, Object>> selectDangerCpu();

}
