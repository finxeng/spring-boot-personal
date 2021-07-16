package com.lovejobs.security.service;

import com.lovejobs.security.dao.UserRepository;
import com.lovejobs.security.dto.JwtUserDetailsDTO;
import com.lovejobs.security.entity.UserEntity;
import com.lovejobs.security.enums.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

@Service
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserEntity byUsername = userRepository.findByUserName(s);
        if(ObjectUtils.isEmpty(byUsername)){
            throw new UsernameNotFoundException(ErrorCode.E_ACCOUNT_NOT_FOUND.getMsg());
        }
        return new JwtUserDetailsDTO(byUsername.getId(),byUsername.getUserName(),bCryptPasswordEncoder.encode(byUsername.getUserPwd()),byUsername.getUserEnabled());
    }
}