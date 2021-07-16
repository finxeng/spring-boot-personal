package com.lovejobs.security.filter;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lovejobs.security.dto.JwtLoginTokenDTO;
import com.lovejobs.security.enums.ErrorCode;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@Component
public class JwtLoginFilter extends AbstractAuthenticationProcessingFilter {


    @Autowired
    @Override
    public void setAuthenticationManager(AuthenticationManager authenticationManager) {
        super.setAuthenticationManager(authenticationManager);
    }

    public JwtLoginFilter() {
        super(new AntPathRequestMatcher("/authenticate", "POST"));
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        JSONObject jsonObject = null;
        try {
            ServletInputStream inputStream = request.getInputStream();
            ObjectMapper objectMapper = new ObjectMapper();
            jsonObject = objectMapper.readValue(inputStream, JSONObject.class);
        } catch (Exception e) {
            throw new UsernameNotFoundException(ErrorCode.E_WRONG_USERNAME_PASSWORD.getMsg());
        }
        String userName = jsonObject.getString("username");
        String password = jsonObject.getString("password");
        JwtLoginTokenDTO jwtLoginTokenDTO = new JwtLoginTokenDTO(userName,password,new ArrayList<>());
        jwtLoginTokenDTO.setDetails(new WebAuthenticationDetails(request));
        Authentication authenticatedToken = this.getAuthenticationManager().authenticate(jwtLoginTokenDTO);
        return authenticatedToken;
    }
}
