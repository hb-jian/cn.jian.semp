package cn.jian.semp.model.shanhaibi;

import cn.jian.semp.model.OpcItemTypeEnum;
import lombok.Data;

/**
 * 能源消耗量
 */
@Data
public class EnergyConsumedModel {
    /**
     * 所有者编号
     */
    private String ownId;
    /**
     * 数据类型
     */
    private OpcItemTypeEnum dataItem;
    /**
     * 数据编号
     */
    private Integer dataId;
    /**
     * 消耗量
     */
    private Double data;
}
