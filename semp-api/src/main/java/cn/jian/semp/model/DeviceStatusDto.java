package cn.jian.semp.model;

import lombok.Data;

@Data
public class DeviceStatusDto {
    /**
     * 设备编号
     */
    private String id;
    /**
     * 设备状态
     */
    private DeviceStatusEnum status;
}
