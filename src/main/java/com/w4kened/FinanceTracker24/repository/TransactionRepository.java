package com.w4kened.FinanceTracker24.repository;

import com.w4kened.FinanceTracker24.model.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Long> {

}
