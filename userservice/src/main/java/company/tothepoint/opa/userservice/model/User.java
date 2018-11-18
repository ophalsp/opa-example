package company.tothepoint.opa.userservice.model;

import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;

@Value
@Builder(toBuilder = true)
public class User {

    private String id;

    private String username;

    private String firstname;

    private String lastname;

    private SensitiveData sensitiveData;

    @Value
    @Builder(toBuilder = true)
    public static class SensitiveData {
        private String socialSecurityNumber;

        private String accountNumber;

        private BigDecimal salary;

        private String spouse;

    }
}
