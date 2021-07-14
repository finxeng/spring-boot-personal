package com.lovejobs.controller;

import com.lovejobs.common.Result;
import com.lovejobs.config.JwtTokenUtil;
import com.lovejobs.model.Request;
import com.lovejobs.service.JwtUserDetailsService;
import com.lovejobs.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

/**
 * @author fengxin
 */
@RestController
public class SecurityController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    @Autowired
    JwtTokenUtil jwtTokenUtil;

    @GetMapping("user")
    public Result helloUser() {
        return ResultUtil.ok("Hello User");
    }

    @GetMapping("admin")
    public Result helloAdmin() {
        return ResultUtil.ok("Hello admin");
    }

    @PostMapping("/authenticate")
    public Result createAuthenticationToken(@RequestBody Request request) throws Exception {
        authenticate(request.getUsername(), request.getPassword());
        final UserDetails userDetails = jwtUserDetailsService.loadUserByUsername(request.getUsername());
        final String token = jwtTokenUtil.generateToken(userDetails);
        return ResultUtil.ok(token);
    }

    private void authenticate(String username, String password) throws Exception {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (Exception e) {
            System.out.println(e);
            throw new Exception("USER_DISABLED", e);
        }
    }
}
