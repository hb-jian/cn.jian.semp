package cn.jian.semp.model.api;

import cn.jian.semp.model.MenuDto;
import cn.jian.semp.model.RoleTypeEnum;
import lombok.Data;

import java.util.List;

@Data
public class RoleCreateOrUpdateReq {
    private String id;
    private String name;
    private String orgId;
    private RoleTypeEnum roleType;
    private List<MenuDto> menus;
}
