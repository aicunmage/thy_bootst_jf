package com.jmonitor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.influxdb.dto.QueryResult;
import org.influxdb.dto.QueryResult.Result;
import org.influxdb.dto.QueryResult.Series;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JmonitorApplicationTests {

	@Test
	public void contextLoads() {
	}

	public static void main(String[] args) {
		
//		DateTime parseUTC = DateUtil.parseUTC("2019-01-02T00:42:42Z");
//		String format = DateUtil.format(parseUTC,DatePattern.NORM_DATETIME_MS_PATTERN);
//		System.out.println(format);
		InfluxDBConnection influxDBConnection = new InfluxDBConnection("usermetric", " upassword", "http://192.168.10.98:8086", "metric", "hour");
		QueryResult results = influxDBConnection
//				.query("SELECT mean(value) FROM networkConnections where time >= '2019-01-02 00:00:00' and time <= '2019-01-03 00:00:00' group by time(1h) fill(0)");
//		.query("SELECT top(value,10),id,type FROM cpuUsedPercent  where time>=now()-10m");
//		.query("SELECT mean(value)  FROM cpuUsedPercent  where time >= '2019-01-02 00:00:00' ");
//		.query("SELECT mean(value)  FROM memoryUsedPercent  where time >= '2019-01-02 00:00:00' ");
		.query("SELECT *  FROM cpuUsedPercent  where time >= '2019-01-02 00:00:00' and value >=9 ");
		
		Result oneResult = results.getResults().get(0);
		if (oneResult.getSeries() != null) {
			List<List<Object>> valueList = oneResult.getSeries().stream().map(Series::getValues)
					.collect(Collectors.toList()).get(0);
			if (valueList != null && valueList.size() > 0) {
				System.out.println(JSON.toJSONString(valueList));
				int i=0;
				for (List<Object> value : valueList) {
					System.out.println(JSON.toJSONString(value));
					Map<String, String> map = new HashMap<String, String>();
					// 数据库中字段1取值
					String field1 = value.get(0) == null ? null : value.get(0).toString();
					// 数据库中字段2取值
					String field2 = value.get(1) == null ? null : value.get(1).toString();
					// TODO 用取出的字段做你自己的业务逻辑……
					System.out.println(StrUtil.format("{},第一个:{},第二个:{}",i++, field1,field2));
				}
			}
		}
	}
}

