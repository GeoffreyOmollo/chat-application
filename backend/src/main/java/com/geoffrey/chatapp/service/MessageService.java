package com.geoffrey.chatapp.service;

import com.geoffrey.chatapp.dto.request.SendMessageRequestDTO;
import com.geoffrey.chatapp.exception.ChatException;
import com.geoffrey.chatapp.exception.MessageException;
import com.geoffrey.chatapp.exception.UserException;
import com.geoffrey.chatapp.model.Message;
import com.geoffrey.chatapp.model.User;

import java.util.List;
import java.util.UUID;

public interface MessageService {

    Message sendMessage(SendMessageRequestDTO req, UUID userId) throws UserException, ChatException;

    List<Message> getChatMessages(UUID chatId, User reqUser) throws UserException, ChatException;

    Message findMessageById(UUID messageId) throws MessageException;

    void deleteMessageById(UUID messageId, User reqUser) throws UserException, MessageException;

}
