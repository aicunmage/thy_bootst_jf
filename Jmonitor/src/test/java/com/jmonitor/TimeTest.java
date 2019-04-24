package com.jmonitor;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;

public class TimeTest {
public static void main(String[] args) throws Exception {
//	[["2019-03-26T07:00:00Z",184.20833333333334],["2019-03-26T06:00:00Z",182.45],["2019-03-26T05:00:00Z",174.39655172413794],
//	 ["2019-03-26T04:00:00Z",177.86666666666667],["2019-03-26T03:00:00Z",207.0],["2019-03-26T02:00:00Z",219.73333333333332],
//	 ["2019-03-26T01:00:00Z",219.32758620689654],["2019-03-26T00:00:00Z",165.65],["2019-03-25T23:00:00Z",60.733333333333334],
//	 ["2019-03-25T22:00:00Z",61.083333333333336],
//	 ["2019-03-25T21:00:00Z",55.833333333333336],["2019-03-25T20:00:00Z",57.9]]
//	 [{"time":"2019-03-25 20:00","value":57.9},{"time":"2019-03-25 21:00","value":55.833333333333336},
//	  {"time":"2019-03-25 22:00","value":61.083333333333336},{"time":"2019-03-25 23:00","value":60.733333333333334},
//	  {"time":"2019-03-26 00:00","value":165.65},{"time":"2019-03-26 01:00","value":219.32758620689654},
//	  {"time":"2019-03-26 02:00","value":219.73333333333332},{"time":"2019-03-26 03:00","value":207.0},
//	  {"time":"2019-03-26 04:00","value":177.86666666666667},{"time":"2019-03-26 05:00","value":174.39655172413794},
//	  {"time":"2019-03-26 06:00","value":182.45},{"time":"2019-03-26 07:00","value":184.20833333333334}]
//	String format = DateUtil.format(DateUtil.parseUTC(ObjectUtil.toString("2019-03-26T07:00:00Z")), DatePattern.NORM_DATETIME_MINUTE_PATTERN);
//    System.out.println(format);
	String timeStr = "2019-03-26T07:00:00Z"; // 字面时间
	SimpleDateFormat bjSdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
	bjSdf.setTimeZone(TimeZone.getTimeZone("GMT-8"));
	Date date = bjSdf.parse(timeStr);  // 将字符串时间按北京时间解析成Date对象
	 
	SimpleDateFormat tokyoSdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");  
	tokyoSdf.setTimeZone(TimeZone.getTimeZone("GMT+8"));  // 设置东京时区
	System.out.println("utc: " + timeStr +"，本地："  + tokyoSdf.format(date));
}
}
