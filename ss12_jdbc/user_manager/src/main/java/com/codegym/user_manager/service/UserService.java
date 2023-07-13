package com.codegym.user_manager.service;

import com.codegym.user_manager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    List<User> findAll();

    void add(User user);

    User findById(int id);

    List<User> findByCountry(String country);

    boolean delete(User user) throws SQLException;

    boolean update(User user) throws SQLException;

    List<User> sortName();
}
