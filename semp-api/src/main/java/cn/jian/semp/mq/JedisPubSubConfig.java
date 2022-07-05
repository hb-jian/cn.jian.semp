package cn.jian.semp.mq;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

import java.util.Map;

@Configuration
public class JedisPubSubConfig {
//    @Bean
//    public RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory, Map<String, MessageListenerAdapter> listenerAdapterMap) {
//        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
//        container.setConnectionFactory(connectionFactory);
//        listenerAdapterMap.keySet().forEach(adapter -> {
//            container.addMessageListener(listenerAdapterMap.get(adapter), new PatternTopic(adapter));
//        });
//
//        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
//        taskExecutor.setThreadNamePrefix("RedisListenerExecutor-");
//        taskExecutor.initialize();
//        container.setTaskExecutor(taskExecutor);
//        return container;
//    }

//    @Bean
//    public MessageListenerAdapter adapter(JedisSubscriber jedisSubscriber){
//        return new MessageListenerAdapter(jedisSubscriber,"handlerMessage");
//    }

    @Bean
    public RedisMessageListenerContainer container(
            RedisConnectionFactory connectionFactory,
            Map<String, MessageListenerAdapter> adapterMap) {
        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);
        adapterMap.keySet().forEach(topic->{
            container.addMessageListener(adapterMap.get(topic),new PatternTopic(topic));
        });
        return container;
    }
}
