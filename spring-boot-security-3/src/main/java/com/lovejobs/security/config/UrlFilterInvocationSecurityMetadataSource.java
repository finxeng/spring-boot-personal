package com.lovejobs.security.config;

import com.lovejobs.security.dao.SystemRoleMenuRepository;
import com.lovejobs.security.dao.SystemRolePermissionRepository;
import com.lovejobs.security.dto.SystemRoleMenuDTO;
import com.lovejobs.security.dto.SystemRolePermissionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Component
public class UrlFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private SystemRoleMenuRepository systemRoleMenuRepository;

    @Autowired
    private SystemRolePermissionRepository systemRolePermissionRepository;

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        String requestUrl = ((FilterInvocation) object).getRequestUrl();
        System.out.println(requestUrl);
        System.out.println("UrlFilterInvocationSecurityMetadataSource");
        List<SystemRolePermissionDTO> allRolePermission = systemRolePermissionRepository.findAllRolePermission();
        List<SystemRolePermissionDTO> roleList = new ArrayList<>();
        allRolePermission.forEach(systemRolePermissionDTO -> {
            if (antPathMatcher.match(systemRolePermissionDTO.getUrl(), requestUrl)) {
                roleList.add(systemRolePermissionDTO);
            }
        });
        if(roleList.size()>0){
            String[] roleCodes = roleList.stream().map(SystemRolePermissionDTO::getRoleCode).toArray(String[]::new);
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
