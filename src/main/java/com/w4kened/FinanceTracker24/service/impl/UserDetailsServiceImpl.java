package com.w4kened.FinanceTracker24.service.impl;

import com.w4kened.FinanceTracker24.model.RoleEntity;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.repository.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;


    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findByUsername(username);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        System.out.println("\nasdasdasdas "+
                username);

        for (RoleEntity roleEntity : userEntity.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(roleEntity.getName()));
        }

        return new org.springframework.security.core.userdetails.User(userEntity.getUsername(), userEntity.getPassword(), grantedAuthorities);
    }
}
