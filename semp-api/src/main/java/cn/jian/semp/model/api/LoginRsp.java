package cn.jian.semp.model.api;

import cn.jian.semp.model.MenuDto;
import cn.jian.semp.model.UserInfoDto;
import lombok.Data;

import java.util.List;

/**
 * 登录返回结果
 */
@Data
public class LoginRsp extends UserInfoDto {
    /**
     * 访问token，有效期24小时
     */
    private String accessToken;
    /**
     * 刷新token，有效期30天
     */
    private String refreshToken;
    /**
     * accessToken有效期，单位：秒
     */
    private Long accessTokenExpiration;
    private String tokenType;
    private List<MenuDto> menus;
}
