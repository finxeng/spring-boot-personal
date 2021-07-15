package com.lovejobs.security.config;

import com.lovejobs.security.dto.JwtLoginTokenDTO;
import com.lovejobs.security.service.JwtUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class JwtAuthenticationProvider implements AuthenticationProvider {


    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        UserDetails userDetails = jwtUserDetailsService.loadUserByUsername(String.valueOf(authentication.getPrincipal()));
        JwtLoginTokenDTO jwtLoginToken = (JwtLoginTokenDTO) authentication;

        if (authentication.getCredentials() == null) {
            throw new BadCredentialsException("Bad credentials");
        }

        String presentedPassword = authentication.getCredentials().toString();
        if (!bCryptPasswordEncoder.matches(presentedPassword, userDetails.getPassword())) {
            throw new BadCredentialsException("Bad credentials");
        }

        JwtLoginTokenDTO authenticatedToken = new JwtLoginTokenDTO(userDetails, jwtLoginToken.getCredentials(), userDetails.getAuthorities());
        authenticatedToken.setDetails(jwtLoginToken.getDetails());
        return authenticatedToken;

    }

    @Override
    public boolean supports(Class<?> aClass) {
        return JwtLoginTokenDTO.class.isAssignableFrom(aClass);
    }
}
