package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysOrg;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.SysDeptMapper;
import com.ruoyi.system.mapper.SysOrgMapper;
import com.ruoyi.system.service.ISysOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SysOrgService implements ISysOrgService {
    @Autowired
    SysOrgMapper orgMapper;
    @Autowired
    SysDeptMapper deptMapper;

    @Override
    public SysOrg get(String id) {
        return orgMapper.get(id);
    }

    @Override
    public List<SysOrg> list() {
        return orgMapper.list();
    }

    @Override
    public void add(SysOrg sysOrg) {
        orgMapper.add(sysOrg);

        //为机构创建部门根节点信息
        SysDept dept = new SysDept();
        dept.setParentId(0L);
        dept.setAncestors("0");
        dept.setDeptName(sysOrg.getName());
        dept.setOrgId(sysOrg.getOrgId());

        deptMapper.insertDept(dept);
    }

    @Override
    public void update(SysOrg sysOrg) {
        orgMapper.update(sysOrg);

        if(StringUtils.isNotEmpty(sysOrg.getName())) {
            //更新部门名称
            SysDept dept = new SysDept();
            dept.setParentId(0L);
            dept.setAncestors("0");
            dept.setDeptName(sysOrg.getName());
            dept.setOrgId(sysOrg.getOrgId());
            deptMapper.updateDept(dept);
        }
    }

    @Override
    public void delete(String id) {
        orgMapper.delete(id);
    }
}
