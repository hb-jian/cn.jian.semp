package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Column;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Data
public class UserDataPermission extends BusinessEntity {

	/**
	 * 用户编号
	 */
	@Column(columnDefinition = "varchar(32) not null comment '用户编号'")
	private String userId;
	/**
	 * 数据编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '数据编号'")
	private String dataId;
	/**
	 * 操作权限
	 */
	@Column(columnDefinition = "int default 0 comment '操作权限'")
	private Integer action;

}