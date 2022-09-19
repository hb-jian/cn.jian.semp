package cn.jian.semp.model;

import lombok.Data;

import java.util.List;

/**
 * 设备信息
 */
@Data
public class DeviceDto {
    /**
     * 设备编号
     */
    private String id;
    /**
     * 所属项目
     */
    private String projectId;
    /**
     * 所属机构
     */
    private String orgId;
    /**
     * 设备名称
     */
    private String name;
    /**
     * 采集数据项
     */
    private List<OpcDataItemDto> dataItems;
}
