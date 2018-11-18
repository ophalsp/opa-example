package company.tothepoint.opa.userservice.web.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.math.BigDecimal;

@Data
@Builder(toBuilder = true)
@AllArgsConstructor
@RequiredArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserDTO {

    private String id;

    private String username;

    private String firstname;

    private String lastname;

    private SensitiveDataDTO sensitiveData;

    @Data
    @Builder(toBuilder = true)
    @AllArgsConstructor
    @RequiredArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonInclude(JsonInclude.Include.NON_NULL)
    public static class SensitiveDataDTO {

        private String socialSecurityNumber;

        private String accountNumber;

        private BigDecimal salary;

        private String spouse;

    }
}