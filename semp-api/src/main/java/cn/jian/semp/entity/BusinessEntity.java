package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@MappedSuperclass
@Data
public class BusinessEntity extends BaseEntity {

	/**
	 * 名称
	 */
	@Column(columnDefinition = "varchar(255) comment '名称'")
	private String name;
	/**
	 * 描述信息
	 */
	@Column(columnDefinition = "varchar(2000) default null comment '描述'")
	private String description;
	/**
	 * 是否删除
	 */
	@Column(columnDefinition = "bit not null default 0 comment '是否删除'")
	private Boolean deleted = false;
}