package cn.jian.semp.model;

import lombok.Data;

@Data
public class LoginTokenDto {
    /**
     * 访问token
     */
    private String accessToken;
    /**
     * 刷新token
     */
    private String refreshToken;
    /**
     * accessToken有效期，单位：秒
     */
    private Long accessTokenExpiration;
}
