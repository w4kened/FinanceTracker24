package com.w4kened.FinanceTracker24.controller;

import com.w4kened.FinanceTracker24.config.SecurityUtil;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.service.UserService;
import com.w4kened.FinanceTracker24.validator.UserValidator;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    UserValidator userValidator;

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
        model.addAttribute("userForm", new UserEntity());
        return "registrationPage";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String postGegistrationPage(@ModelAttribute("userForm") UserEntity userForm,
                                      BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registrationPage";
        }

        userService.save(userForm);

        return "redirect:/login";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getHomePage(Model model) {
//        model.addAttribute("userData", userForm.getUsername());
//        model.addAttribute("userData2", userForm.getPassword());
        String email = SecurityUtil.getSessionUser();
        System.out.println("email " + email);
        UserEntity user = userService.findByUsername(email);
        model.addAttribute("userData", user.getUsername());
        model.addAttribute("userData2", user.getPassword());
        return "homePage";
    }
}
