package cn.jian.semp.utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JsonUtil {
    static ObjectMapper objectMapper;

    public static ObjectMapper getObjectMapper(){
        if(objectMapper == null){
            objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        }

        return objectMapper;
    }

    public static String toJsonString(Object object){
        String jsonStr = null;
        try {
            ObjectMapper jsonMapper = getObjectMapper();
            jsonStr = jsonMapper.writeValueAsString(object);
        }catch (Exception ex){
            log.warn("序列化json出现异常",ex);
        }
        return jsonStr;
    }

    public static <T> T toObject(String jsonString,Class<T> className){
        T obj = null;
        try {
            ObjectMapper jsonMapper = getObjectMapper();
            obj = jsonMapper.readValue(jsonString,className);
        }catch (Exception ex){
            log.warn("反序列化json出现异常",ex);
        }
        return obj;
    }

    public static <T> T toObject(String jsonString, TypeReference<T> type){
        T obj = null;
        try {
            ObjectMapper jsonMapper = getObjectMapper();
            obj = jsonMapper.readValue(jsonString,type);
        }catch (Exception ex){
            log.warn("反序列化json出现异常",ex);
        }
        return obj;
    }
}
