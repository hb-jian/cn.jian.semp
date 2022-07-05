package cn.jian.semp.model;

import lombok.Data;

/**
 * 项目信息
 */
@Data
public class ProjectDto extends ProjectSummaryDto {
    /**
     * Opc采集服务器配置
     */
    private OpcConnectionConfigDto opcConfig;
    /**
     * 覆盖面积
     */
    private Long coverage;
    /**
     * 装机容量
     */
    private Long capacity;
    /**
     * 设备配置
     */
    private String config;
    /**
     * 能源类型
     */
    private EnergyTypeEnum energyType;
    /**
     * 建筑性质
     */
    private BuildingTypeEnum buildingType;
    /**
     * 地理位置
     */
    private LocationDto location;
    /**
     * 数据源类型
     */
    private DataSourceTypeEnum dataSourceType;
    /**
     * 数据源配置
     */
    private DataSourceConfig dataSourceConfig;
}
