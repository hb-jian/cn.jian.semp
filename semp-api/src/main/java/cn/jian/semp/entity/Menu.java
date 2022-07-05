package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Column;
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
public class Menu extends BusinessEntity {

	/**
	 * 菜单路由
	 */
	@Column(columnDefinition = "varchar(255) not null comment '路由地址'")
	private String route;
	/**
	 * 父菜单编号
	 */
	@Column(columnDefinition = "varchar(32) not null comment '父菜单编号'")
	private String parentId;
	/**
	 * 菜单序号
	 */
	@Column(columnDefinition = "double(10,2) default 0 comment '菜单序号'")
	private Double sort;
	/**
	 * 是否为系统菜单
	 */
	@Column(columnDefinition = "bit default 0 comment '系统菜单'")
	private Boolean systemFlag = false;
}