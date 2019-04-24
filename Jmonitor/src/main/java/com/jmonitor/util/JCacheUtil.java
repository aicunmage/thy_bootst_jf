package com.jmonitor.util;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.date.DateUnit;
import lombok.Data;

@Data
public class JCacheUtil {
	
	private static TimedCache<String, Object> timedCache;
	

	static {
		timedCache = CacheUtil.newTimedCache(DateUnit.DAY.getMillis());
		timedCache.schedulePrune(DateUnit.SECOND.getMillis()*30);
	}

	public static void setCache(String key,Object ob) {
		timedCache.put(key, ob);
	}
	
	public static void setCacheByTime(String key,Object ob,long times) {
		timedCache.put(key, ob,times);
	}
	
	public static void removeCache(String key) {
		timedCache.remove(key);
	}
	
	@SuppressWarnings("unchecked")
	public static Object getCache(String key) {
		return  timedCache.get(key);
	}
}
