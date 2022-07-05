package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@EntityScan("cn.jian.semp.entity")
@EnableJpaRepositories("cn.jian.semp.repository")
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class },scanBasePackages = {"com.ruoyi","cn.jian.semp"})
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>  系统启动完成  <<<<<<<<<<<<<<<<<<<<<<<" );
    }
}
