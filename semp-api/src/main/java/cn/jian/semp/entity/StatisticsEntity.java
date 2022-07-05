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
public class StatisticsEntity extends BaseEntity {

	/**
	 * 设备编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '设备编号'")
	private String deviceId;

	/**
	 * 项目编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '项目编号'")
	private String projectId;
}