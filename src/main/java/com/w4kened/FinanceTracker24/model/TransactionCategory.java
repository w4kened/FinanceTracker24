package com.w4kened.FinanceTracker24.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
public enum TransactionCategory {
    DEPOSIT("Deposit"),
    WITHDRAW("Withdraw"),
    SPENDING("Spending"),
    EXCHANGE("Exchange");
    private final String label;
}
