package com.w4kened.FinanceTracker24.dto;

import com.w4kened.FinanceTracker24.model.UserEntity;
import jakarta.persistence.Transient;
import lombok.*;
@Data
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private String username;
    private String password;
    @Transient
    private String passwordConfirm;

}
