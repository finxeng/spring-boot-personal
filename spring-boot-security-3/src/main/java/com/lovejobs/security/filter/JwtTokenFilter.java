package com.lovejobs.security.filter;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.dto.JwtLoginTokenDTO;
import com.lovejobs.security.dto.JwtUserDetailsDTO;
import com.lovejobs.security.enums.ErrorCode;
import com.lovejobs.security.utils.JwtTokenUtil;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@Component
public class JwtTokenFilter extends OncePerRequestFilter {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        String username = null;
        String jwtToken = null;
        try {
            String token = request.getHeader("Authentication");
            if (StringUtils.isEmpty(token) || !token.startsWith("Bearer ")) {
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_NOT_FOUND)));
                return;
            }
            jwtToken = token.substring(7);
            if(jwtTokenUtil.isTokenExpired(jwtToken)){
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXPIRED)));
                return;
            }
            username = jwtTokenUtil.getUsernameFromToken(jwtToken);
            JwtUserDetailsDTO jwtUserDetailsDTO = new JwtUserDetailsDTO(null,username,null);
            if(!jwtTokenUtil.validateToken(jwtToken,jwtUserDetailsDTO)){
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXCEPTION)));
                return;
            }
            JwtLoginTokenDTO jwtLoginToken = new JwtLoginTokenDTO(username, "", new ArrayList<>());
            jwtLoginToken.setDetails(new WebAuthenticationDetails(request));
            SecurityContextHolder.getContext().setAuthentication(jwtLoginToken);
            filterChain.doFilter(request, response);
        }catch (Exception e){
            throw new BadCredentialsException(ErrorCode.E_TOKEN_EXCEPTION.getMsg());
        }
    }
}
