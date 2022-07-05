package cn.jian.semp.model.api;

import cn.jian.semp.model.OrganizationDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema
@Data
public class OrganizationCreateOrUpdateReq extends OrganizationDto {

    /**
     * 管理员账号
     */
    @Schema(name = "admin",description = "管理员账号",required = true)
    private String admin;
    /**
     * 管理员密码
     */
    @Schema(name = "pwd",description = "管理员密码",required = true)
    private String pwd;

}
