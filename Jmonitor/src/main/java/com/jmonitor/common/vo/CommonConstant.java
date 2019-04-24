package com.jmonitor.common.vo;
/**
 * 常量
 * @author xujinma
 */
public interface CommonConstant {

	/**
     * 超级父亲
     */
    String SUPER_FATHER = "0";
    
    /**
     * 正常状态
     */
    Integer STATUS_NORMAL = 0;

    /**
     * 禁用状态
     */
    Integer STATUS_DISABLE = -1;

    /**
     * 删除标志
     */
    Integer DEL_FLAG = 1;
    
    /**
            * 是否合并： 是
     */
    Integer MEGER_YES=1;
    
    /**
             * 是否合并： 否
     */
    Integer MEGER_NO=1;
    
    /**
         * 合并用名类型 组名
    */
    Integer MEGER_NAME_TYPE_GROUPNAME=1;
    
    /**
	     * 合并用名类型 合并名
	*/
    Integer MEGER_NAME_TYPE_MEGERNAME=2;
    
    /**
	     * 规则对应服务器类型 ：server
	*/
    Integer RULE_TYPE_SERVER=1;

	/**
	 *规则对应服务器类型 ：POD
	*/
    Integer RULE_TYPE_POD=2;
    
    /**
	 *规则对应服务器类型 ：LOADBALANCERS
	*/
    Integer RULE_TYPE_LOADBALANCERS=3;
    
    /**
          * 图片对应类型：正常
	*/
	Integer PIC_TYPE_NORMAL=1;
	
	/**
	 *图片对应类型：异常
	*/
	Integer PIC_TYPE_ALERT=2;
}
