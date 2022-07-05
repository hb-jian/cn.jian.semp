package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class Organization extends BusinessEntity {
    /**
     * 企业大屏地址
     */
    private String dataViewUrlOfOrg;
    /**
     * 项目大屏地址
     */
    private String dataViewUrlOfProject;
}