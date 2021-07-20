package com.lovejobs.security.config;

import com.lovejobs.security.dto.JwtLoginTokenDTO;
import com.lovejobs.security.dto.JwtUserDetailsDTO;
import com.lovejobs.security.enums.ErrorCode;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@Component
public class UrlAccessDecisionManager implements AccessDecisionManager {

    @Override
    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {

        JwtUserDetailsDTO jwtLoginTokenDTO = (JwtUserDetailsDTO) authentication.getPrincipal();
        Collection<? extends GrantedAuthority> authorities = jwtLoginTokenDTO.getAuthorities();

        Iterator<ConfigAttribute> iterator = configAttributes.iterator();
        while (iterator.hasNext()) {
            ConfigAttribute ca = iterator.next();
            String needRole = ca.getAttribute();
            for (GrantedAuthority authority : authorities) {
                if (authority.getAuthority().equals(needRole)) {
                    return;
                }
            }
        }
        throw new AccessDeniedException(ErrorCode.E_AUTH_EXCEPTION.getMsg());
    }

    @Override
    public boolean supports(ConfigAttribute attribute) {
        return true;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }


}
