package cn.jian.semp.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.BoundZSetOperations;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;
import redis.clients.jedis.commands.MultiKeyCommands;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component
public class RedisUtil {
    //设备状态缓存有效期
    public static int VALIDITY_DEVICESTATUS=3*60;
    //验证码有效期，单位：秒
    public static int VALIDITY_CAPTCHA = 3*60;
    //Token有效期，单位：秒
    public static int VALIDITY_TOKEN = 24*3600;


    @Autowired
    private RedisTemplate<String, String> stringRedisTemplate;

    private String SYS_PREFIX = "Semp";

    /**
     * 业务类型枚举
     */
    public enum BusinessType{
        Captcha,Token,DeviceStatus,KepItem,KepData,DEVICEDB,REALDATA,LASTDATA
    }

    /**
     * map集合key枚举
     */
    public enum TokenMapKeyEnum{
        AccessToken,RefreshToken,Client,Ip,RefreshTime
    }

    public String buildRedisKey(BusinessType businessType,String key){
        return String.format("%s:%s:%s",SYS_PREFIX,businessType.name(),key);
    }

    /**
     * 获取属性
     *
     * @param key
     * @return
     */
    public String getAttribute(String key) {
        return stringRedisTemplate.opsForValue().get(key);
    }

    /**
     * 获取属性
     *
     * @param key
     * @return
     */
    public String getAttribute(BusinessType businessType,String key) {
        String redisKey = buildRedisKey(businessType,key);
        return getAttribute(redisKey);
    }

    /**
     * 设置缓存
     *
     * @param key
     * @param value
     * @param expiredTime
     */
    public void setAttribute(BusinessType businessType,String key, String value, long expiredTime) {
        String redisKey = buildRedisKey(businessType,key);
        setAttribute(redisKey, value, expiredTime);
    }

    /**
     * 设置缓存
     *
     * @param key
     * @param value
     * @param expiredTime
     */
    public void setAttribute(String key, String value, long expiredTime) {
        stringRedisTemplate.opsForValue().set(key, value, expiredTime, TimeUnit.SECONDS);
    }

    /**
     * 获取map键值集合
     *
     * @param key
     * @return
     */
    public Map<String, String> getMap(BusinessType businessType,String key) {
        String redisKey = buildRedisKey(businessType,key);
        BoundHashOperations<String, String, String> boundHashOperations = stringRedisTemplate.boundHashOps(redisKey);
        if (boundHashOperations.size() > 0) {
            return boundHashOperations.entries();
        }
        return null;
    }

    /**
     * 获取map中指定键值内容
     *
     * @param key
     * @param field
     * @return
     */
    public String getMapField(BusinessType businessType,String key, String field) {
        String redisKey = buildRedisKey(businessType,key);
        BoundHashOperations<String, String, String> boundHashOperations = stringRedisTemplate.boundHashOps(redisKey);
        if (boundHashOperations == null) {
            return "";
        }
        return boundHashOperations.get(field);
    }

    /**
     * 设置map内容
     *
     * @param key
     * @param map
     * @param expiredTime
     */
    public void setMap(BusinessType businessType,String key, Map<String, String> map, long expiredTime) {
        if (map == null) {
            return;
        }

        Iterator<Map.Entry<String, String>> entries = map.entrySet().iterator();
        while (entries.hasNext()) {
            Map.Entry<String, String> entry = entries.next();
            if (entry.getValue() == null) {
                entry.setValue("");
            }
        }

        String redisKey = buildRedisKey(businessType,key);
        stringRedisTemplate.opsForHash().putAll(redisKey, map);
        stringRedisTemplate.expire(redisKey, expiredTime, TimeUnit.SECONDS);
    }

    /**
     * 向指定map中添加数据
     *
     * @param key   cache对象key
     * @param field map对应的key
     * @param value 值
     */
    public void setMap(BusinessType businessType,String key, String field, String value, long expiredTime) {
        setMap(businessType,key,field,value);

        String redisKey = buildRedisKey(businessType,key);
        stringRedisTemplate.expire(redisKey, expiredTime, TimeUnit.SECONDS);
    }

    /**
     * 向指定map中添加数据
     *
     * @param key   cache对象key
     * @param field map对应的key
     * @param value 值
     */
    public void setMap(BusinessType businessType,String key, String field, String value) {
        if (value == null) {
            value = "";
        }

        String redisKey = buildRedisKey(businessType,key);
        stringRedisTemplate.opsForHash().put(redisKey, field, value);
    }

    /**
     * zSet 操作 redis中添加sortSet集合
     *
     * @param key
     * @param value
     * @param score
     */
    public void zsetAdd(BusinessType businessType,String key, String value, long score, long expireSeconds) {
        String redisKey = buildRedisKey(businessType,key);
        BoundZSetOperations<String, String> boundZSetOperations = stringRedisTemplate.boundZSetOps(redisKey);
        boundZSetOperations.add(value, score);
        boundZSetOperations.expire(expireSeconds, TimeUnit.SECONDS);
    }

    /**
     * zSet 操作 根据key与Score分数获取zset集合数据倒叙
     *
     * @param key
     * @return
     */
    public Set<String> getZSetByScore(BusinessType businessType,String key,long score,boolean descOrder) {
        String redisKey = buildRedisKey(businessType,key);
        BoundZSetOperations<String, String> boundZSetOperations = stringRedisTemplate.boundZSetOps(redisKey);
        Set<String> zSet = descOrder ? boundZSetOperations.reverseRange(score, -1):boundZSetOperations.range(0, score);
        return zSet;
    }

    /**
     * zSet 操作 根据key与Score分数获取zset集合数据倒叙
     *
     * @param key
     * @return
     */
    public long zsetCount(BusinessType businessType,String key,long startScore,long endScore) {
        String redisKey = buildRedisKey(businessType,key);
        BoundZSetOperations<String, String> boundZSetOperations = stringRedisTemplate.boundZSetOps(redisKey);
        return boundZSetOperations.count(startScore,endScore);
    }

    /**
     * 是否存在缓存
     * @param key
     * @return
     */
    public boolean hasKey(BusinessType businessType,String key){
        String redisKey = buildRedisKey(businessType,key);
        return hasKey(redisKey);
    }

    /**
     * 是否存在缓存
     * @param key
     * @return
     */
    public boolean hasKey(String key){
        return stringRedisTemplate.hasKey(key);
    }

    /**
     * 删除缓存
     *
     * @param businessType
     * @param key
     */
    public void delete(BusinessType businessType,String key) {
        String redisKey = buildRedisKey(businessType,key);
        stringRedisTemplate.delete(redisKey);
    }

    /**
     * 发布订阅消息
     * @param channel
     * @param message
     */
    public void send(String channel,Object message){
        stringRedisTemplate.convertAndSend(channel,message);
    }

    /**
     * key扫描
     * @param prefixKey
     * @return
     */
    public Set<String> singleScan(String prefixKey) {
        return stringRedisTemplate.execute((RedisCallback<Set<String>>) connection -> {
            Set<String> matchKeys = new HashSet<>();

            MultiKeyCommands multiKeyCommands = (MultiKeyCommands) connection.getNativeConnection();
            ScanParams scanParams = new ScanParams();
            scanParams.match(prefixKey + "*");
            scanParams.count(1000);
            ScanResult<String> scan = multiKeyCommands.scan("0", scanParams);
            while (StringUtils.isNotBlank(scan.getCursor())) {
                matchKeys.addAll(scan.getResult());
                if (StringUtils.equals("0", scan.getCursor())) {
                    break;
                }
                scan = multiKeyCommands.scan(scan.getCursor(), scanParams);
            }
            return matchKeys;
        });
    }
}
