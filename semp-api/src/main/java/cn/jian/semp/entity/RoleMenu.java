package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class RoleMenu extends BusinessEntity {

	/**
	 * 角色编号
	 */
	private String roleId;
	/**
	 * 菜单编号
	 */
	private String menuId;

}