package company.tothepoint.opa.userservice.web.convert;

import company.tothepoint.opa.userservice.model.User;
import company.tothepoint.opa.userservice.web.dto.UserDTO;

public class UserConverter {

    public static UserDTO convertToUserDTOWithoutSensitiveData(User user) {
        return userDTOBuilder(user)
                .build();
    }


    public static UserDTO convertToUserDTOWithSensitiveData(User user) {
        return userDTOBuilder(user)
                .sensitiveData(sensitiveDataBuilder(user)
                        .build())
                .build();
    }

    public static User convert(UserDTO userDTO) {
        return User.builder()
                .id(userDTO.getId())
                .username(userDTO.getUsername())
                .firstname(userDTO.getFirstname())
                .lastname(userDTO.getLastname())
                .sensitiveData(User.SensitiveData.builder()
                        .socialSecurityNumber(userDTO.getSensitiveData().getSocialSecurityNumber())
                        .salary(userDTO.getSensitiveData().getSalary())
                        .accountNumber(userDTO.getSensitiveData().getAccountNumber())
                        .spouse(userDTO.getSensitiveData().getSpouse())
                        .build())
                .build();
    }

    private static UserDTO.UserDTOBuilder userDTOBuilder(User user) {
        return UserDTO.builder()
                .id(user.getId())
                .username(user.getUsername())
                .firstname(user.getFirstname())
                .lastname(user.getLastname());
    }

    private static UserDTO.SensitiveDataDTO.SensitiveDataDTOBuilder sensitiveDataBuilder(User user) {
        return UserDTO.SensitiveDataDTO.builder()
                .socialSecurityNumber(user.getSensitiveData().getSocialSecurityNumber())
                .accountNumber(user.getSensitiveData().getAccountNumber())
                .salary(user.getSensitiveData().getSalary())
                .spouse(user.getSensitiveData().getSpouse());
    }

}
