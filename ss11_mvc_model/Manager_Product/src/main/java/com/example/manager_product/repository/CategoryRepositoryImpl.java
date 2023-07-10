package com.example.manager_product.repository;

import com.example.manager_product.model.Category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CategoryRepositoryImpl implements CategoryRepository{
    private static Map<Integer,Category> categoryMap;
    static {
        categoryMap = new HashMap<>();
        categoryMap.put(1,new Category(1,"Laptop"));
        categoryMap.put(2,new Category(2,"Smartphone"));
        categoryMap.put(3,new Category(3,"TiVi"));
        categoryMap.put(4,new Category(4,"Tablet"));
    }
    @Override
    public Category findById(int id) {
        return categoryMap.get(id);
    }

    @Override
    public List<Category> findAll() {
        return new ArrayList<>(categoryMap.values());
    }
}
