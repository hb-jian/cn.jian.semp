package cn.jian.semp.model;

import lombok.Data;

/**
 * OpcServer连接信息
 */
@Data
public class OpcConnectionConfigDto extends DataSourceConfig {

    /**
     * kepServer服务器地址
     */
    private String host;
    /**
     * kepServer所在域
     */
    private String domain;
    /**
     * 服务器账号
     */
    private String user;
    /**
     * 服务器密码
     */
    private String pwd;
    /**
     * KepServer组件编号
     */
    private String clsid;
}
