package com.jmonitor.modules.web.service;

import com.jmonitor.modules.sys.entity.NetworkConnectionKey;
import com.jmonitor.modules.sys.entity.Rule;
import com.jmonitor.modules.sys.request.NetParm;
import com.jmonitor.modules.sys.request.RuleParm;
import com.jmonitor.modules.web.entity.ServerEntity;

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
public interface WNetworkConnectionKeyService extends IService<NetworkConnectionKey> {

	List<ServerEntity> selectServerInfo();

	void insertNetConnect(List<String> keyIds);

	void delNetConnect(List<String> keyIds);


}
