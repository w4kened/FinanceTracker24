package com.w4kened.FinanceTracker24.controller;

import com.w4kened.FinanceTracker24.config.SecurityUtil;
import com.w4kened.FinanceTracker24.dto.CurrencyDTO;
import com.w4kened.FinanceTracker24.dto.UserDTO;
import com.w4kened.FinanceTracker24.model.TransactionCategory;
import com.w4kened.FinanceTracker24.model.TransactionEntity;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.repository.TransactionRepository;
import com.w4kened.FinanceTracker24.repository.UserRepository;
import com.w4kened.FinanceTracker24.service.TransactionService;
import com.w4kened.FinanceTracker24.service.UserService;
import com.w4kened.FinanceTracker24.validator.UserValidator;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequiredArgsConstructor
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    UserValidator userValidator;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public static String getLoginPage(Model model, HttpServletRequest request) {

        String error = request.getParameter("error");
        String logout = request.getParameter("logout");

        if (error != null)
            model.addAttribute("error",
                    "Your username or password is invalid.");

        if (logout != null)
            model.addAttribute("message",
                    "You have been logged out successfully.");

        return "loginPage";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String getRegistrationPage(Model model) {
        model.addAttribute("userForm", new UserDTO());
        return "registrationPage";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String postGegistrationPage(@ModelAttribute("userForm") UserDTO userForm,
                                      BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registrationPage";
        }

        userService.save(userForm);

        return "redirect:/home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getHomePage(Model model) {
        String email = SecurityUtil.getSessionUser();
        System.out.println("email " + email);
        UserEntity user = userService.findByUsername(email);
        model.addAttribute("user", user);
        model.addAttribute("currencyDTO", new CurrencyDTO());
        return "homePage";
    }
}
