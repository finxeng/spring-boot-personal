package com.lovejobs.config;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.enums.ErrorCode;
import com.lovejobs.utils.ResultUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
public class JwtAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
        httpServletResponse.setContentType("application/json;charset=utf-8");
        httpServletResponse.getWriter().print(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXPIRED)));
    }
}

