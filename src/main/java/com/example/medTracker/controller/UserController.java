package com.example.medTracker.controller;

import com.example.medTracker.dto.UserDTO;
import com.example.medTracker.jpa.entity.User;
import com.example.medTracker.jpa.repository.UserRepository;
import com.example.medTracker.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    @PostMapping("/addUser")
    public void addUser(@RequestBody UserDTO user) {
        log.info("New row" + userRepository.save(User.builder()
                .email(user.getEmail())
                .username(user.getUsername())
                .password(user.getPassword())
                .build()));
    }

    @GetMapping("/all")
    public List<UserDTO> getAll() {
        return userMapper.userToUserDtoList(userRepository.findAll());
    }

    @GetMapping
    public UserDTO getUser(@RequestParam int id) {
        return userMapper.userToUserDto(userRepository.findById(id).orElse(null));
    }
}
