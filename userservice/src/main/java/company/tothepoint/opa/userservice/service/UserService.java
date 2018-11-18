package company.tothepoint.opa.userservice.service;

import company.tothepoint.opa.userservice.model.User;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class UserService {

    private static Map<String, User> userMap = new HashMap();

    static {
        String userId = "7c352a3b-9c53-41cc-8133-b60197ff1d3a";
        userMap.put(userId, User.builder()
                .id(userId)
                .username("ophalpe")
                .firstname("Peter")
                .lastname("Ophals")
                .sensitiveData(User.SensitiveData.builder()
                        .socialSecurityNumber("80072922354")
                        .accountNumber("001-2964463-25")
                        .salary(BigDecimal.valueOf(1000.00))
                        .build())
                .build());
        userId = "1731b7dd-aa04-4592-bd41-5eae70929e27";
        userMap.put(userId, User.builder()
                .id(userId)
                .username("murphed")
                .firstname("Eddie")
                .lastname("Murphy")
                .sensitiveData(User.SensitiveData.builder()
                        .socialSecurityNumber("61040300101")
                        .accountNumber("555-2233448-66")
                        .salary(BigDecimal.valueOf(1000.00))
                        .build())
                .build());
    }

    public Collection<User> getAllUsers() {
        return userMap.values();
    }

    public User getUserById(String userId) {
        return userMap.get(userId);
    }

    public User createUser(User user) {
        User newUser = user.toBuilder()
                .id(UUID.randomUUID().toString())
                .build();
        userMap.put(newUser.getId(), newUser);
        return newUser;
    }

}
