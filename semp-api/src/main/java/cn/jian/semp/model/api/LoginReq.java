package cn.jian.semp.model.api;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 用户登录请求参数
 */
@Schema
@Data
public class LoginReq {
    /**
     * 登录账号
     */
    @Schema(name = "account",description = "账号",required = true)
    private String account;
    /**
     * 登录密码
     */
    @Schema(name = "pwd",description = "密码",required = true)
    private String pwd;
    /**
     * 验证码
     */
    @Schema(name = "code",description = "验证码",required = true)
    private String code;
}
