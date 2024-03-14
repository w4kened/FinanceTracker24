package com.w4kened.FinanceTracker24.service;

import com.w4kened.FinanceTracker24.model.UserEntity;

public interface UserService {
    void save(UserEntity userEntity);
    UserEntity findByUsername(String username);

}
