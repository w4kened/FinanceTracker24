package com.w4kened.FinanceTracker24.service;

import com.w4kened.FinanceTracker24.model.TransactionCategory;
import com.w4kened.FinanceTracker24.model.TransactionEntity;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.repository.TransactionRepository;
import com.w4kened.FinanceTracker24.repository.UserRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
@RequiredArgsConstructor
public class TransactionService {
    @Autowired
    TransactionRepository transactionRepository;

    @Autowired
    UserRepository userRepository;

    public void depositMoneyForUser(UserEntity userEntity, BigDecimal amount, String nameCurrency)  {
        TransactionEntity newTransaction = TransactionEntity.builder()
                .amount(amount)
                .currency(nameCurrency)
                .transactionCategory(TransactionCategory.DEPOSIT)
                .userEntity(userEntity)
                .createdDate(getCurrentTimeStamp())
                .build();
        transactionRepository.save(newTransaction);

        userEntity.setBalance(
                userEntity
                        .getBalance()
                        .add(amount)
        );
        userRepository.save(userEntity);
    }

    public void withdrawMoneyForUser(UserEntity userEntity, BigDecimal amount, String nameCurrency) {



        TransactionEntity newTransaction = TransactionEntity.builder()
                .amount(amount)
                .currency(nameCurrency)
                .transactionCategory(TransactionCategory.WITHDRAW)
                .userEntity(userEntity)
                .createdDate(getCurrentTimeStamp())
                .build();
        transactionRepository.save(newTransaction);

        userEntity.setBalance(
                userEntity
                        .getBalance()
                        .subtract(amount)
        );
        userRepository.save(userEntity);
    }

    public void exchangeMoneyForUser(UserEntity userEntity, BigDecimal amount, String newCurrencyName) {
        TransactionEntity newTransaction = TransactionEntity.builder()
                .amount(amount)
                .currency(newCurrencyName)
                .transactionCategory(TransactionCategory.EXCHANGE)
                .userEntity(userEntity)
                .createdDate(getCurrentTimeStamp())
                .build();
        transactionRepository.save(newTransaction);

        userEntity.setBalance(amount);
        userEntity.setCurrency(newCurrencyName);
        userRepository.save(userEntity);
    }

    public static LocalDateTime getCurrentTimeStamp() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        String formattedDateTimeString = now.format(formatter);
        return LocalDateTime.parse(formattedDateTimeString, formatter);
    }
}
