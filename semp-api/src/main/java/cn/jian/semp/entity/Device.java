package cn.jian.semp.entity;

import cn.jian.semp.model.OpcDataItemDto;
import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table(name = "e_device")
@Entity
@Data
public class Device extends BusinessEntity {

	/**
	 * 項目编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '項目编号'")
	private String projectId;

	/**
	 * 机构编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '机构编号'")
	private String orgId;

	/**
	 * 设备采集数据项
	 */
	@Type(type = "json")
	@Column(columnDefinition = "varchar(2000) not null comment '设备采集数据项'")
	private List<OpcDataItemDto> opcItems;
}