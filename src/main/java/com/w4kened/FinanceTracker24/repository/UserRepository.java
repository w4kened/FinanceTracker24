package com.w4kened.FinanceTracker24.repository;

import com.w4kened.FinanceTracker24.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByUsername(String username);
}
