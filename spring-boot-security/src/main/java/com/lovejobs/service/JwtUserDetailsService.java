package com.lovejobs.service;

import com.lovejobs.dao.UserRepository;
import com.lovejobs.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;

@Service
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserEntity userEntity = userRepository.findByUserName(username);
        if(!ObjectUtils.isEmpty(userEntity)){
            User user = new User(username,bCryptPasswordEncoder.encode(userEntity.getPassword()),new ArrayList<>());
            return user;
        }
        throw new UsernameNotFoundException("User not found with username: " + username);
    }
}
