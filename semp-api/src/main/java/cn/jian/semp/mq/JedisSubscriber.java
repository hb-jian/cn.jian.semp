package cn.jian.semp.mq;//package cn.jian.semp.semp1.mq;
//
//import cn.jian.semp.semp1.service.IStatisticsService;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;
//import org.springframework.stereotype.Component;
//
//@Slf4j
//@Component("OPC_DATA_CALLBACK")
////Component注解名字是Redis订阅的Key。
////MessageListenerAdapter的实现类会通过Spring自动注入到adapterMap变量，之后通过container方法注册
//public class JedisSubscriber extends MessageListenerAdapter {
//    @Autowired
//    private IStatisticsService statisticsService;
//
//    //handleMessage(String message)方法名不能改成别的，只能是这个名字。因为MessageListenerAdapter中的defaultListenerMethod="handleMessage"
//    public void handleMessage(String message){
//        log.debug("接收到推送消息：{}",message);
//        statisticsService.opcDataProcessor(message);
//    }
//}
