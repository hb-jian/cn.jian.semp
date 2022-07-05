package cn.jian.semp.model;

import lombok.Data;

import java.util.List;

@Data
public class OpcDataItemDto {
    /**
     * 数据项名称
     */
    private String name;
    /**
     * Kep采集编号
     */
    private List<String> kepIds;
    /**
     * 数据合并规则
     */
    private OpcDataMergeRuleEnum mergeRuleEnum;

    /**
     * 数据类型
     */
    private OpcItemTypeEnum opcItemTypeEnum;
}
