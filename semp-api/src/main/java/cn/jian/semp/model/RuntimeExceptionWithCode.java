package cn.jian.semp.model;

import lombok.Getter;

@Getter
public class RuntimeExceptionWithCode extends RuntimeException {
    //错误码
    private String errorCode;

    /**
     * 构造参数
     *
     * @param errorCode 错误码
     * @param message   错误描述
     */
    public RuntimeExceptionWithCode(String errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }
}