package company.tothepoint.opa.userservice.web;

import company.tothepoint.opa.userservice.service.UserService;
import company.tothepoint.opa.userservice.web.convert.UserConverter;
import company.tothepoint.opa.userservice.web.dto.UserDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public ResponseEntity<Collection<UserDTO>> getAllUsers() {
        return ResponseEntity
                .ok(userService.getAllUsers().stream()
                        .map(UserConverter::convertToUserDTOWithoutSensitiveData)
                        .collect(Collectors.toList()));
    }

    @GetMapping("/{userId}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable("userId") String userId) {
        return ResponseEntity.ok(
                UserConverter.convertToUserDTOWithoutSensitiveData(
                        userService.getUserById(userId)
                )
        );
    }

    @GetMapping("/{userId}/sensitive")
    public ResponseEntity<UserDTO> getSensitiveUserDataByUserId(@PathVariable("userId") String userId) {
        return ResponseEntity.ok(
                UserConverter.convertToUserDTOWithSensitiveData(
                        userService.getUserById(userId)
                )
        );
    }

    @PostMapping
    public ResponseEntity<UserDTO> createUser(@RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(
                UserConverter.convertToUserDTOWithSensitiveData(
                        userService.createUser(
                                UserConverter.convert(userDTO)
                        )
                )
        );
    }


}
