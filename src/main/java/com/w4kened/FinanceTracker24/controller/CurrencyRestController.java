package com.w4kened.FinanceTracker24.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.w4kened.FinanceTracker24.config.SecurityUtil;
import com.w4kened.FinanceTracker24.model.UserEntity;
import com.w4kened.FinanceTracker24.service.UserService;
import io.github.bucket4j.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;
import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;
import java.util.Set;

@RestController
@RequiredArgsConstructor
public class CurrencyRestController {
    @Autowired
    UserService userService;
    private final Bucket bucket;

    public CurrencyRestController() {
        this.bucket = Bucket4j.builder()
                .addLimit(Bandwidth.classic(5, Refill.intervally(5, Duration.ofDays(1))))
                .build();
    }
    @RequestMapping(value = "/api/getCurrency", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Double>> fetchCurrencyData() {
        ConsumptionProbe probe = bucket.tryConsumeAndReturnRemaining(1);

        if (probe.isConsumed()) {
            String email = SecurityUtil.getSessionUser();
            UserEntity userEntity = userService.findByUsername(email);
            String currencyBaseName = userEntity.getCurrency();
            return ResponseEntity.ok().body(fetchDataFromAPI(currencyBaseName));
        } else {
            System.out.println("Reaching API call limit per day");
            return ResponseEntity.internalServerError().body(new TreeMap<>());
        }
    }
    private static Map<String, Double> fetchDataFromAPI(String inputBaseCurrencyName) {
        /*
        Warning: current API service offers 5000 API calls per month/~166 API calls per day
        */
        String apiUrlPrefix = "https://api.currencybeacon.com/v1/latest";
        String apiKey = "KyTUJ1YsU8PAxpyZQBW4k4vKkSoxnrQZ";
        String symbols = "";
        switch (inputBaseCurrencyName) {
            case "PLN" -> symbols = "USD,EUR,UAH";
            case "USD" -> symbols = "PLN,EUR,UAH";
            case "EUR" -> symbols = "PLN,USD,UAH";
            case "UAH" -> symbols = "PLN,USD,EUR";
        }
        String url = apiUrlPrefix + "?api_key=" + apiKey + "&base=" + inputBaseCurrencyName + "&symbols=" + symbols;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);

        ObjectMapper mapper = new ObjectMapper();
        Map<Object, Object> mapContainer;
        try {
            mapContainer = mapper.readValue(response.getBody(), Map.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }

        Map<String, Double> exchangeRatesMap =
                (Map<String, Double>) mapContainer.getOrDefault("rates", Collections.emptyMap());

        return exchangeRatesMap;
    }
}
