package com.example.manager_product.repository;

import com.example.manager_product.model.Category;

import java.util.List;

public interface CategoryRepository {
    Category findById(int id);
    List<Category> findAll();
}
