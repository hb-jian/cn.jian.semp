package cn.jian.semp.model.api;

import lombok.Data;

@Data
public class CaptchaRsp {
    /**
     * 验证码
     */
    private String captcha;
}
