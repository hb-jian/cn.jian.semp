package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.uuid.UUID;
import lombok.Data;

import java.util.Date;

/**
 * 机构表
 */
@Data
public class SysOrg extends BaseEntity {
    public SysOrg(){
        orgId = UUID.randomUUID().toString(true);
    }

    /** 机构ID */
    private String orgId;

    /** 机构名称 */
    private String name;

    /** 服务状态 */
    private Integer status;

    /** 管理员账号 */
    private String account;

    /** 管理员密码 */
    private String pwd;

    /** 服务开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date serviceStartTime;

    /** 服务结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date serviceEndTime;

    /** 数据大屏地址 */
    private String dataViewUrl;
}
