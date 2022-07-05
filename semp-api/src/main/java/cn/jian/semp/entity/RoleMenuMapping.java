package cn.jian.semp.entity;

import lombok.Data;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Data
public class RoleMenuMapping extends BusinessEntity {

	/**
	 * 角色编号
	 */
	private String roleId;
	/**
	 * 菜单编号
	 */
	private String menuId;

}