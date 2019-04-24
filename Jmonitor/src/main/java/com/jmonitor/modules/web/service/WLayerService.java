package com.jmonitor.modules.web.service;

import com.jmonitor.modules.sys.entity.Layer;
import com.jmonitor.modules.sys.request.LayerParm;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author xujinma
 * @since 2019-01-21
 */
public interface WLayerService extends IService<Layer> {

	void insertLayer(LayerParm layerParm);

	void updateLayer(LayerParm layerParm);

}
