package com.lovejobs.security.controller;

import com.lovejobs.security.common.Result;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SecurityController {

    @GetMapping("user")
    public Result helloUser() {
        return ResultUtil.ok("Hello User");
    }

    @GetMapping("admin")
    public Result helloAdmin() {
        return ResultUtil.ok("Hello admin");
    }

}