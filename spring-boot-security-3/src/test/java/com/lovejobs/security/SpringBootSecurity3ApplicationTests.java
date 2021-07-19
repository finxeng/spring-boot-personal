package com.lovejobs.security;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.dao.SystemUserRepository;
import com.lovejobs.security.entity.SystemUserEntity;
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
    SystemUserRepository systemUserRepository;

    @Test
    void contextLoads() {
        List<SystemUserEntity> all = systemUserRepository.findAll();
        System.out.println(JSONObject.toJSONString(all));

    }

}
