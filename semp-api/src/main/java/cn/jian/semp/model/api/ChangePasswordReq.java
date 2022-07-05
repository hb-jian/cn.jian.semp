package cn.jian.semp.model.api;

import cn.jian.semp.model.UserInfoDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 修改密码
 */
@Schema
@Data
public class ChangePasswordReq extends UserInfoDto {
    /**
     * 旧密码
     */
    @Schema(name = "oldPwd",description = "旧密码")
    private String oldPwd;

    /**
     * 新密码
     */
    @Schema(name = "newPwd",description = "新密码")
    private String newPwd;
}
