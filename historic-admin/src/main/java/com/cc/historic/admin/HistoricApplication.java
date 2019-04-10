package com.cc.historic.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * @author cc
 */
@SpringBootApplication
@MapperScan("com.cc.historic.admin.model.mapper")
@EnableTransactionManagement
public class HistoricApplication {

    @Bean
    public WebMvcConfigurer webMvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("forward:/admin/index");
                registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
            }
        };
    }

    public static void main(String[] args) {
        SpringApplication.run(HistoricApplication.class);

    }

}
