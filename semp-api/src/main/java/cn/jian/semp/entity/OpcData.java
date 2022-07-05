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
public class OpcData extends StatisticsEntity {
	public OpcData(){
		super();
	}

	public OpcData(String projectId, String deviceId, OpcItemTypeEnum itemType, double value){
		super();

		setProjectId(projectId);
		setDeviceId(deviceId);
		setItemType(itemType);
		setValue(value);
	}

	/**
	 * 数据类型
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(32) default 0 comment '数据类型'")
	private OpcItemTypeEnum itemType;

	/**
	 * 采集数据
	 */
	@Column(columnDefinition = "int(11) default 0 comment '采集数据'")
	private double value;
}