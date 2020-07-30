package com.lovejobs.springbootfeigntest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication public class SpringBootFeignClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootFeignClientApplication.class, args);
    }

}
