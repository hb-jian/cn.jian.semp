package cn.jian.semp.model;

import lombok.Data;

/**
 * api接口配置信息
 */
@Data
public class ApiSourceConfigDto extends DataSourceConfig {
    /**
     * 接口授权id
     */
    private String authId;
    /**
     * 接口授权key
     */
    private String authKey;
}
