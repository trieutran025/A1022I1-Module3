package com.example.manager_product.service;

import com.example.manager_product.model.Category;

import java.util.List;

public interface CategoryService {
    Category findById(int id);
    List<Category> findAll();
}
