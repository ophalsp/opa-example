package company.tothepoint.opa.userservice.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class UserserviceConfig {

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
