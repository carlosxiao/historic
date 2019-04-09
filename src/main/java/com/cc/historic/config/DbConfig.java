package com.cc.historic.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author carlosxiao
 * @classname DbConfig
 */

@Configuration
@MapperScan("com.cc.historic.mapper")
@EnableTransactionManagement
public class DbConfig {
}
