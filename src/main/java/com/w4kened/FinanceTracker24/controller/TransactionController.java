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
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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

            transactionService.depositMoneyForUser(userEntity, amount, userEntity.getCurrency());
        }
        return "redirect:/home"; // Redirect to the dashboard page or any other appropriate page
    }

    @RequestMapping(value = "/withdrawMoney", method = RequestMethod.POST)
    public String withdrawMoney(@RequestParam("amount") BigDecimal amount, RedirectAttributes redirectAttributes) {
        if (amount.compareTo(BigDecimal.ZERO) > 0) {
            String email = SecurityUtil.getSessionUser();
            UserEntity userEntity = userService.findByUsername(email);
            BigDecimal balance = userEntity.getBalance();
            System.out.println(balance.subtract(amount));

            if (balance.subtract(amount).compareTo(BigDecimal.ZERO) < 0) {
//                String error = request.getParameter("error");
//                errors.rejectValue("username", "Size.userForm.username");

                redirectAttributes.addAttribute("withdrawErr", "The amount is bigger than balance");
                return "redirect:/home";
//                System.out.println("bigger than balance");
            }
            transactionService.withdrawMoneyForUser(userEntity, amount, userEntity.getCurrency());
        }
        else {
            redirectAttributes.addAttribute("withdrawErr", "The amount is less or equal zero");
            System.out.println(redirectAttributes);

        }
        return "redirect:/home";
    }

    @RequestMapping(value = "/exchangeMoney", method = RequestMethod.POST)
    public String exchangeMoney(@RequestParam("amount") BigDecimal amount,
                                @RequestParam("currencySelect") String newCurrencyName) {
        if (amount.compareTo(BigDecimal.ZERO) > 0) {
            String email = SecurityUtil.getSessionUser();
            UserEntity userEntity = userService.findByUsername(email);
            transactionService.exchangeMoneyForUser(userEntity, amount, newCurrencyName);
        }
        return "redirect:/home";
    }
}
