package com.lovejobs.security;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.dao.SystemRoleMenuRepository;
import com.lovejobs.security.dto.SystemRoleMenuDTO;
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
 * @date 2021/7/20 11:27
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestSystemRoleMenuRepository {

    @Autowired
    private SystemRoleMenuRepository systemRoleMenuRepository;

    @Test
    public void testFindALLRoleMenu(){
        List<SystemRoleMenuDTO> allRoleMenu = systemRoleMenuRepository.findALLRoleMenu();
        System.out.println(JSONObject.toJSONString(allRoleMenu));

    }
}
