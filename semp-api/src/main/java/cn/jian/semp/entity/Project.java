package cn.jian.semp.entity;

import cn.jian.semp.model.*;
import cn.jian.semp.utils.JsonUtil;
import com.vladmihalcea.hibernate.type.json.JsonStringType;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.*;
import java.util.Date;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table(name = "e_project")
@Entity
@Data
@TypeDef(name = "json", typeClass = JsonStringType.class)
public class Project extends BusinessEntity {

	/**
	 * 机构编号
	 */
	@Column(columnDefinition = "varchar(32) default null comment '机构编号'")
	private String orgId;

	/**
	 * KepServer组件注册编号
	 */
	@Column(columnDefinition = "varchar(64) default null comment 'KepServer组件编号'")
	private String clsId;

	/**
	 * 项目能源覆盖面积
	 */
	@Column(columnDefinition = "bigint default 0 comment '覆盖面积'")
	private Long coverage;

	/**
	 * 装机容量
	 */
	@Column(columnDefinition = "bigint default 0 comment '装机容量'")
	private Long capacity;

	/**
	 * 设备配置
	 */
	@Column(columnDefinition = "varchar(255) default null comment '设备配置'")
	private String config;

	/**
	 * 项目竣工时间
	 */
	@Column(columnDefinition = "Date default null comment '竣工时间'")
	private Date completionDate;

	/**
	 * 项目投产时间
	 */
	@Column(columnDefinition = "Date default null comment '投产时间'")
	private Date timeToMarket;

	/**
	 * 工艺图
	 */
	@Column(columnDefinition = "varchar(255) default null comment '工艺图'")
	private String designs;

	/**
	 * Opc连接配置
	 */
	@Type(type = "json")
	@Column(columnDefinition = "varchar(1024) default null comment 'Opc连接配置'")
	private OpcConnectionConfigDto opcServerConfig;

	/**
	 * 项目位置
	 */
	@Type(type = "json")
	@Column(columnDefinition = "varchar(1024) default null comment '项目位置'")
	private LocationDto location;

	/**
	 * 建筑类型
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(16) default null comment '建筑类型'")
	private BuildingTypeEnum buildingType;

	/**
	 * 能源类型
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(16) default null comment '能源类型'")
	private EnergyTypeEnum energyType;

	/**
	 * 数据源类型
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(16) default null comment '数据源类型'")
	private DataSourceTypeEnum dataSourceType;

	/**
	 * 数据源配置
	 */
	@Type(type = "json")
	@Column(columnDefinition = "varchar(1024) default null comment '数据源配置'")
	private String dataSourceConfig;

	public DataSourceConfig getDataSourceConfig() {
		if (StringUtils.isBlank(dataSourceConfig))
			return null;

		return dataSourceType == DataSourceTypeEnum.OpcServer ? JsonUtil.toObject(dataSourceConfig, OpcConnectionConfigDto.class) : JsonUtil.toObject(dataSourceConfig, ApiSourceConfigDto.class);
	}

	public void setDataSourceConfig(DataSourceConfig config){
		if(config == null)
			return;

		dataSourceConfig = JsonUtil.toJsonString(config);
	}
}