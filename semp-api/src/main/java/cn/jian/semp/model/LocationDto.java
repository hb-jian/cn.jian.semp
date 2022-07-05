package cn.jian.semp.model;

import lombok.Data;

/**
 * 地理位置信息
 */
@Data
public class LocationDto {
    /**
     * 位置坐标
     */
    private String position;
    /**
     * 地址
     */
    private String address;
    /**
     * 所在城市
     */
    private String city;
}
