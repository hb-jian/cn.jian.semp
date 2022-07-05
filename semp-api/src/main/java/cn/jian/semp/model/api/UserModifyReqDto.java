package cn.jian.semp.model.api;

import cn.jian.semp.model.UserInfoDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema
@Data
public class UserModifyReqDto extends UserInfoDto {
}
