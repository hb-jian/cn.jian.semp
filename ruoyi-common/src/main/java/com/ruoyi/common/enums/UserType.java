package com.ruoyi.common.enums;

//import com.ruoyi.common.utils.StringUtils;
//import lombok.extern.slf4j.Slf4j;

/**
 * 用户类型
 * 
 * @author ruoyi
 */
//@Slf4j
public enum UserType
{
    System("00"), EntAdmin("10"), EntUser("11"), Unknow("99");

    private final String code;

    UserType(String code)
    {
        this.code = code;
    }

    public String getCode()
    {
        return code;
    }

//    public static UserType buildByCode(String code){
//        for(UserType typeEnum : UserType.values()){
//            if(StringUtils.equals(code, typeEnum.getCode())){
//                log.info("code:{},current:{}",code,typeEnum.getCode());
//                return typeEnum;
//            }
//        }
//
//        return UserType.Unknow;
//    }
}
