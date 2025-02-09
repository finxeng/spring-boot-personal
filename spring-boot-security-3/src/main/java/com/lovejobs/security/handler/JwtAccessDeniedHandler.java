package com.lovejobs.security.handler;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.common.SecurityConstant;
import com.lovejobs.security.enums.ErrorCode;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        response.setContentType(SecurityConstant.APPLICATION_JSON_UTF8_VALUE);
        response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_AUTH_EXCEPTION)));
    }
}
