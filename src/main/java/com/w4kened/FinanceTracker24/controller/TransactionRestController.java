package com.w4kened.FinanceTracker24.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.w4kened.FinanceTracker24.config.SecurityUtil;
import com.w4kened.FinanceTracker24.model.TransactionCategory;
import com.w4kened.FinanceTracker24.model.TransactionEntity;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.repository.TransactionRepository;
import com.w4kened.FinanceTracker24.service.TransactionService;
import com.w4kened.FinanceTracker24.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.lang.runtime.ObjectMethods;
import java.math.BigDecimal;
import java.util.List;

@RestController
@AllArgsConstructor
public class TransactionRestController {
    @Autowired
    private final TransactionRepository transactionRepository;

    @Autowired
    private final TransactionService transactionService;

    @Autowired
    private final UserService userService;

    @RequestMapping(value = "/api/getTransactionHistory", method = RequestMethod.GET)
    public List<TransactionEntity> getTransactionHistory() {
        String email = SecurityUtil.getSessionUser();
        UserEntity userEntity = userService.findByUsername(email);
        return transactionRepository.findAllTransactionsByUserId(userEntity.getId());
    }
}
