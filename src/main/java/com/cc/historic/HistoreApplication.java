package com.cc.historic;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.cc.historic.*.dao")
public class HistoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(HistoreApplication.class, args);
    }

}
