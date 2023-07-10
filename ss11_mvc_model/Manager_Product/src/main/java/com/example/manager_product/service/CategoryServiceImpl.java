package com.example.manager_product.service;

import com.example.manager_product.model.Category;
import com.example.manager_product.repository.CategoryRepository;
import com.example.manager_product.repository.CategoryRepositoryImpl;

import java.util.List;

public class CategoryServiceImpl implements CategoryService{
    CategoryRepository repository = new CategoryRepositoryImpl();
    @Override
    public Category findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<Category> findAll() {
        return repository.findAll();
    }
}
