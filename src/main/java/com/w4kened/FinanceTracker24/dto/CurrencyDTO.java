package com.w4kened.FinanceTracker24.dto;

import jakarta.persistence.Column;
import lombok.*;

import java.math.BigDecimal;

@Data
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CurrencyDTO {
    @Column(precision = 18, scale = 4)
    private BigDecimal amount;
    private String currency;

}
