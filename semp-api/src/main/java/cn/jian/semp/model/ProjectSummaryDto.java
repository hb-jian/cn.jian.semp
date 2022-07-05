package cn.jian.semp.model;

import lombok.Data;

import java.util.Date;
import java.util.UUID;

/**
 * 项目信息
 */
@Data
public class ProjectSummaryDto {
    public ProjectSummaryDto(){this.id = UUID.randomUUID().toString().trim().replaceAll("-", "");}
    /**
     * 项目编号
     */
    private String id;
    /**
     * 项目名称
     */
    private String name;
    /**
     * 所属机构编号
     */
    private String orgId;
    /**
     * 所属机构名称
     */
    private String orgName;
    /**
     * 项目竣工时间
     */
    private Date completionDate;
    /**
     * 项目投产时间
     */
    private Date timeToMarket;
}
