package com.lovejobs.security;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.dao.SystemRolePermissionRepository;
import com.lovejobs.security.dto.SystemRolePermissionDTO;
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
 * @date 2021/7/26 16:27
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestSystemRolePermissionRepository {

    @Autowired
    SystemRolePermissionRepository systemRolePermissionRepository;
    
    @Test
    public void testFindAllRolePermission(){
        List<SystemRolePermissionDTO> allRolePermission = systemRolePermissionRepository.findAllRolePermission();
        System.out.println(JSONObject.toJSONString(allRolePermission));
    }
}
