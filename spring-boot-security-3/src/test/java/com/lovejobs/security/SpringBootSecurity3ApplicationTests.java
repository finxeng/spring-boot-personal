package com.lovejobs.security;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.dao.UserRepository;
import com.lovejobs.security.entity.UserEntity;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
class SpringBootSecurity3ApplicationTests {

    @Autowired
    UserRepository userRepository;

    @Test
    void contextLoads() {
        List<UserEntity> all = userRepository.findAll();
        System.out.println(JSONObject.toJSONString(all));

    }

}
