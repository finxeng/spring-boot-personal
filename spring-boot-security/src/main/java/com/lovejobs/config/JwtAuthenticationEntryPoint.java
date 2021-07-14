package com.lovejobs.config;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.enums.ErrorCode;
import com.lovejobs.utils.ResultUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
public class JwtAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        if(authException instanceof BadCredentialsException){
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_USER_NOT_FOUND)));
        }else if(authException instanceof CredentialsExpiredException){
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXPIRED)));
        }
    }
}
