package com.codegym.user_manager.service;

import com.codegym.user_manager.model.User;
import com.codegym.user_manager.repository.UserRepository;
import com.codegym.user_manager.repository.UserRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository repository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public void add(User user) {
        repository.add(user);
    }

    @Override
    public User findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<User> findByCountry(String country) {
        return repository.findByCountry(country);
    }


    @Override
    public boolean delete(User user) throws SQLException {
        return repository.delete(user);
    }

    @Override
    public boolean update(User user) throws SQLException {
        return repository.update(user);
    }

    @Override
    public List<User> sortName() {
        return repository.sortName();
    }
}
