package com.jmonitor.util;
import lombok.extern.slf4j.Slf4j;
import org.influxdb.InfluxDB;
import org.influxdb.dto.Point;
import org.influxdb.dto.Query;
import org.influxdb.dto.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.jmonitor.config.InfluxConfig;

import java.util.concurrent.TimeUnit;

/**
 */
@Component
@Slf4j
public class InfluxServiceUtil {
    @Autowired
    private InfluxDB influxDB;
    @Autowired
    private InfluxConfig influxConfig;

    public QueryResult querySql(String sql) {
        Query query = new Query(sql, influxConfig.getInfluxDatabase());
        QueryResult result = influxDB.query(query);
        return result;
    }

    /**
     * 创建influx数据库 --
     * influx 会对没有创建的数据库进行创建，如果已经创建则influx会自动忽略；
     * 也可以采用IF NOT EXISTS语法
     * 1. 可能在页面添加数据时创建新数据库，这时在对应service层加入创建influx数据库指令
     * 2. 在项目启动时，flyway初始化之后创建数据库(postConstruct)
     */
    public void createInfluxDatabase(String databaseName) {
        Query query = new Query("CREATE DATABASE " + databaseName, databaseName);
        influxDB.query(query);
    }

    /**
     * 插入数据:
     * tag的使用
     */
    public void writeRecord(String measurement, String record1, String record2, String record3) {
        influxDB.write(Point.measurement(measurement)
                .tag("point_name", record1)
                .addField("point_value", record3)
                .time(Long.parseLong(record2), TimeUnit.MILLISECONDS)
                .build());
    }
}