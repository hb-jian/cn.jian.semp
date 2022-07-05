package cn.jian.semp.utils;

import lombok.extern.slf4j.Slf4j;

import java.security.MessageDigest;
import java.util.ResourceBundle;

/**
 * MD5工具类
 *

 */
@Slf4j
public class MD5Util {

    private static final ResourceBundle resourceBundle = ResourceBundle.getBundle("application");

    //小写数组
    private final static String[] LOWER_CASE_STR_DIGITS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};


    /**
     * MD5加密字符串（32位小写）
     *
     * @param origin 原始字符串
     */
    public static String md5Encrypt32Lower(String origin) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] date = md.digest(origin.getBytes());
            return byteToString(date);
        } catch (Exception e) {
            log.error("MD5加密失败...", e);
            return null;
        }
    }

    /**
     * MD5加密字符串（32位大写）
     *
     * @param origin 原始字符串
     * @return
     */
    public static String md5Encrypt32Upper(String origin) {
        String lowerMd5 = md5Encrypt32Lower(origin);
        if (lowerMd5 != null && !lowerMd5.isEmpty()) {
            lowerMd5 = lowerMd5.toUpperCase();
        }
        return lowerMd5;
    }

    // 转换字节数组为16进制字串
    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }


    // 返回形式为 数字+字符串
    private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;

        return LOWER_CASE_STR_DIGITS[iD1] + LOWER_CASE_STR_DIGITS[iD2];
    }

}
