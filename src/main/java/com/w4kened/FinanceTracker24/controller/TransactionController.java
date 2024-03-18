package com.w4kened.FinanceTracker24.controller;

import com.w4kened.FinanceTracker24.config.SecurityUtil;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.service.TransactionService;
import com.w4kened.FinanceTracker24.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@Controller
@RequiredArgsConstructor
public class TransactionController {

    @Autowired
    TransactionService transactionService;

    @Autowired
    UserService userService;
    @RequestMapping(value = "/depositMoney", method = RequestMethod.POST)
    public String depositMoney(@RequestParam("amount") BigDecimal amount) {
        if (amount.compareTo(BigDecimal.ZERO) > 0) {
            String email = SecurityUtil.getSessionUser();
            UserEntity userEntity = userService.findByUsername(email);
            transactionService.depositMoneyForUser(userEntity, amount);
        }
        return "redirect:/home"; // Redirect to the dashboard page or any other appropriate page
    }

    @RequestMapping(value = "/withdrawMoney", method = RequestMethod.POST)
    public String withdrawMoney(@RequestParam("amount") BigDecimal amount) {
        if (amount.compareTo(BigDecimal.ZERO) > 0) {
            String email = SecurityUtil.getSessionUser();
            UserEntity userEntity = userService.findByUsername(email);
            transactionService.withdrawMoneyForUser(userEntity, amount);
        }
        return "redirect:/home";
    }
}
