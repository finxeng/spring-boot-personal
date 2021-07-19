package com.lovejobs.security;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.dao.SystemRoleRepository;
import com.lovejobs.security.entity.SystemRoleEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @author fengxin
 * @version 1.0
 * @description: TODO
 * @date 2021/7/19 18:12
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestSystemRoleRepository {

    @Autowired
    private SystemRoleRepository systemRoleRepository;
    
    @Test
    public void testQueryRoleByUserId(){
        List<SystemRoleEntity> systemRoleEntities = systemRoleRepository.queryRoleByUserId(12L);
        System.out.println(JSONObject.toJSONString(systemRoleEntities));


    }
}
