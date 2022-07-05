package cn.jian.semp.utils;//package cn.jian.semp.semp1.utils;
//
//import lombok.Synchronized;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.lang3.StringUtils;
//import org.apache.tomcat.util.codec.binary.Base64;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import javax.imageio.ImageIO;
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.util.Random;
//import java.util.Set;
//
///**
// * 验证码生成工具
// * */
//@Slf4j
//@Component
//public class CaptchaUtil {
//    // 图片高度
//    private final int IMG_HEIGHT = 100;
//    // 图片宽度
//    private final int IMG_WIDTH = 30;
//    // 验证码长度
//    private final int CODE_LEN = 4;
//    //数字验证码种子
//    private final String NUMBER_SEED = "0123456789";
//    //混合验证码种子，排除易混淆字符
//    private final String MIXED_SEED = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz123456789";
//    @Autowired
//    private RedisUtil redisUtil;
//
//    /**
//     * 生成图片验证码
//     * @param key 验证码对应的key
//     * @param numberCaptcha 是否为数字验证码
//     * @param validity 是否为数字验证码
//     * @return
//     * @throws IOException
//     */
//    public String genernateCaptchaImage(String key,boolean numberCaptcha,int validity,int countLimit,int intervalLimit) throws IOException{
//        if(validity <=0)
//            throw new IllegalArgumentException("有效期设置不正确");
//
//        String captchaCode = genernateCode(key,numberCaptcha,validity,countLimit,intervalLimit);
//
//        ByteArrayOutputStream byteStream = new ByteArrayOutputStream();// io流
//        try {
//            // 1、用于绘制图片，设置图片的长宽和图片类型（RGB)
//            BufferedImage bufferedImage = new BufferedImage(IMG_HEIGHT, IMG_WIDTH, BufferedImage.TYPE_INT_RGB);
//            // 2、获取绘图工具
//            Graphics graphics = bufferedImage.getGraphics();
//            graphics.setColor(new Color(219, 240, 246)); // 使用RGB设置背景颜色
//            graphics.fillRect(0, 0, IMG_HEIGHT, IMG_WIDTH); // 填充矩形区域
//
//            // 3、验证码中所使用到的字符
//            Random random = new Random();
//            for (int i = 0; i < captchaCode.length(); i++) { // 循环将每个验证码字符绘制到图片上
//                // 3.1、随机生成验证码颜色
//                graphics.setColor(new Color(random.nextInt(150), random.nextInt(200), random.nextInt(255)));
////                graphics.setColor(new Color(0, 0, 0));
//                graphics.setFont(new Font("宋体", Font.BOLD, 22));
//                // 3.1、将一个字符绘制到图片上，并制定位置（设置x,y坐标）
//                graphics.drawString(captchaCode.substring(i,i+1) + "", (i * 20) + 15, 20);
//                //设置干扰线的颜色
//                graphics.setColor(new Color(random.nextInt(255) + 1, random.nextInt(255) + 1, random.nextInt(255) + 1));
//                //设置干扰线的坐标
//                graphics.drawLine(random.nextInt(20), random.nextInt(30), random.nextInt(15) + 80, random.nextInt(30));
//            }
//            // 4、将验证码写入io流
//            ImageIO.write(bufferedImage, "png", byteStream);// 写入流中
//            byte[] bytes = byteStream.toByteArray();// 转换成字节
//            Base64 encoder = new Base64();
//            String png_base64 = encoder.encodeAsString(bytes).trim();// 转换成base64串
//            byteStream.flush();
//
//            return "data:image/png;base64," + png_base64;
//        } catch (IOException e) {
//            log.error("[验证码]生成验证码图片出现异常", e);
//            throw new RuntimeException("生成验证码图片出现异常");
//        } finally {
//            byteStream.close();
//        }
//    }
//
//    /**
//     * 生成验证码
//     * @param key 验证码对应的key
//     * @param numberCaptcha 是否为数字验证码
//     * @param validity 有效期，单位：秒
//     * @return
//     */
//    public String genernateCode(String key,boolean numberCaptcha,int validity,int countLimit,int intervalLimit) {
//        if(validity <=0)
//            throw new IllegalArgumentException("有效期设置不正确");
//
//        if(!limitValidate(key,intervalLimit,countLimit))
//            throw new RuntimeException("刷新操作过于频繁，请稍候再试");
//
//        try {
//            // 1、验证码中所使用到的字符
//            char[] codeChar = numberCaptcha ? NUMBER_SEED.toCharArray() : MIXED_SEED.toCharArray();
//            String captcha = ""; // 存放生成的验证码
//            Random random = new Random();
//            for (int i = 0; i < CODE_LEN; i++) { // 循环将每个验证码字符绘制到图片上
//                int index = random.nextInt(codeChar.length);
//                captcha += codeChar[index];
//            }
//
//            setCaptchaCache(key,captcha,validity);
//            return captcha;
//        } catch (Exception e) {
//            log.error("[验证码]生成验证码出现异常",e);
//            throw new RuntimeException("生成验证码出现异常");
//        }
//    }
//
//    /**
//     * 缓存验证码信息
//     * @param key 验证码对应的key
//     * @param captcha 验证码
//     */
//    private void setCaptchaCache(String key,String captcha,int validity){
//        if(StringUtils.isBlank(key))
//            return;
//
//        //redisUtil.setAttribute(RedisUtil.BusinessType.Captcha, key,captcha,validity);
//        redisUtil.zsetAdd(RedisUtil.BusinessType.Captcha, key,captcha,System.currentTimeMillis(),validity);
//    }
//
//    /**
//     * 检查验证码数量是否超过限制
//     * @param key 验证码对应的key
//     * @param maxInterval 验证码
//     * @param maxCount 验证码
//     */
//    @Synchronized
//    public boolean limitValidate(String key,int maxInterval,int maxCount){
//        if(StringUtils.isBlank(key))
//            return false;
//
//        if(!redisUtil.hasKey(RedisUtil.BusinessType.Captcha,key))
//            return true;
//
//        //操作频次判断
//        long end = System.currentTimeMillis();
//        long start = end - maxInterval * 1000;
//        long count = redisUtil.zsetCount(RedisUtil.BusinessType.Captcha,key,start,end);
//        if(count >= maxCount)
//            return false;
//
//        return true;
//    }
//
//    /**
//     * 校验验证码
//     * @param key 验证码对应的key
//     * @param captcha 验证码
//     * @return
//     */
//    public boolean validate(String key,String captcha){
//        if(StringUtils.isBlank(key) || StringUtils.isBlank(captcha))
//            return false;
//
//        //读取验证码
//        //String cachedCaptcha = redisUtil.getAttribute(RedisUtil.BusinessType.Captcha, key);
//        Set<String> captchas = redisUtil.getZSetByScore(RedisUtil.BusinessType.Captcha, key,0,true);
//        if(captchas == null || captchas.size() == 0)
//            return false;
//
//        String cachedCaptcha = captchas.iterator().next();
//        if(StringUtils.isBlank(cachedCaptcha))
//            return false;
//
//        //删除验证码
//        redisUtil.delete(RedisUtil.BusinessType.Captcha, key);
//        return !StringUtils.isBlank(cachedCaptcha) && cachedCaptcha.equalsIgnoreCase(captcha);
//    }
//}
