package com.lovejobs.security.filter;

import com.alibaba.fastjson.JSONObject;
import com.lovejobs.security.common.SecurityConstant;
import com.lovejobs.security.dto.JwtLoginTokenDTO;
import com.lovejobs.security.dto.JwtUserDetailsDTO;
import com.lovejobs.security.enums.ErrorCode;
import com.lovejobs.security.service.JwtUserDetailsService;
import com.lovejobs.security.utils.JwtTokenUtil;
import com.lovejobs.security.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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

    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        response.setContentType(SecurityConstant.APPLICATION_JSON_UTF8_VALUE);
        String username = null;
        String jwtToken = null;
        try {
            String token = request.getHeader("Authentication");
            if (StringUtils.isEmpty(token) || !token.startsWith("Bearer ")) {
                response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_NOT_FOUND)));
                return;
            }
            jwtToken = token.substring(7);
            if(jwtTokenUtil.isTokenExpired(jwtToken)){
                response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXPIRED)));
                return;
            }
            username = jwtTokenUtil.getUsernameFromToken(jwtToken);
            JwtUserDetailsDTO jwtUserDetailsDTO = new JwtUserDetailsDTO(null,username,null, new ArrayList<>(), false);
            if(!jwtTokenUtil.validateToken(jwtToken,jwtUserDetailsDTO)){
                response.getWriter().write(JSONObject.toJSONString(ResultUtil.failWithMsg(ErrorCode.E_TOKEN_EXCEPTION)));
                return;
            }

            UserDetails userDetails = jwtUserDetailsService.loadUserByUsername(username);
            JwtLoginTokenDTO authenticatedToken = new JwtLoginTokenDTO(userDetails, "", userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authenticatedToken);
            filterChain.doFilter(request, response);
        }catch (Exception e){
            throw new BadCredentialsException(ErrorCode.E_TOKEN_EXCEPTION.getMsg());
        }
    }
}
