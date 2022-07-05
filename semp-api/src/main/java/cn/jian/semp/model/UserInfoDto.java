package cn.jian.semp.model;

import lombok.Data;

import java.util.Date;

/**
 * 用户信息
 */
@Data
public class UserInfoDto {
    /**
     * 用户编号
     */
    private String id;
    /**
     * 用户昵称
     */
    private String name;
    /**
     * 账号
     */
    private String account;
    /**
     * 角色编号
     */
    private String roleId;
    /**
     * 机构编号
     */
    private String orgId;
    /**
     * 最近登录ip
     */
    private String lastLoginIp;
    /**
     * 最近登录时间
     */
    private Date lastLoginTime;
    /**
     * 是否启用
     */
    private boolean enabled;
}
