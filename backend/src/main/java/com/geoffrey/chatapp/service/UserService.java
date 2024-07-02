package com.geoffrey.chatapp.service;

import com.geoffrey.chatapp.dto.request.UpdateUserRequestDTO;
import com.geoffrey.chatapp.exception.UserException;
import com.geoffrey.chatapp.model.User;

import java.util.List;
import java.util.UUID;

public interface UserService {

    User findUserById(UUID id) throws UserException;

    User findUserByProfile(String jwt) throws UserException;

    User updateUser(UUID id, UpdateUserRequestDTO request) throws UserException;

    List<User> searchUser(String query);

    List<User> searchUserByName(String name);

}
