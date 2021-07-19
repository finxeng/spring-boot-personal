package com.lovejobs.security.service;

import com.lovejobs.security.dao.SystemRoleRepository;
import com.lovejobs.security.dao.SystemUserRepository;
import com.lovejobs.security.dto.JwtUserDetailsDTO;
import com.lovejobs.security.entity.SystemRoleEntity;
import com.lovejobs.security.entity.SystemUserEntity;
import com.lovejobs.security.enums.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    SystemUserRepository systemUserRepository;

    @Autowired
    SystemRoleRepository systemRoleRepository;

    @Autowired
    PasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        SystemUserEntity byUsername = systemUserRepository.findByUserName(s);
        if(ObjectUtils.isEmpty(byUsername)){
            throw new UsernameNotFoundException(ErrorCode.E_ACCOUNT_NOT_FOUND.getMsg());
        }
        List<SystemRoleEntity> roles = systemRoleRepository.queryRoleByUserId(byUsername.getId());
        return new JwtUserDetailsDTO(byUsername.getId(),byUsername.getUserName(),bCryptPasswordEncoder.encode(byUsername.getUserPwd()), roles, byUsername.getUserEnabled());
    }
}
