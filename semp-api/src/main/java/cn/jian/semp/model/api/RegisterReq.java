package cn.jian.semp.model.api;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 用户注册模型
 */
@Schema
@Data
public class RegisterReq {
    /**
     * 账号
     */
    @Schema(name = "account",description = "账号",required = true)
    private String account;
    /**
     * 密码
     */
    @Schema(name = "pwd",description = "密码",required = true)
    private String pwd;
    /**
     * 昵称
     */
    @Schema(name = "name",description = "昵称",required = true)
    private String name;
    /**
     * 所属机构
     */
    @Schema(name = "orgId",description = "所属机构",required = true)
    private String orgId;
    /**
     * 角色编号
     */
    @Schema(name = "roleId",description = "角色编号",required = true)
    private String roleId;
}
