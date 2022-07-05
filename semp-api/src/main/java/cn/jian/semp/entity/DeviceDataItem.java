package cn.jian.semp.entity;

import cn.jian.semp.model.OpcItemTypeEnum;
import lombok.Data;
import javax.persistence.*;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class DeviceDataItem extends BusinessEntity {

	/**
	 * 设备编号
	 */
	@Column(columnDefinition = "varchar(32) not null comment '设备编号'")
	private String deviceId;

	/**
	 * 设备采集数据项
	 */
	@Column(columnDefinition = "varchar(255) not null comment '设备采集数据项'")
	private String item;

	/**
	 * 数据类型
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(32) default 0 comment '数据类型'")
	private OpcItemTypeEnum itemType;

//	/**
//	 * 设备采集数据项
//	 */
//	@Type(type = "json")
//	@Column(columnDefinition = "varchar(2000) not null comment '设备采集数据项'")
//	private List<OpcDataItemDto> opcItems;
}