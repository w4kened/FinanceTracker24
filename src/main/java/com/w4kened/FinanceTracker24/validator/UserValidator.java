package com.w4kened.FinanceTracker24.validator;

import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;


    @Override
    public boolean supports(Class<?> clazz) {
        return UserEntity.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserEntity userEntity = (UserEntity) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (userEntity.getUsername().length() < 6 || userEntity.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        if (userService.findByUsername(userEntity.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (userEntity.getPassword().length() < 8 || userEntity.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }
        if (!userEntity.getPasswordConfirm().equals(userEntity.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }
}
