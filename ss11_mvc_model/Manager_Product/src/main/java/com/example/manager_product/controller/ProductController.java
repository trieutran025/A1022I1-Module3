package com.example.manager_product.controller;

import com.example.manager_product.model.Category;
import com.example.manager_product.model.Product;
import com.example.manager_product.service.CategoryService;
import com.example.manager_product.service.CategoryServiceImpl;
import com.example.manager_product.service.ProductService;
import com.example.manager_product.service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action = "list";
        }
        switch (action){
            case "list":
            viewList(req,resp);
            break;
            case "detail":
                viewDetail(req,resp);
                break;
            case "create":
                viewCreate(req,resp);
                break;
            case "update":
                viewUpdate(req,resp);
                break;
            case "delete":
                viewDelete(req,resp);
                break;
            default:
                break;
        }
    }
    private void viewList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        req.setAttribute("products",products);
        req.getRequestDispatcher("/WEB-INF/views/product/list.jsp").forward(req,resp);
    }
    private void viewDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product products = productService.findById(id);
        req.setAttribute("products",products);
        req.getRequestDispatcher("/WEB-INF/views/product/detail.jsp").forward(req,resp);
    }
    private void viewCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories",categories);
        req.getRequestDispatcher("/WEB-INF/views/product/create.jsp").forward(req,resp);
    }
    private void viewUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories",categories);
        int id = Integer.parseInt(req.getParameter("id"));
        Product products = productService.findById(id);
        req.setAttribute("products",products);
        req.getRequestDispatcher("/WEB-INF/views/product/update.jsp").forward(req,resp);

    }
    private void viewDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories",categories);
        int id = Integer.parseInt(req.getParameter("id"));
        Product products = productService.findById(id);
        req.setAttribute("products",products);
        req.getRequestDispatcher("/WEB-INF/views/product/delete.jsp").forward(req,resp);
    }

  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            resp.sendRedirect("/product?action=list");
            return;
        }

        switch (action){
            case "create":
                doCreate(req,resp);
                break;
            case "delete":
                doDeletes(req,resp);
                break;
            case "update":
                doUpdate(req,resp);
            case "search":
                searchName(req,resp);
            default:
                break;
        }
    }

    private void searchName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        System.out.println(name);
        List<Product> searchProduct = SearchProductByName(name);
        req.setAttribute("searchProduct",searchProduct);
        req.getRequestDispatcher("/WEB-INF/views/product/search.jsp").forward(req,resp);
    }
    private List<Product> SearchProductByName(String name){
        List<Product> productsList  = productService.findAll();
        List<Product> products = new ArrayList<>();
        for(Product product : productsList){
            if(product.getName().contains(name)){
                products.add(product);
            }
        }
        return products;
    }

    private void doCreate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String date = req.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateRelease = null;
        try {
            dateRelease = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category category =categoryService.findById(categoryId);
        Product product = new Product(id, name, quantity, price, dateRelease, category);
        productService.add(product);
        resp.sendRedirect("/product?action=list");
    }
    private void doDeletes(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        productService.delete(product);
        resp.sendRedirect("/product?action=list");
    }
    private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String date = req.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateRelease = null;
        try {
            dateRelease = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category category =categoryService.findById(categoryId);
        Product products = new Product(id, name, quantity, price, dateRelease, category);
        productService.update(products);
        req.setAttribute("products",products);
        resp.sendRedirect("/product?action=list");
    }
    
}
