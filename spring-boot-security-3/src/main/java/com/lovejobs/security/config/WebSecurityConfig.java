package com.lovejobs.security.config;

import com.lovejobs.security.filter.JwtLoginFilter;
import com.lovejobs.security.filter.JwtTokenFilter;
import com.lovejobs.security.handler.JwtAccessDeniedHandler;
import com.lovejobs.security.handler.JwtAuthenticationEntryPoint;
import com.lovejobs.security.handler.JwtLoginFailureHandler;
import com.lovejobs.security.handler.JwtLoginSuccessHandler;
import com.lovejobs.security.service.JwtUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private JwtLoginFilter jwtLoginFilter;

    @Autowired
    JwtLoginSuccessHandler jwtLoginSuccessHandler;

    @Autowired
    private JwtTokenFilter jwtTokenFilter;

    @Autowired
    private JwtLoginFailureHandler jwtLoginFailureHandler;

    @Autowired
    private JwtAuthenticationProvider jwtAuthenticationProvider;

    @Autowired
    private JwtAccessDeniedHandler jwtAccessDeniedHandler;

    @Autowired
    private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(11);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(jwtUserDetailsService).passwordEncoder(bCryptPasswordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        jwtLoginFilter.setAuthenticationFailureHandler(jwtLoginFailureHandler);
        jwtLoginFilter.setAuthenticationSuccessHandler(jwtLoginSuccessHandler);
        http.authenticationProvider(jwtAuthenticationProvider).sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().authorizeRequests().antMatchers("/authenticate").permitAll()
                .anyRequest().authenticated().and()
                .csrf().disable()
                .addFilterBefore(jwtLoginFilter, UsernamePasswordAuthenticationFilter.class)
                .addFilterAfter(jwtTokenFilter, JwtLoginFilter.class)
                .exceptionHandling().accessDeniedHandler(jwtAccessDeniedHandler)
                .authenticationEntryPoint(jwtAuthenticationEntryPoint);
    }


}
