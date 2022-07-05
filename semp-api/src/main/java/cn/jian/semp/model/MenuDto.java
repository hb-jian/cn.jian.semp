package cn.jian.semp.model;

import lombok.Data;

import java.util.List;

/**
 * 功能菜单
 */
@Data
public class MenuDto {
    /**
     * 菜单编号
     */
    private String id;
    /**
     * 菜单名称
     */
    private String name;
    /**
     * 路由
     */
    private String route;
    /**
     * 显示顺序
     */
    private Double sort;
    /**
     * 父菜单编号
     */
    private String parentId;
    /**
     * 子菜单
     */
    private List<MenuDto> children;
    /**
     * 部分选中状态
     */
    private Boolean checked;
}
