package com.lovejobs.security.config;

import com.lovejobs.security.dao.SystemRoleMenuRepository;
import com.lovejobs.security.dto.SystemRoleMenuDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Component
public class UrlFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private SystemRoleMenuRepository systemRoleMenuRepository;

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        String requestUrl = ((FilterInvocation) object).getRequestUrl();
        System.out.println(requestUrl);
        System.out.println("UrlFilterInvocationSecurityMetadataSource");
        List<SystemRoleMenuDTO> allRoleMenu = systemRoleMenuRepository.findALLRoleMenu();
        List<SystemRoleMenuDTO> roleList = new ArrayList<>();
        allRoleMenu.forEach(roleMenu -> {
            if (antPathMatcher.match(roleMenu.getMenuPath().concat(StringUtils.isEmpty(roleMenu.getMenuUrl())?"":roleMenu.getMenuUrl()), requestUrl)) {
                roleList.add(roleMenu);
            }
        });
        if(roleList.size()>0){
            String[] roleCodes = roleList.stream().map(SystemRoleMenuDTO::getRoleCode).toArray(String[]::new);
            return SecurityConfig.createList(roleCodes);
        }
        return SecurityConfig.createList();
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }
}
