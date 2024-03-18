package com.w4kened.FinanceTracker24.service.impl;

import com.w4kened.FinanceTracker24.dto.UserDTO;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.repository.RoleRepository;
import com.w4kened.FinanceTracker24.repository.UserRepository;
import com.w4kened.FinanceTracker24.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
    public void save(UserDTO userDto) {
        UserEntity newUser = UserEntity.builder()
                .username(userDto.getUsername())
                .password(bCryptPasswordEncoder.encode(userDto.getPassword()))
                .roles(new HashSet<>(roleRepository.findAll()))
                .balance(new BigDecimal(0))
                .currency("PLN")
                .build();
        userRepository.save(newUser);
    }

//    @Override
//    public void save(UserEntity userEntity) {
//        userRepository.save()
//    }

    @Override
    public UserEntity findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
