package com.lovejobs.security.handler;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.common.SecurityConstant;
import com.lovejobs.security.dto.JwtUserDetailsDTO;
import com.lovejobs.security.utils.JwtTokenUtil;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        response.setContentType(SecurityConstant.APPLICATION_JSON_UTF8_VALUE);
        JwtUserDetailsDTO jwtUserDetailsDTO = (JwtUserDetailsDTO) authentication.getPrincipal();
        response.getWriter().write(JSONObject.toJSONString(ResultUtil.ok(jwtTokenUtil.generateToken(jwtUserDetailsDTO))));
    }
}
