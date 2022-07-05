package cn.jian.semp.model;

import lombok.Data;

@Data
public class JsonResultData<T> {
    private T data;

    public JsonResultData(T data){
        setData(data);
    }
}
