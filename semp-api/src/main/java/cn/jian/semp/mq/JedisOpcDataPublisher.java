package cn.jian.semp.mq;

import cn.jian.semp.utils.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class JedisOpcDataPublisher {
    @Autowired
    private RedisUtil redisUtil;
    private String OpcDataChannel = "OPC_DATA_CALLBACK";

    /**
     * 发送数据
     * @param jsonData
     */
    public void send(String jsonData){
        log.debug("投递消息到队列：{},msg:{}",OpcDataChannel,jsonData);
        redisUtil.send(OpcDataChannel,jsonData);
    }
}
