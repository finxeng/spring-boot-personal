package com.lovejobs.security.handler;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.common.SecurityConstant;
import com.lovejobs.security.enums.ErrorCode;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        response.setContentType(SecurityConstant.APPLICATION_JSON_UTF8_VALUE);
        response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXCEPTION)));
    }
}
