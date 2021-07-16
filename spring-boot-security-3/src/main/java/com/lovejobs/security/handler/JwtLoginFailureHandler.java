package com.lovejobs.security.handler;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.enums.ErrorCode;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        System.out.println(exception);
        response.setContentType("application/json;charset=UTF-8");
        if(exception instanceof DisabledException){
            response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_ACCOUNT_DISABLE)));
        }else if(exception instanceof UsernameNotFoundException){
            response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_ACCOUNT_NOT_FOUND)));
        }else{
            response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_WRONG_USERNAME_PASSWORD)));
        }
    }
}
