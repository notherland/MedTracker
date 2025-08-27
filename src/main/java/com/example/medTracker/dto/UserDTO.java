package com.example.medTracker.dto;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
public class UserDTO {
    private String email;
    private String username;
    private String password;
}
