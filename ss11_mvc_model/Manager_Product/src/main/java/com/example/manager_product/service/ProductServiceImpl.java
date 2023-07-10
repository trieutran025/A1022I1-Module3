package com.example.manager_product.service;

import com.example.manager_product.model.Product;
import com.example.manager_product.repository.ProductRepository;
import com.example.manager_product.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService{
    ProductRepository repository = new ProductRepositoryImpl();
    @Override
    public void add(Product product) {
        repository.add(product);
    }

    @Override
    public void delete(Product product) {
        repository.delete(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void update(Product product) {
        repository.update(product);
    }

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

}
