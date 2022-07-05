package cn.jian.semp.model;

import lombok.Data;

@Data
public class JsonResultState {
    private String code;
    private String message;

    public JsonResultState(String code,String message){
        setCode(code);
        setMessage(message);
    }
}
