package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.uuid.UUID;
import lombok.Data;

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
}
