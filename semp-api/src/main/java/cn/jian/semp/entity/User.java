package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class User extends BusinessEntity {

	/**
	 * 账号
	 */
	@Column(columnDefinition = "varchar(32) not null comment '账号'")
	private String account;
	/**
	 * 密码
	 */
	@Column(columnDefinition = "varchar(255) not null comment '密码'")
	private String password;
	/**
	 * 是否启用
	 */
	@Column(columnDefinition = "bit default 0 comment '是否启用'")
	private Boolean enabled;
	/**
	 * 最近一次登录时间
	 */
	@Column(columnDefinition = "datetime comment '上一次登录时间'")
	private Date lastLoginTime;

	/**
	 * 登录使用ip
	 */
	@Column(columnDefinition = "varchar(255) default null comment '上一次登录使用ip'")
	private String lastLoginIp;
	/**
	 * 角色编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '角色编号'")
	private String roleId;
	/**
	 * 机构编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '机构编号'")
	private String orgId;
}