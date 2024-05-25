package com.w4kened.FinanceTracker24.repository;

import com.w4kened.FinanceTracker24.model.TransactionEntity;
import com.w4kened.FinanceTracker24.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Long> {
    @Query(value = "select * from transaction_table where user_id = ?1 order by created_date desc;", nativeQuery = true)
    List<TransactionEntity> findAllTransactionsByUserId(Long id);
}
