package cn.jian.semp.model;

import lombok.Data;

@Data
public class OpcCallbackDataModel {
    private String itemId;
    private Double data;
    private long timestamp;
}
