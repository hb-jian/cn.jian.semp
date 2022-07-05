package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysOrg;
import java.util.List;

public interface SysOrgMapper {
    SysOrg get(String orgId);
    List<SysOrg> list();
    void add(SysOrg org);
    void update(SysOrg org);
    void delete(String orgId);
}
