package cn.jian.semp.model;

import lombok.Data;

import java.util.List;

@Data
public class UserRoleDto {
    private String id;
    private String orgId;
    private String name;
    private List<MenuDto> menus;
    private RoleTypeEnum roleType;
    private Boolean defaultFlag = false;
    private Boolean enabled = true;
}
