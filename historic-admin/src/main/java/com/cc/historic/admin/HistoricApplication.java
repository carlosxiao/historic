package com.cc.historic.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * @author cc
 */
@SpringBootApplication
@MapperScan("com.cc.historic.admin.model.mapper")
@EnableTransactionManagement
public class HistoricApplication {
	public static void main(String[] args) {
		SpringApplication.run(HistoricApplication.class);

	}

}
