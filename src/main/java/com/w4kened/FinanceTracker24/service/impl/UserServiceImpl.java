package com.w4kened.FinanceTracker24.service.impl;

import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.repository.RoleRepository;
import com.w4kened.FinanceTracker24.repository.UserRepository;
import com.w4kened.FinanceTracker24.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(UserEntity userEntity) {
        userEntity = UserEntity.builder()
                .username(userEntity.getUsername())
                .password(bCryptPasswordEncoder.encode(userEntity.getPassword()))
                .roles(new HashSet<>(roleRepository.findAll()))
                .build();
        userRepository.save(userEntity);
    }

    @Override
    public UserEntity findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
